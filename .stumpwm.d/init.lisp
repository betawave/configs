;;; load all available modules
(stumpwm:init-load-path "~/.stumpwm.d/modules")
(load-module "cpu")

;;; Default-Modeline
(in-package :stumpwm)
(if (not (head-mode-line (current-head)))
    (toggle-mode-line (current-screen)
		      (current-head)))

(setf *screen-mode-line-format*
      (list '(:eval (run-shell-command "date '+%R, %F %a'|tr -d [:cntrl:]" t)) " | %t | %c | [^B%n^b] %W"))
(in-package :stumpwm-user)


;;; prepare stumpwm for modifications with emacs/slime
(ql:quickload "swank")
(defcommand start-swank () ()
	    (swank:create-server :port 4005
				 :style :SPAWN
				 :dont-close t)
	    (echo-string (current-screen)
			 "Starting swank. M-x slime-connect RET RET yes"))
(defcommand stop-swank () ()
	    (swank:stop-server 4005)
	    (echo-string (current-screen)
			 "Stopping swank"))
(let ((server-running nil))
  (defcommand swank () ()
	      "Toggle the swank server on/off"
	      (if server-running
		  (progn
		    (stop-swank)
		    (setf server-running nil))
		  (progn
		    (start-swank)
		    (setf server-running t)))))
(define-key *root-map* (kbd "C-s") "swank")


;;; setting up my emacs workflow
(run-shell-command "emacs --daemon")
(defcommand new-emacs-window () ()
  (run-shell-command "emacsclient -c -a \"\" -e \"(eshell)\" &"))
(define-key *root-map* (kbd "e") "new-emacs-window")

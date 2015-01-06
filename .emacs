;;; no startup-screen
(setq inhibit-startup-message t)

;;; no backupfiles
(setq make-backup-files nil)

;;; This was installed by package-install.el.
;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

;;; adding hook to compile c-files
(add-hook 'c-mode-common-hook 
          (lambda () (define-key c-mode-base-map (kbd "C-c C-l") 'compile)))


;;; creating compile-hook for VHDL-Mode
(defun add-compile-binding-vhdl-mode-hook ()
  ;; setting default compile command to make with a make-file in the parent-dirctory
  (setq compile-command "make -C .. -k")
  ;; binding compile-function to CRTL-c CRTL-k which was previously occupied by vcom
  (define-key vhdl-mode-map (kbd "C-c C-k") 'compile)
  )
(add-hook 'vhdl-mode-hook 'add-compile-binding-vhdl-mode-hook)

;;; Assembler for Spim uses "#", not ";"
(add-hook'asm-mode-set-comment-hook
  '(lambda () (setq asm-comment-char ?#)))

;;; include spim-mode
(load "~/.emacs.d/spim-mode/spim-mode.el" t)
;;; add melpa to package-achives-list
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;;; startup-config Interface
(setq inhibit-startup-message t)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
;;; prevent creation of backupfiles
(setq make-backup-files nil)

;;; add auto-comlete for elisp-files
(add-to-list 'load-path "~/.emacs.d/custom")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
(add-hook 'emacs-lisp-mode-hook 'auto-complete-mode)

(setq x-select-enable-clipboard t)

;;; slime-setup
(load (expand-file-name "~/quicklisp/slime-helper.el"))
(setq inferior-lisp-program "sbcl")

;;; starting server so that interaction via client can happen
(load "server")
(unless (server-running-p) (server-start))

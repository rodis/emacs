;;; rds-eshell.el --- eshell settings

(require 'em-rebind)
(load "em-joc")

(setq eshell-directory-name (concat cache-dir "/eshell/" ))
(setq eshell-hist-ignoredups t)
(setq eshell-cmpl-cycle-completions nil)

;; scroll to the bottom
(setq eshell-scroll-to-bottom-on-output t)
(setq eshell-scroll-show-maximum-output t)

(when (load "esh-module" t)
  (setq eshell-modules-list (append eshell-modules-list '(eshell-rebind eshell-joc))))


(provide 'rds-eshell)
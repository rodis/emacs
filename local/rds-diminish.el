(require 'diminish)

;; Major modes abbrev --------------------------------------------------------
(add-hook 'emacs-lisp-mode-hook (lambda() (setq mode-name "El")))
(add-hook 'python-mode-hook (lambda() (setq mode-name "Py")))

;; Minor modes abbrev --------------------------------------------------------
(eval-after-load "abbrev" '(diminish 'abbrev-mode "ab"))
(eval-after-load "auto-complete" '(diminish 'auto-complete-mode " ⓐ"))
(eval-after-load "yasnippet" '(diminish 'yas/minor-mode " ⓨ"))
(eval-after-load "flymake" '(diminish 'flymake-mode " ⓕ"))
(eval-after-load "workgroups" '(diminish 'workgroups-mode " ⓦ"))

;; Minor Mode (hidden) ------------------------------------------------------
(eval-after-load "xterm-title" '(diminish 'xterm-title-mode))
(eval-after-load "hi-lock" '(diminish 'hi-lock-mode ""))
(eval-after-load "outline" '(diminish 'outline-minor-mode ""))


(provide 'rds-diminish)
;;; custome --- Custom variables

;;; Commentary:

;;; Code:
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(transient-mark-mode t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flycheck-color-mode-line-error-face ((t (:inherit flycheck-fringe-warning :background "red" :foreground "#ffffff" :weight normal))))
 '(flycheck-color-mode-line-warning-face ((t (:inherit flycheck-fringe-warning :background "#859900" :foreground "#ffffff" :weight normal))))
 '(helm-selection ((t (:background "#303030" :underline nil))))
 '(helm-source-header ((t (:background "#1B1E1C" :foreground "#FFFFFF" :underline nil :weight bold))))
 '(persp-selected-face ((t (:foreground "#5FFFFF" :weight bold))))
)

;;; rds-custom.el ends here

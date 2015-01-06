;;; rds-bindings.el --- Custom keys

;;; Commentary:

;;; Code:
;;; function defined in rds-defuns.el
;;  ---------------------------------
;; (global-set-key (kbd "M-n") 'open-line-below)
;; (global-set-key (kbd "M-p") 'open-line-above)
(global-set-key (kbd "C-a") 'back-to-indentation-or-beginning-of-line)
(global-set-key (kbd "M-;") 'comment-or-uncomment-current-line-or-region)
;; (global-set-key (kbd "C-c d") 'duplicate-current-line-or-region)
;; (global-set-key (kbd "C-c l") 'mark-line)
;; (global-set-key (kbd "M-<up>") 'move-text-up)
;; (global-set-key (kbd "M-<down>") 'move-text-down)
;; (global-set-key (kbd "C-c y") 'djcb-duplicate-line)

;; duplicate a line and comment the first
;; (global-set-key (kbd "C-c c")(lambda()(interactive)(djcb-duplicate-line t)))

(global-set-key (kbd "C-x C-c")
                 (lambda () (interactive)
                   (if (y-or-n-p "Quit Emacs? ") (save-buffers-kill-emacs))))

(global-set-key (kbd "C-c r") 'revert-buffer)
(global-set-key (kbd "C-x b") 'anything)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x C-j") 'dired-jump)

(global-set-key (kbd "<f6>") 'ido-find-file)
(global-set-key (kbd "<f7>") 'projectile-find-file)
(global-set-key (kbd "<f8>") 'ido-switch-buffer)
(global-set-key (kbd "<f9>") 'ido-dired)

(global-unset-key [left])
(global-unset-key [up])
(global-unset-key [right])
(global-unset-key [down])


(provide 'rds-bindings)
;;; rds-bindings.el ends here

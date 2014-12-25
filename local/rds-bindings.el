;;; rds-bindings.el --- Custom keys

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
(global-set-key (kbd "M-x") 'helm-M-x)
;; Window switching. (C-x o goes to the next window)
;; (windmove-default-keybindings 'meta) ;; Meta+direction
;; moving left from the leftmost window in a frame will find the rightmost one
;; (setq windmove-wrap-around t)

;; (global-set-key "\C-w" 'backward-kill-word)


;;; Shortcuts
;;  ---------
;;(global-set-key (kbd "<f2>") 'visit-ansi-term)
;;(global-set-key (kbd "<f3>") ')
;;(global-set-key (kbd "<f4>") ')
;;(global-set-key (kbd "<f5>") ')
;;(global-set-key (kbd "<f5>") ')  anything-config use this as prefix
(global-set-key (kbd "<f6>") 'ido-find-file)
; (global-set-key (kbd "<f7>") 'anything)
(global-set-key (kbd "<f7>") 'helm-find-files)
(global-set-key (kbd "<f8>") 'helm-buffers-list)
(global-set-key (kbd "<f9>") 'ido-dired)
(global-set-key (kbd "<f10>") 'wg-save-wconfig)
(global-set-key (kbd "<f11>") 'wg-restore-saved-wconfig)
(global-set-key [(meta return)] 'toggle-fullscreen)

(global-set-key [?\M-0] 'wg-switch-to-workgroup-at-index-0)
(global-set-key [?\M-1] 'wg-switch-to-workgroup-at-index-1)
(global-set-key [?\M-2] 'wg-switch-to-workgroup-at-index-2)
(global-set-key [?\M-3] 'wg-switch-to-workgroup-at-index-3)
(global-set-key [?\M-4] 'wg-switch-to-workgroup-at-index-4)
(global-set-key [?\M-5] 'wg-switch-to-workgroup-at-index-5)
(global-set-key [?\M-6] 'wg-switch-to-workgroup-at-index-6)

(global-unset-key [left])
(global-unset-key [up])
(global-unset-key [right])
(global-unset-key [down])


(provide 'rds-bindings)

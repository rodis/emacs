(require 'key-chord)

(key-chord-mode 1)
(setq key-chord-two-keys-delay 0.025)

(key-chord-define-global "bk" 'backward-kill-word)
;; (key-chord-define-global "xj" 'dired-jump)
;; (key-chord-define-global "xo" 'switch-window)
;; (key-chord-define-global "xk" 'kill-buffer)
;; (key-chord-define-global "en" 'escreen-goto-next-screen)
;; (key-chord-define-global "ep" 'escreen-goto-prev-screen)

;; (key-chord-define-global "lb" 'open-line-below)
;; (key-chord-define-global "la" 'open-line-abovek)
;; (key-chord-define-global "dr" 'duplicate-current-line-or-region)
;; (key-chord-define-global "ml" 'mark-line)
;; (key-chord-define-global "tp" 'move-text-up)
;; (key-chord-define-global "tn" 'move-text-down)
;; (key-chord-define-global "dl" 'djcb-duplicate-line)
;; (key-chord-define-global "dc" '(lambda()(interactive)(djcb-duplicate-line t)))
;; (key-chord-define-global "rb" 'rename-this-buffer-and-file)
;; (key-chord-define-global "db" 'delete-this-buffer-and-file)


(provide 'rds-key-chord)
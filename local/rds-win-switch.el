(require 'win-switch)

(global-set-key (kbd "<f3>") 'win-switch-dispatch)

(setq win-switch-idle-time 0.60)
(setq win-switch-other-window-first nil)
(setq win-switch-window-threshold 0)
(setq win-switch-provide-visual-feedback nil)

(win-switch-define-key "," 'delete-other-windows)
(win-switch-add-key "n" 'next-window)
(win-switch-add-key "." 'delete-window)


(provide 'rds-win-switch)
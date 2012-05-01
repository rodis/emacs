(require 'workgroups)

(setq wg-default-session-file (concat system-specific-dir 
                                      "/" "default-workgroups-session"))
(setq wg-morph-on nil)
(setq wg-use-faces t)
(setq wg-emacs-exit-save-behavior nil)
(setq wg-prefix-key (kbd "C-c w"))
(setq wg-switch-to-first-workgroup-on-find-session-file nil)
;; (setq wg-mode-line-display-on nil)
(setq wg-workgroups-mode-exit-save-behavior nil)
(workgroups-mode t)


(provide 'rds-workgroups)
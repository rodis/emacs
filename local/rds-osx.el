;;; rds-osx.el --- OSX specific settings

;; Make Ido ignore freaking .DS_Store files
(ido-mode t)
(add-to-list 'ido-ignore-files "\\.DS_Store")

;; In dired, move deletions to trash
(setq delete-by-moving-to-trash t)


(provide 'rds-osx)
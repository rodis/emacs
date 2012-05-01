;;; rds-paths.el --- Load all custom library

(require 'rds-el-get)
(require 'rds-misc)
(require 'rds-defuns)
(require 'rds-autosave)
(require 'rds-recentf)
(require 'rds-ido)
(require 'rds-yasnippet)
(require 'rds-autocomplete)
(require 'rds-dired)
;; (require 'rds-w3m)
;; (require 'rds-escreen)
(require 'rds-win-switch)
(require 'rds-desktop)
(require 'rds-workgroups)
(require 'rds-uniquify)
(require 'rds-popwin)
(require 'rds-anything)
(require 'rds-backup-each-save.el)
(require 'rds-comint)
(require 'rds-ansiterm)
(require 'rds-diminish)
(require 'rds-org)
(require 'rds-ibuffer)
(require 'rds-key-chord)
(require 'rds-programming)
(require 'rds-bindings)
(require 'rds-erc)
(require 'rds-jabber)


(require 'rds-extra)

(cond ((eq system-type 'darwin)
       (require 'rds-osx)))


(provide 'rds-init)

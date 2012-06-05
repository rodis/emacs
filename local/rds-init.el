;;; rds-init.el --- Load all custom library

(require 'rds-el-get)
(require 'rds-colortheme)
(require 'rds-misc)
(require 'rds-defuns)
(require 'rds-ido)
(require 'rds-yasnippet)
(require 'rds-autocomplete)
(require 'rds-dired)
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
(require 'open-next-line)


(require 'rds-extra)

(cond ((eq system-type 'darwin)
       (require 'rds-osx)))


(provide 'rds-init)

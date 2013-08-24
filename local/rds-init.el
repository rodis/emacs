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
(require 'rds-helm)
(require 'rds-flycheck)
(require 'rds-powerline)
(require 'rds-backup-each-save.el)
(require 'rds-ansiterm)
(require 'rds-diminish)
(require 'rds-ibuffer)
(require 'rds-programming)
(require 'rds-bindings)
(require 'rds-expand-region)


(setq custom-file 
      (expand-file-name "rds-custom.el" local-dir))
(load custom-file 'noerror)

(cond ((eq system-type 'darwin)
       (require 'rds-osx)))


(provide 'rds-init)

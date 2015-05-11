;;; rds-init.el --- Load all custom library

;;; Commentary:

;;; Code:
(require 'rds-elget)
(require 'rds-misc)
(require 'rds-defuns)
(require 'rds-ido)
(require 'rds-yasnippet)
(require 'rds-autocomplete)
(require 'rds-dired)
(require 'rds-win-switch)
(require 'rds-uniquify)
;; (require 'rds-popwin)
(require 'rds-guide-key)
(require 'rds-flycheck)
(require 'rds-ergoemacs)
(require 'rds-backup-each-save.el)
(require 'rds-diminish)
(require 'rds-ibuffer)
(require 'rds-programming)
(require 'rds-bindings)

(setq custom-file (expand-file-name "rds-custom.el" local-dir))
(load custom-file 'noerror)

(cond ((eq system-type 'darwin)
       (require 'rds-osx)))


(provide 'rds-init)
;;; rds-init.el ends here

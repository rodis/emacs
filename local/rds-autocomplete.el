;;; rds-autocomplete.el --- Set up of the auto-complete library

(require 'auto-complete-config)

(setq ac-comphist-file  (concat cache-dir "/ac-comphist.dat" ))
(ac-config-default)


(provide 'rds-autocomplete)
;;; rds-autocomplete.el --- Set up of the auto-complete library

;;; Commentary:
(require 'auto-complete-config)

;;; Code:
(setq ac-comphist-file  (concat cache-dir "/ac-comphist.dat" ))
(ac-config-default)


(provide 'rds-autocomplete)
;;; rds-autocomplete.el ends here

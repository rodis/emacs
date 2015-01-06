;;; rds-yasnippet.el --- Yasnippet

;;; Commentary:

;;; Code:
(require 'yasnippet)
(yas/initialize)
(yas/load-directory (concat utils-dir "/snippets"))

(setq ac-stop-flymake-on-completing t)


(provide 'rds-yasnippet)
;;; rds-yasnippet.el ends here

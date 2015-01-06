;;; rds-uniquify --- uniquify conf

;;; Commentary:

;;; Code:
(require 'uniquify)

(setq
  uniquify-buffer-name-style 'reverse
  uniquify-separator "|"
  uniquify-after-kill-buffer-p t
  uniquify-ignore-buffers-re "^\\*"
)


(provide 'rds-uniquify)
;;; rds-uniquify.el ends here

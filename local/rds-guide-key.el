;;; rds-guide-key.el --- guide-key configuration

;;; Commentary:
;;; For some reason putting guide-key conf in the rds-el-get file doesn't work

;;; Code:
(require 'guide-key)
(setq guide-key/guide-key-sequence '("C-c p"))
(setq guide-key/popup-window-position 'bottom)


(provide 'rds-guide-key)

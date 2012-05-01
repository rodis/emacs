(require 'desktop)

(desktop-save-mode 1)
(setq desktop-save (quote if-exists))
(setq desktop-base-file-name "emacs-desktop")
(setq desktop-path '("." "~/.emacs.d/"))
(setq desktop-clear-preserve-buffers 
      (quote (
        "\\*scratch\\*"
        "\\*Messages\\*"
        "\\*server\\*"
        "\\*tramp/.+\\*"
        "\\*terminal\\*"
        "^.*\\*w3m\\*\\(<[0-9]*>\\)?$"
        "\\*Pymacs\\*"
)))

;; ----------------------------------------------------
;; save a bunch of variables to the desktop file
;; for lists specify the len of the maximal saved data also
;;
;; (setq desktop-globals-to-save
;;       (append '((extended-command-history . 30)
;;                 (file-name-history        . 100)
;;                 (grep-history             . 30)
;;                 (compile-history          . 30)
;;                 (minibuffer-history       . 50)
;;                 (query-replace-history    . 60)
;;                 (read-expression-history  . 60)
;;                 (regexp-history           . 60)
;;                 (regexp-search-ring       . 20)
;;                 (search-ring              . 20)
;;                 (shell-command-history    . 50)
;;                 tags-file-name
;;                 register-alist)))


(provide 'rds-desktop)
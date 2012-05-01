;;; rds-init-irc.el --- Load all custom library

(require 'rds-misc)
(require 'rds-ido)
(require 'rds-ibuffer)
(require 'rds-bindings)

(load "~/.emacs.d/el-get/popwin/popwin.el")
(load "~/.emacs.d/el-get/anything/anything.el")
(load "~/.emacs.d/el-get/anything/anything-match-plugin.el")
(load "~/.emacs.d/el-get/anything/anything-config.el")
(load "~/.emacs.d/el-get/erc-highlight-nicknames/erc-highlight-nicknames.el")
(load "~/.emacs.d/el-get/win-switch/win-switch.el")

(require 'rds-win-switch)
(require 'rds-popwin)
(require 'rds-anything)
(require 'rds-erc)


(cond ((eq system-type 'darwin)
       (require 'rds-osx)))


(provide 'rds-init-irc)

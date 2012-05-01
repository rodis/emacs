(require 'popwin)

(setq display-buffer-function 'popwin:display-buffer)
(setq popwin:special-display-config 
      '(("*Help*" :height 30)
        ("*Completions*" :noselect t)
        ("*Occur*" :stick t)
        ("*Browse code*")
))

(setq anything-samewindow nil)
(push '("\\*anything[[:blank:]]*[a-zA-Z -]*\\*" :height 20 :regexp t) 
      popwin:special-display-config)


(provide 'rds-popwin)

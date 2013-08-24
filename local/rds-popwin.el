(require 'popwin)

(setq display-buffer-function 'popwin:display-buffer)
(setq popwin:special-display-config 
      '(("*Help*" :height 30)
        ("*Completions*" :noselect t)
        ("*Occur*" :stick t)
        ("*Browse code*")
))

(setq helm-full-frame nil)
(push '("^\*helm .+\*$" :regexp t) popwin:special-display-config)
(push '("^\*helm-.+\*$" :regexp t) popwin:special-display-config)
(provide 'rds-popwin)
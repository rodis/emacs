;; pylookup settings
(autoload 'pylookup-lookup "pylookup")
(autoload 'pylookup-update "pylookup")
(setq pylookup-program "~/.emacs.d/utils/python_doc/pylookup.py")
(setq pylookup-db-file "~/.emacs.d/utils/python_doc/pylookup.db")
(global-set-key "\C-ch" 'pylookup-lookup)

(setq browse-url-browser-function 'w3m-browse-url)


(provide 'rds-python-lookup)

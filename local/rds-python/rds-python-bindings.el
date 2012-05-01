(add-hook 'python-mode-hook
          #'(lambda ()
              (define-key python-mode-map (kbd "C-c C-t") 'add-trace)
              (define-key python-mode-map (kbd "C-c C-a") 'py-snippet-attribute)
))


(provide 'rds-python-bindings)
(setq skeleton-pair t)
(global-set-key "(" 'skeleton-pair-insert-maybe)
(global-set-key "[" 'skeleton-pair-insert-maybe)
(global-set-key "{" 'skeleton-pair-insert-maybe)
(global-set-key "\"" 'skeleton-pair-insert-maybe)

;; Just python
(add-hook 'python-mode-hook
  (lambda ()
     (cond ((boundp 'python-mode-map)
            (define-key python-mode-map "'" 'skeleton-pair-insert-maybe))
           ((boundp 'py-mode-map)
            (define-key py-mode-map "'" 'skeleton-pair-insert-maybe)))))


(provide 'rds-python-editing)
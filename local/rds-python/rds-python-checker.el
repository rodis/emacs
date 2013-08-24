;; enable pylint
(load-library "pylint.el")

;;enable pyflakes on the fly
(add-hook 'find-file-hook 'flymake-find-file-hook)
(when (load "flymake" t)
  (defun flymake-pyflakes-init ()
    (let* 
        ((temp-file (flymake-init-create-temp-buffer-copy
                     ;; make it both future- and backwards-compatible
                     (if (fboundp 'flymake-create-temp-copy)
                         'flymake-create-temp-copy
                       'flymake-create-temp-inplace)))
         (local-file (file-relative-name
                      temp-file
                      (file-name-directory buffer-file-name))))
      
      ;; (list "~/.emacs.d/python-bin/pycheckers"  (list local-file))
      (list "/Users/rods/.emacs.d/python-bin/pyflakes" (list local-file))
))

   (add-to-list 'flymake-allowed-file-name-masks
             '("\\.py\\'" flymake-pyflakes-init)))

;; Let's run 4 checks at once instead.
(setq flymake-max-parallel-syntax-checks 4)
;; I want my copies in the system temp dir.
(setq flymake-run-in-place nil)
;; This lets me say where my temp dir is.
(setq temporary-file-directory "/Users/rods/.emacs.d/tmp/")
;; I want to see at most the first 4 errors for a line.
(setq flymake-number-of-errors-to-display 4)

(load-library "flymake-cursor")


(provide 'rds-python-checker)

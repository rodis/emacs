(require 'backup-each-save)
    (add-hook 'after-save-hook 'backup-each-save)
    (defun backup-each-save-filter (filename)
      (let ((ignored-filenames
    	 '("^/tmp"
           "^/home/rds/Desktop"
           "semantic.cache$"
           "\\.emacs-places$"
           "\\.recentf$"
           ".newsrc\\(\\.eld\\)?"
           ))
    	(matched-ignored-filename nil))
        (mapc
         (lambda (x)
           (when (string-match x filename)
    	 (setq matched-ignored-filename t)))
         ignored-filenames)
        (not matched-ignored-filename)))
    (setq backup-each-save-filter-function 'backup-each-save-filter)


(provide 'rds-backup-each-save.el)
;; dired configurations  -----------------------------------------------------
(require 'dired)
(setq dired-listing-switches "-alh")


;; dired-x configurations ----------------------------------------------------
(require 'dired-x) 

(setq dired-omit-files 
      (rx (or (seq bol (? ".") "#")         ;; emacs autosave files 
              (seq "~" eol)                 ;; backup-files 
              (seq bol "svn" eol)           ;; svn dirs 
              (seq ".pyc" eol)
              )))
(setq dired-omit-extensions
      (append dired-latex-unclean-extensions
              dired-bibtex-unclean-extensions
              dired-texinfo-unclean-extensions))
(add-hook 'dired-mode-hook (lambda () (dired-omit-mode 1)))


;; dired+ configurations -----------------------------------------------------
;; (require 'dired+)
;; (toggle-diredp-find-file-reuse-dir t)

;; ;; restore dired-x find marked file behaviour
;; (defun rds-dired-do-find-marked-files (&optional noselect)
;;   (interactive "P")
;;   (rds-dired-simultaneous-find-file (dired-get-marked-files) noselect))


;; (defun rds-dired-simultaneous-find-file (file-list noselect)
;;   (let (size)
;;     (if noselect
;;         ;; Do not select the buffer.
;;         (find-file-noselect (car file-list))
;;       ;; We will have to select the buffer.  Calculate and check window size.
;;       (setq size (/ (window-height) (length file-list)))
;;       (or (<= window-min-height size)
;;           (error "Too many files to visit simultaneously.  Try C-u prefix"))
;;       (find-file (car file-list)))
;;     ;; Decrement.
;;     (dolist (file (cdr file-list))
;;       (if noselect
;;           ;; Do not select the buffer.
;;           (find-file-noselect file)
;;         ;; Vertically split off a window of desired size.  Upper window will
;;         ;; have SIZE lines.  Select lower (larger) window.  We split it again.
;;         (select-window (split-window nil size))
;;         (find-file file)))))

;; (define-key dired-mode-map "G" 'rds-dired-do-find-marked-files)


(provide 'rds-dired)
(require 'ibuffer)

;; Use human readable Size column instead of original one
(define-ibuffer-column size-h
  (:name "Size" :inline t)
  (cond
   ((> (buffer-size) 1000000) (format "%7.1fM" (/ (buffer-size) 1000000.0)))
   ((> (buffer-size) 1000) (format "%7.1fk" (/ (buffer-size) 1000.0)))
   (t (format "%8d" (buffer-size)))))

;; Modify the default ibuffer-formats
(setq ibuffer-formats
      '((mark modified read-only " "
              (name 25 25 :left :elide)
              " "
              (size-h 9 -1 :right)
              " "
              (mode 16 16 :left :elide)
              " " filename-and-process)
        (mark " "
              (name 16 -1)
              " " filename)))

;; organize buffer in categories
(setq ibuffer-saved-filter-groups
      '(("default"
               ("Programming"
                (or
                 (mode . c-mode)
                 (mode . perl-mode)
                 (mode . python-mode)
                 (mode . emacs-lisp-mode)))
               ("Web Dev" (or (mode . html-mode)
                              (mode . css-mode)))
               ("Dired" (mode . dired-mode))
               ("Shell"  (mode . shell-mode))
               ("Ansi Term" (mode . term-mode))
               ("Emacs" 
                (or
                 (name . "^\\*scratch\\*$")
                 (name . "^\\*Messages\\*$")))
               ("PDF" (mode . doc-view-mode))
               ("Org" (or (mode . org-mode)
                          (filename . "OrgMode")))
               ("Magit" (name . "\*magit"))
               ("Subversion" (name . "\*svn"))
               ("W3M" (mode . w3m-mode))
               ("Jabber" (name . "^\\*-jabber-[a-zA-Z ]+-\\*$"))
               ("ERC" (mode . erc-mode))
               ("Help" (or (name . "\*Help\*")
                           (name . "\*Apropos\*")
                           (name . "\*info\*")))
)))

(add-hook 'ibuffer-mode-hook
  (lambda ()
    (ibuffer-auto-mode 1)
    (ibuffer-switch-to-saved-filter-groups "default")))


;; don't show the names of filter groups which are empty
(setq ibuffer-show-empty-filter-groups nil)

;; don't ask for confirmation of "dangerous" operations
;; (setq ibuffer-expert t)

;; hide all anything-related buffers
(require 'ibuf-ext)
(add-to-list 'ibuffer-never-show-predicates 
             "^\\*anything[[:blank:]]?[a-zA-Z-]*\\\*")


(provide 'rds-ibuffer)
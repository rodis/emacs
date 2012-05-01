(require 'org-install)

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; Set to the location of your Org files on your local system
(setq org-directory "~/Dropbox/org")

;; The files to be used for agenda display
(setq org-agenda-files (quote ("~/Dropbox/org/notes.org")))

(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "NEXT(n)" "STARTED(s)" "|" "DONE(d!/!)")
              (sequence "WAITING(w@/!)" "SOMEDAY(S!)" "|" "CANCELLED(c@/!)" "PHONE")
              (sequence "OPEN(O!)" "|" "CLOSED(C!)"))))

(setq org-todo-keyword-faces 
      (quote (("TODO" :foreground "red" :weight bold)
              ("NEXT" :foreground "blue" :weight bold)
              ("STARTED" :foreground "blue" :weight bold)
              ("DONE" :foreground "forest green" :weight bold)
              ("WAITING" :foreground "orange" :weight bold)
              ("SOMEDAY" :foreground "magenta" :weight bold)
              ("CANCELLED" :foreground "forest green" :weight bold)
              ("OPEN" :foreground "blue" :weight bold)
              ("CLOSED" :foreground "forest green" :weight bold)
              ("PHONE" :foreground "forest green" :weight bold)
              ("█" :foreground "forest green")
              ("▇" :foreground "red")
              ("▆" :foreground "orange")
              ("▅" :foreground "magenta")
              ("▃" :foreground "blue")
)))


;; ----------------------------------------------------------------------------
;; Org mobile prefs
;; ----------------------------------------------------------------------------

;; mobileorg root directory
(setq org-mobile-directory "~/Dropbox/MobileOrg")

;; name of the file where new notes will be stored
(setq org-mobile-inbox-for-pull "~/Dropbox/index.org")
(setq org-mobile-force-id-on-agenda-items nil)
(setq org-agenda-files (quote ("~/Dropbox/org")))


(setq org-capture-templates '(
  ("e" 
   "Emacs configuration" 
   entry 
   (file+headline (concat org-dir "/emacs-todo.org") "Emacs configuration")
   "* TODO %?\n  %i\n")
))

(define-key global-map "\C-cc" 'org-capture)

(provide 'rds-org)
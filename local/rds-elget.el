;;; rds-el-get --- Package Manager

;;; Commentary:

;;; Code:
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(setq el-get-master-branch t)
(unless (require 'el-get nil t)
  (url-retrieve
   "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
   (lambda (s)
     (end-of-buffer)
     (eval-print-last-sexp))))

;; local sources
(setq el-get-sources '(

	(:name backup-each-save
           :url "http://www.emacswiki.org/emacs/download/backup-each-save.el"
           :type emacswiki)

	(:name popup
           :type github
           :pkgname "auto-complete/popup-el"
           :submodule nil)

	(:name auto-complete
           :type github
           :pkgname "auto-complete/auto-complete"
           :submodule nil)

	(:name fuzzy
           :type github
           :pkgname "auto-complete/fuzzy-el")

	(:name powerline
           :type github
           :pkgname "milkypostman/powerline"
           :compile nil
           :autoloads nil)

	(:name flycheck-color-mode-line
           :type github
           :pkgname "syl20bnr/flycheck-color-mode-line")

	(:name python24
	       :type http
	       :url "http://repo.or.cz/w/emacs.git/blob_plain/refs/heads/emacs-24:/lisp/progmodes/python.el")

    (:name ergoemacs-mode
           :type github
           :pkgname "ergoemacs/ergoemacs-mode")

    (:name flx-ido
           :type github
           :pkgname "lewang/flx")

    (:name flycheck
           :type github
           :pkgname "lunaryorn/flycheck"
           :depends (s dash cl-lib f pkg-info))

	(:name win-switch
           :url "http://www.emacswiki.org/emacs/download/win-switch.el"
           :type emacswiki)

    (:name monokai
           :type github
           :pkgname "oneKelvinSmith/monokai-emacs"
           :before (progn
                     (add-to-list 'custom-theme-load-path
                                  "~/.emacs.d/el-get/monokai"))
           :after (progn
                    (load-theme 'monokai :no-confirm)))

    (:name expand-region
           :after (progn
                    (global-set-key [?\M-9] 'er/expand-region)
                    (setq expand-region-contract-fast-key "0")
                    (setq expand-region-reset-fast-key "-")))

    (:name smart-mode-line
           :after (progn
                    (setq sml/no-confirm-load-theme t)
                    (sml/setup)))

    (:name let-alist
           :website "http://elpa.gnu.org/packages/let-alist.html"
           :description "Easily let-bind values of an assoc-list by their names"
           :type elpa
           :builtin "25")

))

(setq my-packages
      (append
       '(
         el-get
         diminish
         dired+
         popwin
         auto-complete
         expand-region
         markdown-mode
         magit
         f
         projectile
         ido-vertical-mode
         )

       (mapcar 'el-get-source-name el-get-sources)))

(el-get 'sync my-packages)

(setq el-get-git-shallow-clone t)


(provide 'rds-elget)
;;; rds-elget.el ends here

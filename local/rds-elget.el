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
           :submodule nil
           :shallow t)

	(:name auto-complete
           :type github
           :pkgname "auto-complete/auto-complete"
           :submodule nil
           :shallow t)

	(:name fuzzy
           :type github
           :pkgname "auto-complete/fuzzy-el"
           :shallow t)

	(:name powerline
           :type github
           :pkgname "milkypostman/powerline"
           :compile nil
           :autoloads nil
           :shallow t)

	(:name flycheck-color-mode-line
           :type github
           :pkgname "syl20bnr/flycheck-color-mode-line"
           :shallow t)

	(:name python24
	       :type http
	       :url "http://repo.or.cz/w/emacs.git/blob_plain/refs/heads/emacs-24:/lisp/progmodes/python.el")

    (:name helm
           :type github
           :pkgname "emacs-helm/helm"
           :compile nil
           :features helm-config
           :shallow t)

    (:name ergoemacs-mode
           :type github
           :pkgname "ergoemacs/ergoemacs-mode"
           :shallow t)

    (:name flycheck
           :type github
           :pkgname "lunaryorn/flycheck"
           :depends (s dash cl-lib f pkg-info)
           :shallow t)

	(:name win-switch
           :url "http://www.emacswiki.org/emacs/download/win-switch.el"
           :type emacswiki)

    (:name monokai
           :type github
           :pkgname "oneKelvinSmith/monokai-emacs"
           :shallow t
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
))

(setq my-packages
      (append
       '(
         el-get
         diminish
         dired+
         popwin
         auto-complete
         helm
         expand-region
         markdown-mode
         perspective
         )

       (mapcar 'el-get-source-name el-get-sources)))

(el-get 'sync my-packages)

(setq el-get-git-shallow-clone t)


(provide 'rds-elget)
;;; rds-elget.el ends here

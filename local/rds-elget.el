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
           :description "Backup each savepoint of a file"
           :url "http://www.emacswiki.org/emacs/download/backup-each-save.el"
           :type emacswiki)

	(:name popup
           :website "https://github.com/auto-complete/popup-el"
           :description "Visual Popup Interface Library for Emacs"
           :type github
           :pkgname "auto-complete/popup-el"
           :submodule nil
           :shallow t)

	(:name auto-complete
           :website "https://github.com/auto-complete/auto-complete"
           :description "The most intelligent auto-completion extension."
           :type github
           :pkgname "auto-complete/auto-complete"
           :submodule nil
           :shallow t)

	(:name fuzzy
           :website "https://github.com/auto-complete/fuzzy-el"
           :description "Fuzzy matching utilities for GNU Emacs"
           :type github
           :pkgname "auto-complete/fuzzy-el"
           :shallow t)

	(:name powerline
           :description "Emacs version of the Vim powerline."
           :type github
           :pkgname "milkypostman/powerline"
           :compile nil
           :autoloads nil
           :shallow t)

	(:name flycheck-color-mode-line
           :description "An Emacs minor-mode for Flycheck which colors the mode line according to the Flycheck state of the current buffer."
           :type github
           :pkgname "syl20bnr/flycheck-color-mode-line"
           :shallow t)

	;; (:name emacs-color-theme
    ;;        :description "Emacs color themes inspired by some ST2 color themes"
    ;;        :type github
    ;;        :pkgname "rodis/emacs-color-themes"
    ;;        :shallow t
    ;;        :post-init (lambda ()
    ;;                     (add-to-list 'custom-theme-load-path "~/.emacs.d/el-get/emacs-color-theme/themes")))

	(:name python24
	       :description "Python's flying circus support for Emacs (24.x)"
	       :type http
	       :url "http://repo.or.cz/w/emacs.git/blob_plain/refs/heads/emacs-24:/lisp/progmodes/python.el")

    (:name helm
           :description "Emacs incremental and narrowing framework"
           :type github
           :pkgname "emacs-helm/helm"
           :compile nil
           :features helm-config
           :shallow t)

    (:name ergoemacs-mode
           :description ""
           :type github
           :pkgname "ergoemacs/ergoemacs-mode"
           :shallow t)

    (:name flycheck
           :type github
           :pkgname "lunaryorn/flycheck"
           :description "On-the-fly syntax checking extension"
           :depends (s dash cl-lib f pkg-info)
           :shallow t)

	(:name win-switch
           :description "Windows navigation library"
           :url "http://www.emacswiki.org/emacs/download/win-switch.el"
           :type emacswiki)

    (:name monokai
           :type github
           :pkgname "oneKelvinSmith/monokai-emacs"
           :description "Monokai is a port of the popular TextMate theme Monokai"
           :shallow t
           :post-init (progn
                        (add-to-list 'custom-theme-load-path
                                     "~/.emacs.d/el-get/monokai")))
;;     (:name perspective
;;            :after (progn (persp-mode)))
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

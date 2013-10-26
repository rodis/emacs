;;; rds-el-get --- Package Manager

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
	    :type emacswiki)

	(:name workgroups
	     :description "Window managment for emacs"
	     :type github
	     :pkgname "tlh/workgroups.el"
	     :branch "experimental"
		 :shallow t)

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
		 :shallow t)

	(:name flycheck-color-mode-line
	      :description "An Emacs minor-mode for Flycheck which colors the mode line according to the Flycheck state of the current buffer."
	      :type github
	      :pkgname "syl20bnr/flycheck-color-mode-line"
		  :shallow t)

	(:name emacs-color-theme
		   	:description "Emacs color themes inspired by some ST2 color themes"
	   	:type github
	   	:pkgname "rodis/emacs-color-themes"
		:shallow t
		:post-init (lambda ()
			(add-to-list 'custom-theme-load-path "~/.emacs.d/el-get/emacs-color-theme/themes")))

	(:name base16-themes
		:description "Base16 provides carefully chosen set of sixteen colors suitable for a wide range of applications."
	   	:website "http://chriskempson.github.io/base16/"
	   	:type github
	    	:pkgname "neil477/base16-emacs"
		:shallow t
	   	:post-init (add-to-list 'custom-theme-load-path "~/.emacs.d/el-get/base16-themes"))

	(:name xterm-title
		  	:description "Update xterm titles"
		    :type http
		    :url "https://gist.github.com/rodis/8212a657f2c82ce0f8cf/raw"
		 	:localname "xterm-title.el"
			:shallow t)

	(:name xterm-frobs
		   	 :description "manipulate xterm when running emacs in tty mode"
		   	 :type http
		   	 :url "http://www.splode.com/~friedman/software/emacs-lisp/src/xterm-frobs.el")

	(:name pbcopy
		  	 :description "Mac os x clipboard integration"
		     :type http
		     :url "https://gist.github.com/raw/1023272/7b0db196d1184e3a2f43b31c601c415f1d41830f/pbcopy.el")

	(:name python24
	       :description "Python's flying circus support for Emacs (24.x)"
	       ; :builtin "Emacs 24.3"
	       :type http
	       :url "http://repo.or.cz/w/emacs.git/blob_plain/refs/heads/emacs-24:/lisp/progmodes/python.el")

   (:name helm
          :description "Emacs incremental and narrowing framework"
          :type github
          :pkgname "emacs-helm/helm"
          :compile nil
          :features helm-config
          :shallow t)
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
		 win-switch
		 flycheck
		 expand-region
         undo-tree
         )

       (mapcar 'el-get-source-name el-get-sources)))

(el-get 'sync my-packages)

(provide 'rds-el-get)

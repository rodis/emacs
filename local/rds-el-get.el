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

  ; (:name python-mode
  ;        :type emacsmirror
  ;        :description "Major mode for editing Python programs"
  ;        :features (python-mode doctest-mode)
  ;        :compile nil
  ;        :load "test/doctest-mode.el"
  ;        :before (lambda () 
  ;              (setq py-install-directory "~/.emacs.d/el-get/python-mode"))
  ;        :post-init (lambda ()
  ;              (add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
  ;              (add-to-list 'interpreter-mode-alist '("python" . python-mode))
  ;              (autoload 'python-mode "python-mode" "Python editing mode." t)))

  (:name workgroups
         :description "Window managment for emacs"
         :type github
         :pkgname "tlh/workgroups.el"
         :branch "experimental")

  (:name powerline
	     :description "Emacs version of the Vim powerline."
	     :type github
	     :pkgname "milkypostman/powerline")

 (:name flycheck-color-mode-line
        :description "An Emacs minor-mode for Flycheck which colors the mode line according to the Flycheck state of the current buffer."
        :type github
        :pkgname "syl20bnr/flycheck-color-mode-line")

 (:name emacs-color-theme
  	   	:description "Emacs color themes inspired by some ST2 color themes"
     	:type github
     	:pkgname "owainlewis/emacs-color-themes"
		:post-init (lambda ()
			(add-to-list 'custom-theme-load-path "~/.emacs.d/el-get/emacs-color-theme/themes")))

 (:name base16-themes
 		:description "Base16 provides carefully chosen set of sixteen colors suitable for a wide range of applications."
     	:website "http://chriskempson.github.io/base16/"
     	:type github
      	:pkgname "neil477/base16-emacs"
     	:post-init (add-to-list 'custom-theme-load-path "~/.emacs.d/el-get/base16-themes"))

 (:name xterm-title
  	  	 :description "Update xterm titles"
  	     :type http
  	     :url "http://www.splode.com/~friedman/software/emacs-lisp/src/xterm-title.el")
  
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
         )

       (mapcar 'el-get-source-name el-get-sources)))

(el-get 'sync my-packages)

(provide 'rds-el-get)
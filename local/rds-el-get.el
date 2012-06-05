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

  (:name magit
         :after (lambda () 
                  (global-set-key (kbd "C-x C-z") 'magit-status)))

  (:name backup-each-save
         :description "Backup each savepoint of a file"
         :type emacswiki)
  
  (:name key-chord
         :description "Map pairs of simultaneously pressed keys to commands"
         :type emacswiki)

  (:name notify
         :description "Notification manager"
         :type emacswiki
         :compile nil)
  
  (:name python-mode
         :type emacsmirror
         :description "Major mode for editing Python programs"
         :features (python-mode doctest-mode)
         :compile nil
         :load "test/doctest-mode.el"
         :before (lambda () 
               (setq py-install-directory "~/.emacs.d/el-get/python-mode"))
         :post-init (lambda ()
               (add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
               (add-to-list 'interpreter-mode-alist '("python" . python-mode))
               (autoload 'python-mode "python-mode" "Python editing mode." t)))

  (:name emacs-bash-completion
         :description "Dynamic completion hooks for shell-mode "
         :type github
         :pkgname "szermatt/emacs-bash-completion")

  (:name workgroups
         :description "Window managment for emacs"
         :type github
         :pkgname "tlh/workgroups.el"
         :branch "experimental")

  (:name protbuf
         :description "Protect buffers from accidental killing"
         :type emacswiki
         :url "http://www.emacswiki.org/emacs/download/ProtBuf"
         :build `(,(concat "mv " 
                          (expand-file-name "protbuf/ProtBuf" el-get-dir) " "
                          (expand-file-name "protbuf/protbuf.el" el-get-dir))))

  (:name open-next-line
         :description ""
         :type http
         :url "https://raw.github.com/gabrielelanaro/emacs-for-python/master/extensions/open-next-line.el")

  (:name flymake
         :description "Continuous syntax checking for Emacs"
         :type github
         :pkgname "illusori/emacs-flymake")

  (:name win-switch
         :description "Navigating Emacs windows"
         :type http
         :url "https://raw.github.com/leoncamel/emacs-utils/5b345e163f026070fa6014171f7b83f80faf484d/win-switch/win-switch.el")

  (:name color-theme-solarized
         :description "\Emacs highlighting using Ethan Schoonover's Solarized 
                       color scheme"
         :type github
         :pkgname "sellout/emacs-color-theme-solarized"
         :depends color-theme
         :prepare (progn
                    (autoload 'color-theme-solarized-light 
                      "color-theme-solarized"
                      "color-theme: solarized-light" t)
                    (autoload 'color-theme-solarized-dark 
                      "color-theme-solarized"
                      "color-theme: solarized-dark" t)))

  (:name autopair
         :description "Automagically pair braces and quotes"
         :type github
         :pkgname "m2ym/autopair-el")

  (:name deft
         :features ())

  (:name go-mode
         :features ())

))

(setq my-packages
      (append
       '(
         el-get
         diminish
         org-mode
         dired+
         anything
         popwin
         auto-complete
         goto-last-change
         go-mode
         js2-mode
         )

       (mapcar 'el-get-source-name el-get-sources)))

(el-get 'sync my-packages)


(provide 'rds-el-get)
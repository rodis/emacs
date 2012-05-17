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

  ;; (:name emacs-w3m
  ;;        :description "A simple Emacs interface to w3m"
  ;;        :type emacsmirror
  ;;        :url "https://github.com/emacsmirror/w3m.git"
  ;;        :build `("autoconf" ("./configure" ,
  ;;                             (concat "--with-emacs=" el-get-emacs)) "make")
  ;;        :build/windows-nt ("sh /usr/bin/autoconf" "sh ./configure" "make")
  ;;        :info "doc")

  (:name backup-each-save
         :description "Backup each savepoint of a file"
         :type emacswiki
         :url "http://www.emacswiki.org/emacs-de/download/backup-each-save.el")
  
  (:name key-chord
         :description "Map pairs of simultaneously pressed keys to commands"
         :type emacswiki
         :url "http://www.emacswiki.org/emacs/download/key-chord.el")

  (:name popwin
         :description "Popup window manager "
         :type emacsmirror
         :url "https://github.com/emacsmirror/popwin.git")

  (:name notify
         :description "Notification manager"
         :type emacswiki
         :url "http://www.emacswiki.org/emacs/download/notify.el"
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

  (:name bash-completion
         :description "Dynamic completion hooks for shell-mode "
         :type emacsmirror
         :url "https://github.com/emacsmirror/bash-completion.git")

  (:name workgroups
         :description "Window managment for emacs"
         :type git
         :url "git://github.com/tlh/workgroups.el.git"
         :branch "experimental")

  (:name smart-operator
         :description ""
         :type http
         :url "https://raw.github.com/xwl/xwl-elisp/master/smart-operator.el")

  (:name protbuf
         :description "Protect buffers from accidental killing"
         :type emacswiki
         :url "http://www.emacswiki.org/emacs/download/ProtBuf"
         :build `(,(concat "mv " 
                          (expand-file-name "protbuf/ProtBuf" el-get-dir)
                          " "
                          (expand-file-name "protbuf/protbuf.el" el-get-dir))))

  (:name open-next-line
         :description ""
         :type http
         :url "https://raw.github.com/gabrielelanaro/emacs-for-python/master/extensions/open-next-line.el")

  (:name goto-last-change
         :description ""
         :type emacswiki
         :url "http://www.emacswiki.org/cgi-bin/wiki/download/goto-last-change.el")

  (:name jabber
         :description "Instant messaging system"
         :type git
         :url "git://emacs-jabber.git.sourceforge.net/gitroot/emacs-jabber/emacs-jabber")

  (:name flymake
         :description "Continuous syntax checking for Emacs"
         :type git
         :url "git://github.com/illusori/emacs-flymake.git")

  (:name win-switch
         :description "Navigating Emacs windows"
         :type http
         :url "https://raw.github.com/leoncamel/emacs-utils/5b345e163f026070fa6014171f7b83f80faf484d/win-switch/win-switch.el")

  (:name color-theme-solarized
         :description "Emacs highlighting using Ethan Schoonover's Solarized color scheme"
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

))

(setq my-packages
      (append
       '(
         el-get
         switch-window
         diminish
         org-mode
         dired+
         ;; escreen
         anything
         go-mode
         magit
         erc-highlight-nicknames
         js2-mode
         deft
         )

       (mapcar 'el-get-source-name el-get-sources)))

(el-get 'sync my-packages)


(provide 'rds-el-get)
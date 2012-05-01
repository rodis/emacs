;; (erc-autojoin-mode t)
;; (erc-truncate-mode t)
;; (erc-scrolltobottom-mode t)  ;;breaks popwin buffer


(require 'erc-highlight-nicknames)
(add-to-list 'erc-modules 'highlight-nicknames)

(setq erc-fill-function 'erc-fill-static)
(setq erc-fill-static-center 20)

(setq erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT" "MODE"
                                 "324" "329" "332" "333" "353" "477"))

(setq erc-hide-list '("JOIN" "PART" "QUIT" "NICK"))
(setq erc-insert-timestamp-function 'erc-insert-timestamp-left)

(defun start-erc ()
  (interactive)
  (load "~/.emacs.d/.erc-auth.el") ; erc-password
  (setq erc-prompt-for-nickserv-password nil)
  (erc :server "irc.freenode.net" :nick "rods" :password erc-password)
  (setq erc-autojoin-channels-alist
        '((".*\\.freenode.net" "#emacs" "#python" 
           "#openstack" "#openstack-dev" "#django"))))

(make-variable-buffer-local 'erc-fill-column)
(add-hook 'window-configuration-change-hook 
    '(lambda () (save-excursion
         (walk-windows (lambda (w) (let ((buffer (window-buffer w)))
              (set-buffer buffer) (when (eq major-mode 'erc-mode)
                (setq erc-fill-column (- (window-width w) 9)))))))))

(if window-system
    (custom-set-faces
     '(erc-prompt-face 
       ((t (:background "white" :foreground "firebrick2" :weight bold)))))
  (custom-set-faces
   '(erc-prompt-face 
     ((t (:background " " :foreground "firebrick2" :weight bold))))
))

(defface erc-header-line-disconnected
  '((t (:foreground "black" :background "indianred")))
  "Face to use when ERC has been disconnected.")
 
(defun erc-update-header-line-show-disconnected ()
  "Use a different face in the header-line when disconnected."
  (erc-with-server-buffer
    (cond ((erc-server-process-alive) 'erc-header-line)
          (t 'erc-header-line-disconnected))))
          (setq erc-header-line-face-method 
                'erc-update-header-line-show-disconnected)
 
(setq erc-header-line-face-method 'erc-update-header-line-show-disconnected)


(provide 'rds-erc)

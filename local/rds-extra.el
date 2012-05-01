;;; rds-extra --- New features under testing

(setq bookmark-default-file (expand-file-name "bookmarks" system-specific-dir))

;; ----------------------------------------------------
(require 'magit)

;; ----------------------------------------------------
(cua-mode)
;; ----------------------------------------------------

(setq browse-url-browser-function 'browse-url-generic
         browse-url-generic-program "/usr/bin/conkeror")

;; ----------------------------------------------------

;; (require 'ee-autoloads)


;; (global-unset-key [left])
;; (global-unset-key [up])
;; (global-unset-key [right])
;; (global-unset-key [down])

(setq deft-directory "~/Dropbox/notes")



(require 'ansi-color)
   (setq ansi-color-names-vector
         (vector (frame-parameter nil 'background-color)
               "#000000" "#CC0000" "#4E9A06" "#C4A000"
               "#3465A4" "#75507B" "#06989A" ;; "#D3D7CF")         
               "#FFFFFF")

               ;; "#555753" "#EF2929" "#8AE234" "#FCE94F"
               ;; "#729FCF" "#AD7FA8" "#34E2E2" "#EEEEEC" )

         ansi-term-color-vector ansi-color-names-vector
         ansi-color-map (ansi-color-make-color-map))

;; (setq-default frame-title-format
;;               '(:eval
;;                 (format "%s@%s: %s %s"
;;                         (or (file-remote-p default-directory 'user)
;;                             user-real-login-name)
;;                         (or (file-remote-p default-directory 'host)
;;                             system-name)
;;                         (buffer-name)
;;                         (cond 
;;                          (buffer-file-truename
;;                           (concat "(" buffer-file-truename ")"))
;;                          (dired-directory
;;                           (concat "{" dired-directory "}"))
;;                          (t
;;                           "[no file]")))))

(defun my-frame ()
  (interactive)
  (make-frame '((iconName . "zerof - "))))





(provide 'rds-extra)

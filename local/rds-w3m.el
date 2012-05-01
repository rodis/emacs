;; (if (locate-library "w3m-load")
;;   '(progn
;;      (require 'w3m-load)
;;      (setq browse-url-browser-function 'w3m-browse-url)
;;      (setq w3m-use-cookies t
;;            browse-url-new-window-flag t
;;            w3m-cookie-accept-bad-cookies t
;;            w3m-form-input-textarea-buffer-lines 20
;;            w3m-default-display-inline-images nil)))

;; (setq browse-url-browser-function 'w3m-browse-url)
(setq w3m-use-cookies t
      browse-url-new-window-flag t
      w3m-cookie-accept-bad-cookies t
      w3m-form-input-textarea-buffer-lines 20
      w3m-default-display-inline-images nil
      w3m-use-title-buffer-name t)

(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)

;; Removing trailing whitespace
;; (add-hook 'w3m-display-hook
;;               (lambda (url)
;;                 (let ((buffer-read-only nil))
;;                   (delete-trailing-whitespace))))

;; Saving Buffers with Desktop
;; (defun w3m-register-desktop-save ()
;;   "Set `desktop-save-buffer' to a function returning the current URL."
;;   (setq desktop-save-buffer (lambda (desktop-dirname) w3m-current-url)))

;; (add-hook 'w3m-mode-hook 'w3m-register-desktop-save)

;; (defun w3m-restore-desktop-buffer (d-b-file-name d-b-name d-b-misc)
;;   "Restore a `w3m' buffer on `desktop' load."
;;   (when (eq 'w3m-mode desktop-buffer-major-mode)
;;     (let ((url d-b-misc))
;;       (when url
;;         (require 'w3m)
;;         (if (string-match "^file" url)
;;             (w3m-find-file (substring url 7))
;;           (w3m-goto-url-new-session url))
;;         (current-buffer)))))

;; (add-to-list 'desktop-buffer-mode-handlers '(w3m-mode . w3m-restore-desktop-buffer))


;; (defun fc-w3m-setup ()
;;   "Setup a w3m buffer."
;;   (set (make-local-variable 'auto-hscroll-mode) nil)
;;   (mapc
;;    (lambda (mapping)
;;      (apply #'define-key w3m-mode-map mapping))
;;      (,(kbd "C-c c") fc-copy-url)
;;      (,(kbd "<down>") next-line)
;;      (,(kbd "<up>") previous-line)
;;      (,(kbd "<right>") forward-char)
;;      (,(kbd "<left>") backward-char)
;;      (,(kbd "C-x b") ido-switch-buffer))))

;; (add-hook 'w3m-mode-hook 'fc-w3m-setup)


(provide 'rds-w3m)
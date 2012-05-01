(load "escreen")
(escreen-install)

(setq escreen-prefix-char "\C-z")
(global-set-key escreen-prefix-char 'escreen-prefix)

;; http://blog.tapoueh.org/news.dim.html#%20Escreen%20integration
;; http://www.splode.com/~friedman/software/emacs-lisp/#ui

;; add C-\ l to list screens with emphase for current one
(defun escreen-get-active-screen-numbers-with-emphasis ()
  "what the name says"
  (interactive)
  (let ((escreens (escreen-get-active-screen-numbers))
        (emphased ""))
    
    (dolist (s escreens)
      (setq emphased
            (concat emphased 
                    (if (= escreen-current-screen-number s)
                        (propertize (number-to-string s)
                                    ;; 'face 'custom-variable-tag) " ")
                                    ;; 'face 'info-title-3)
                                    'face 'font-lock-warning-face)
                                    ;;'face 'secondary-selection)
                      (number-to-string s))
                    " ")))
    (message "escreen: active screens: %s" emphased)))

(global-set-key (kbd "C-\\ l") 
                'escreen-get-active-screen-numbers-with-emphasis)

(defun escreen-goto-last-screen-dim ()
  (interactive)
  (escreen-goto-last-screen)
  (escreen-get-active-screen-numbers-with-emphasis))

(defun escreen-goto-prev-screen-dim (&optional n)
  (interactive "p")
  (escreen-goto-prev-screen n)
  (escreen-get-active-screen-numbers-with-emphasis))

(defun escreen-goto-next-screen-dim (&optional n)
  (interactive "p")
  (escreen-goto-next-screen n)
  (escreen-get-active-screen-numbers-with-emphasis))

(define-key escreen-map escreen-prefix-char 'escreen-goto-last-screen-dim)

(defun escreen-create-screen-dim ()
  (interactive)
  (escreen-create-screen)
  (escreen-get-active-screen-numbers-with-emphasis))

(defun escreen-kill-screen-dim ()
  (interactive)
  (escreen-kill-screen)
  (escreen-get-active-screen-numbers-with-emphasis))

(add-hook 'escreen-goto-screen-hook 'escreen-get-active-screen-numbers-with-emphasis)

;; (define-key escreen-map "c" 'escreen-create-screen-dim)
;; (define-key escreen-map "k" 'escreen-kill-screen-dim)

;; (global-set-key (kbd "C-]") 'escreen-goto-next-screen-dim)
;; (keyboard-translate ?\C-[ ?\H-[)
;; (global-set-key (kbd "H-[") 'escreen-goto-prev-screen-dim)

(add-hook 'escreen-goto-screen-hook
          'escreen-enable-number-mode-if-more-than-one-screen)


;; ;; add support for C-\ from terms
;; (require 'term)
;; (define-key term-raw-map escreen-prefix-char escreen-map)
;; (define-key term-raw-map (kbd "H-[") 'escreen-goto-prev-screen-dim)
;; (define-key term-raw-map (kbd "C-]") 'escreen-goto-next-screen-dim)


(provide 'rds-escreen)
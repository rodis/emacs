;;; rds-ido - Interactively do

(ido-mode t)

(setq
 ido-everywhere t
 ido-enable-prefix nil
 ido-enable-flex-matching t
 ido-create-new-buffer 'always
 ido-max-prospects 10
 ido-file-extensions-order '(".py" ".html" ".css" ".txt"
                             ".emacs" ".xml" ".el" ".ini" ".cfg")
 ido-save-directory-list-file (concat cache-dir "/ido.last" )
)

;; Try out flx-ido for better flex matching between words
(require 'flx-ido)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-use-faces nil)

;; flx-ido looks better with ido-vertical-mode
(require 'ido-vertical-mode)
(ido-vertical-mode)

;; ibuffer mode doesn’t come with an option to use ido-find-file
;; http://www.emacswiki.org/emacs/InteractivelyDoThings
(defun ibuffer-ido-find-file ()
  "Like `ido-find-file', but default to the directory of the buffer at point."
  (interactive
   (let ((default-directory (let ((buf (ibuffer-current-buffer)))
            (if (buffer-live-p buf)
          (with-current-buffer buf
            default-directory)
        default-directory))))
     (ido-find-file-in-dir default-directory))))

(add-hook 'ibuffer-mode-hook
          (lambda ()
            (define-key ibuffer-mode-map "\C-x\C-f"
              'ibuffer-ido-find-file)))


(provide 'rds-ido)

;;; perspective --- Perspective configuration

;;; Commentary:

;;; Code:

(require 'perspective)

(persp-mode)

(eval-after-load 'perspective
  '(progn

     (defun persp-format-name (name)
       "Format the perspective name given by NAME for display in `persp-modestring'."
       (let ((string-name (format "%s" name)))
         (if (equal name (persp-name persp-curr))
             (propertize string-name 'face 'persp-selected-face))))

     (defun persp-update-modestring ()
              "Update `persp-modestring' to reflect the current perspectives"
              (when persp-show-modestring
                (setq persp-modestring
                      (append '("[")
                              (persp-intersperse (mapcar 'persp-format-name (persp-names)) "")
                                                     '("]")))))
))

(defmacro custom-persp (name &rest body)
  `(let ((initialize (not (gethash ,name perspectives-hash)))
         (current-perspective persp-curr))
     (persp-switch ,name)
     (when initialize ,@body)
          (setq persp-last current-perspective)))

(defun custom-persp/emacs ()
  (interactive)
  (custom-persp "emacs"
                (find-file "~/.emacs.d/local/*.el" t)))

(define-key persp-mode-map (kbd "C-x p e") 'custom-persp/emacs)

(defun custom-persp/docs ()
  (interactive)
  (custom-persp "docs"
                (find-file "~/Documents/emacs-docs/*.markdown" t)))

(define-key persp-mode-map (kbd "C-x p d") 'custom-persp/docs)


(provide 'rds-perspective)
;;; rds-perspective.el ends here

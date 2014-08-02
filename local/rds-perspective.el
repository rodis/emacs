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

(provide 'rds-perspective)
;;; rds-perspective.el ends here

(require 'term)

;; http://www.enigmacurry.com/2008/12/26/emacs-ansi-term-tricks/
(defun visit-ansi-term ()
  "If the current buffer is:
     1) a running ansi-term named *ansi-term*, rename it.
     2) a stopped ansi-term, kill it and create a new one.
     3) a non ansi-term, go to an already running ansi-term
        or start a new one while killing a defunt one"
  (interactive)
  (let ((is-term (string= "term-mode" major-mode))
        (is-running (term-check-proc (buffer-name)))
        (term-cmd "/bin/bash")
        (anon-term (get-buffer "*ansi-term*")))

    (if is-term
        (if is-running
            (if (string= "*ansi-term*" (buffer-name))
                (call-interactively 'rename-buffer)
                (if anon-term
                    (switch-to-buffer "*ansi-term*")
                    (ansi-term term-cmd)))
            (kill-buffer (buffer-name))
            (ansi-term term-cmd))

         (if (get-buffer (format "*dark %s*" system-name))
            (if (term-check-proc (format "*dark %s*" system-name))
                (switch-to-buffer (format "*dark %s*" system-name))
                (kill-buffer (format "*dark %s*" system-name))
                (ansi-term term-cmd))
           (ansi-term term-cmd)))))

;; (global-set-key (kbd "<f2>") 'visit-ansi-term)

(defun my-term-paste (&optional string)
  (interactive)
  (process-send-string
   (get-buffer-process (current-buffer))
   (if string string (current-kill 0))))


;; set tango palette colors
(require 'ansi-color)
(setq ansi-color-names-vector
      (vector (frame-parameter nil 'background-color)
              "#000000" "#CC0000" "#4E9A06" "#C4A000"
              "#3465A4" "#75507B" "#06989A" "#FFFFFF")
      ansi-term-color-vector ansi-color-names-vector
      ansi-color-map (ansi-color-make-color-map))


(provide 'rds-ansiterm)
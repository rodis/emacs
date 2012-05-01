(require 'comint)

(require 'tramp)
(require 'server)

(unless (server-running-p) (server-start))

(defvar my-local-shells
  (mapcar (lambda(arg)(format "*%s%s*" system-name arg)) '("1" "2" "3")))

(defvar my-remote-shells
  '("*orange*"))

(defvar my-shells (append my-local-shells my-remote-shells))

(custom-set-variables
 '(tramp-default-method "ssh")          ; uses ControlMaster
 '(comint-scroll-to-bottom-on-input t)  ; always insert at the bottom
 '(comint-scroll-to-bottom-on-output nil) ; always add output at the bottom
 '(comint-scroll-show-maximum-output t) ; scroll to show max possible output
 ;; '(comint-completion-autolist t)     ; show completion list when ambiguous
 '(comint-input-ignoredups t)           ; no duplicates in command history
 '(comint-completion-addsuffix t)    ; insert space/slash after file completion
 '(comint-buffer-maximum-size 20000)    ; max length of the buffer in lines
 '(comint-prompt-read-only nil)         ; if this is t, it breaks shell-command
 '(comint-get-old-input (lambda () "")) ; what to run when i press enter on a
                                        ; line above the current prompt
 '(comint-input-ring-size 5000)         ; max shell history size
 '(protect-buffer-bury-p nil)
)

(add-to-list 'tramp-default-user-alist
                  '(nil "orange" "rods")
)

;; (setenv "PAGER" "cat")

;; truncate buffers continuously
(add-hook 'comint-output-filter-functions 'comint-truncate-buffer)

(defun make-my-shell-output-read-only (text)
  "Add to comint-output-filter-functions to make stdout read only in my shells"
  (if (member (buffer-name) my-shells)
      (let ((inhibit-read-only t)
            (output-end (process-mark (get-buffer-process (current-buffer)))))
        (put-text-property comint-last-output-start output-end 'read-only t))))
(add-hook 'comint-output-filter-functions 'make-my-shell-output-read-only)

(defun my-dirtrack-mode ()
  "Add to shell-mode-hook to use dirtrack mode in my shell buffers."
  (when (member (buffer-name) my-local-shells)
    (shell-dirtrack-mode 0)
    ;; (set-variable 'dirtrack-list '("^\\([^@]*\\)@\\([^:]*\\):\\([^$]*\\)" 3))
    (set-variable 'dirtrack-list '("^\\([a-zA-Z@]*\\):\\([^$]*\\)\\$" 2))
    (dirtrack-mode 1)))
(add-hook 'shell-mode-hook 'my-dirtrack-mode)

; interpret and use ansi color codes in shell output windows
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(defun set-scroll-conservatively ()
  "Add to shell-mode-hook to prevent jump-scrolling on newlines in shell buffers."
  (set (make-local-variable 'scroll-conservatively) 10))
(add-hook 'shell-mode-hook 'set-scroll-conservatively)

;; make it harder to kill my shell buffers
(require 'protbuf)
(add-hook 'shell-mode-hook 'protect-process-buffer-from-kill-mode)

(defun make-comint-directory-tracking-work-remotely ()
  "Add this to comint-mode-hook to make directory tracking work
while sshed into a remote host, e.g. for remote shell buffers
started in tramp. (This is a bug fix backported from Emacs 24:
http://comments.gmane.org/gmane.emacs.bugs/39082"
  (set (make-local-variable 'comint-file-name-prefix)
       (or (file-remote-p default-directory) "")))
(add-hook 'comint-mode-hook 'make-comint-directory-tracking-work-remotely)

(defun enter-again-if-enter ()
  "Make the return key select the current item in minibuf and shell history isearch.
An alternate approach would be after-advice on isearch-other-meta-char."
  (when (and (not isearch-mode-end-hook-quit)
             (equal (this-command-keys-vector) [13])) ; == return
    (cond ((active-minibuffer-window) (minibuffer-complete-and-exit))
          ((member (buffer-name) my-shells) (comint-send-input)))))
(add-hook 'isearch-mode-end-hook 'enter-again-if-enter)

(defadvice comint-previous-matching-input
    (around suppress-history-item-messages activate)
  "Suppress the annoying 'History item : NNN' messages from shell history isearch.
If this isn't enough, try the same thing with comint-replace-by-expanded-history-before-point."
  (let ((old-message (symbol-function 'message)))
    (unwind-protect
      (progn (fset 'message 'ignore) ad-do-it)
    (fset 'message old-message))))

(defadvice comint-send-input (around go-to-end-of-multiline activate)
  "When I press enter, jump to the end of the *buffer*, instead of the end of
the line, to capture multiline input. (This only has effect if
`comint-eol-on-send' is non-nil."
  (flet ((end-of-line () (end-of-buffer)))
    ad-do-it))

;; not sure why, but comint needs to be reloaded from the source (*not*
;; compiled) elisp to make the above advise stick.
(load "comint.el")


;;-----------------------------------------------------------------------------
(defun comint-close-completions ()
  "Close the comint completions buffer.
Used in advice to various comint functions to automatically close
the completions buffer as soon as I'm done with it. Based on
Dmitriy Igrishin's patched version of comint.el."
  (if comint-dynamic-list-completions-config
      (progn
        (set-window-configuration comint-dynamic-list-completions-config)
        (setq comint-dynamic-list-completions-config nil))))

(defadvice comint-send-input (after close-completions activate)
  (comint-close-completions))

(defadvice comint-dynamic-complete-as-filename 
  (after close-completions activate)
  (if ad-return-value (comint-close-completions)))

(defadvice comint-dynamic-simple-complete (after close-completions activate)
  (if (member ad-return-value '('sole 'shortest 'partial))
      (comint-close-completions)))

(defadvice comint-dynamic-list-completions (after close-completions activate)
    (comint-close-completions)
    (if (not unread-command-events)
        ;; comint's "Type space to flush" swallows space. put it back in.
        (setq unread-command-events (listify-key-sequence " "))))

;;-----------------------------------------------------------------------------
(defun fix-shell ()
  "Sometimes the input area of a shell buffer goes read only. This fixes that."
  (interactive)
  (let ((inhibit-read-only t))
    (comint-send-input)))

(defun start-local-shells ()
  (interactive)
  (let ((default-directory "~"))
    (mapcar 'shell my-local-shells))
)

(autoload 'bash-completion-dynamic-complete 
  "bash-completion"
  "BASH completion hook")

(defun my-bash-completion-dynamic-complete ()
  ;; (if (not (member (buffer-name) my-remote-shells))
  (if (member (buffer-name) my-remote-shells)
      (bash-completion-dynamic-complete)))

(add-hook 'shell-dynamic-complete-functions 
          'my-bash-completion-dynamic-complete)

(defun start-remote-shells ()
  (interactive)
  (let ((default-directory "/orange:" ))
    (mapcar 'shell my-remote-shells))
)

(defun start-remote-shell (host nick)
  (interactive "sInsert Host: \nsInsert User: ")
  (let ((host-name (format "*%s*" host))
        (default-directory (format "%s@%s:" nick host)))
    (add-to-list 'my-shells host-name)
    (shell host-name)))

(add-to-list 'tramp-remote-path "/usr/local/sbin")
(add-to-list 'tramp-remote-path "/sbin")


(provide 'rds-comint)
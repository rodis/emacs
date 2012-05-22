;;; rds-misc.el --- Miscellaneous settings

;; Fix shell escape problem
;; (autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
;; (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; emacs breakes hard link (http://kb.iu.edu/data/acxl.html)
(setq backup-by-copying-when-linked t)

;; **************  this is very bad *******************************************
;; set window title
;; (setq frame-title-format '(buffer-file-name "%f" ("%b")))

;; Uniquely identify frames through title so that compiz knows how show them
(setq frame-title-format
  '("" (:eval (frame-parameter nil 'iconName)) (buffer-file-name "%f" ("%b"))))
;; ****************************************************************************

;; show keystrokes in minibuffer early
(setq echo-keystrokes 0.1)

;; show size in minibuffer
(setq size-indication-mode t)

;; show column number in minibuffer 
(setq column-number-mode t)

;; if at the beginning of line C-k includes the newline chars
(setq kill-whole-line t)
 
;; no message at startup
(setq inhibit-startup-message t)
 
;; TAB => 4*'\b'
(setq default-tab-width 4)

;;
(setq visible-bell t)

;; shows current selected region
(setq transient-mark-mode t)
;; (setq shift-select-mode nil)

;; disable line truncation
(setq truncate-partial-width-windows nil)

;; prefer utf8
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; do not blink cursor
(blink-cursor-mode -1)

;; highlight matching parentheses when the point is on them.
(show-paren-mode 1)

;; change default value
(defalias 'yes-or-no-p 'y-or-n-p)

;; remove selected region if typing
(pending-delete-mode 1)

;; save a list of recent files visited.
(recentf-mode 1)

;; indent with spaces instead of tabs
(set-default 'indent-tabs-mode nil)

;; indicate unused lines at the end of the window in the fringe
(set-default 'indicate-empty-lines t)

;; don't clutter up directories with files
(setq backup-directory-alist `(("." . ,(expand-file-name
                                        (concat cache-dir "/backups")))))
;; make emacs use the clipboard
(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)

(define-key menu-bar-tools-menu [games] nil)

;; keep automated customizations in a separate file
(setq custom-file 
      (expand-file-name system-specific-custom-file system-specific-dir))
(load custom-file 'noerror)

;; customize fringe color
;; (set-face-background 'fringe "white")

;; whenever an external process changes a file underneath emacs, and there
;; was no unsaved changes in the corresponding buffer, just revert its
;; content to reflect what's on-disk.
(global-auto-revert-mode 1)

;; avoid compiz manager rendering bugs
(add-to-list 'default-frame-alist '(alpha . 100))

(setq-default display-buffer-reuse-frames t)

(setq recentf-save-file (concat cache-dir "/recentf" ))

(setq auto-save-list-file-prefix (concat cache-dir "/auto-save-list/saves-" ))

(provide 'rds-misc)

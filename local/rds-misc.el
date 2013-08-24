;;; rds-misc.el --- Miscellaneous settings

;; emacs breakes hard link (http://kb.iu.edu/data/acxl.html)
(setq backup-by-copying-when-linked t)

;; set window title
(setq frame-title-format '(buffer-file-name "%f" ("%b")))
(when (and (not window-system)
	(string-match "^xterm" (getenv "TERM")))
	(require 'xterm-title)
    (xterm-title-mode 1))

;; show keystrokes in minibuffer early
(setq echo-keystrokes 0.1)

;; show size in minibuffer
(setq size-indication-mode t)

;; get rid of the menu bar
(menu-bar-mode -1)

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
;;(pending-delete-mode 1)

;; save a list of recent files visited.
(recentf-mode 1)

;; indent with spaces instead of tabs
(set-default 'indent-tabs-mode nil)

;; don't clutter up directories with files
(setq backup-directory-alist `(("." . ,(expand-file-name
                                        (concat cache-dir "/backups")))))

;; whenever an external process changes a file underneath emacs, and there
;; was no unsaved changes in the corresponding buffer, just revert its
;; content to reflect what's on-disk.
(global-auto-revert-mode 1)

(setq-default display-buffer-reuse-frames t)

(setq recentf-save-file (concat cache-dir "/recentf" ))

(setq auto-save-list-file-prefix (concat cache-dir "/auto-save-list/saves-" ))

(load "server")
(unless (server-running-p) (server-start))

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(require 'pbcopy)
(turn-on-pbcopy)

(provide 'rds-misc)

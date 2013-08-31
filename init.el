;;; init.el --- Where all the magic begins

;; ----------------------------------------------------------------------------
;; Turn off early in startup to avoid momentary display
;; ----------------------------------------------------------------------------
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))


;; ----------------------------------------------------------------------------
;; Work around a bug on OS X where system-name is FQDN
;; ----------------------------------------------------------------------------
(cond ((eq system-type 'darwin)
  (setq system-name (car (split-string system-name "\\.")))))


;; ----------------------------------------------------------------------------
;; Global variables
;; ----------------------------------------------------------------------------
(setq dotfiles-dir 
      (file-name-directory (or (buffer-file-name) load-file-name)))
(setq local-dir (expand-file-name "local" dotfiles-dir))
(setq vendor-dir (expand-file-name "vendor" dotfiles-dir))
(setq cache-dir (expand-file-name "cache" dotfiles-dir))
(setq utils-dir (expand-file-name "utils" dotfiles-dir))
(setq system-dirs (expand-file-name "system-dirs" dotfiles-dir))
(setq system-specific-dir (expand-file-name system-name system-dirs))
(setq config-dir (expand-file-name "config-files" dotfiles-dir))
(load-file (expand-file-name "rds-paths.el" local-dir))


(require 'rds-init)

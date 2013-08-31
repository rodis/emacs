;;; rds-paths.el --- All sorts of paths

(add-to-list 'load-path dotfiles-dir)

;; Declare files and folder for system and user specific customizations
(setq 
  user-specific-config (concat dotfiles-dir user-login-name ".el")
)

(if (file-exists-p user-specific-config) (load user-specific-config))

(if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (let* ((my-lisp-dir local-dir)
            (default-directory my-lisp-dir))
         (setq load-path (cons my-lisp-dir load-path))
         (normal-top-level-add-subdirs-to-load-path)))

(if
    (and
     (fboundp 'normal-top-level-add-subdirs-to-load-path)
     (boundp 'vendor-dir))
      (let* ((my-lisp-dir vendor-dir)
            (default-directory my-lisp-dir))
         (setq load-path (cons my-lisp-dir load-path))
         (normal-top-level-add-subdirs-to-load-path)))

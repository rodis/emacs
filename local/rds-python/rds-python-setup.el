;; (setq py-install-directory "~/.emacs.d/el-get/python-mode")
;; (require 'python-mode)

;; (add-to-list 'auto-mode-alist '("\\.py$" . python-mode))
;; (add-to-list 'interpreter-mode-alist '("python" . python-mode))
;; ;;(autoload 'python-mode "python-mode" "Python editing mode." t)


(defun setup-pythonpath ()
  (setenv "PYTHONPATH"
          (concat
           (getenv "PYTHONPATH") path-separator
           (concat dotfiles-dir "python-libs/"))))

(defun setup-path ()
  (setenv "PATH"
          (concat
           (concat dotfiles-dir "python-bin/" ":")
           (getenv "PATH"))))

(eval-after-load "python-mode"
  '(progn
     (setup-pythonpath)
     (setup-path)
     )
  )


(provide 'rds-python-setup)

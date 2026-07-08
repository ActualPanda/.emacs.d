(use-package emr
  :bind (:map emacs-lisp-mode-map
	      ("M-RET" . emr-show-refactor-menu)))

(use-package magit)

(use-package lua-mode
  :init
  (setq lua-indent-level 4))

(provide 'init-coding)

;;; init-coding.el -*- lexical-binding: t -*-
(use-package emr
  :bind (:map emacs-lisp-mode-map
	      ("M-RET" . emr-show-refactor-menu)))

(use-package magit)

(use-package lua-mode
  :init
  (setq lua-indent-level 4))

(use-package cargo-mode
  :hook (rust-mode . cargo-minor-mode)
  :config
  (setq compilation-scroll-output))

(provide 'init-coding)

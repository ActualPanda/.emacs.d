;;; init-coding.el -*- lexical-binding: t -*-
(require 'init-funcs)

(use-package emr
  :bind (:map emacs-lisp-mode-map
	      ("M-RET" . emr-show-refactor-menu)))

(use-package magit)

(defun ap/lua-mode ()
  (rainbow-delimiters-mode)
  (display-line-numbers-mode))

(defun ap/elisp-mode ()
  (rainbow-delimiters-mode)
  (paredit-mode t)
  (turn-on-eldoc-mode)
  (eldoc-add-command
   'paredit-backward-delete
   'paredit-close-round)
  (local-set-key (kbd "RET") 'ap/electrify-return-if-match)
  (eldoc-add-command 'ap/electrify-return-if-match)
  (show-paren-mode t)
  (display-line-numbers-mode))

(use-package lua-mode
  :init
  (setq lua-indent-level 4)
  :hook ap/lua-mode)

(use-package emacs-lisp-mode
  :hook (emacs-lisp-mode . ap/elisp-mode))

(use-package cargo-mode
  :hook (rust-mode . cargo-minor-mode)
  :config
  (setq compilation-scroll-output))

(provide 'init-coding)

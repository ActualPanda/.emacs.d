(use-package evil
  :init
  (setq evil-default-state 'emacs)
  :config
  (evil-mode 1))

(use-package projectile
  :init
  (projectile-mode +1)
  :bind (:map projectile-mode-map
	      ("C-c p" . projectile-command-map)))


(provide 'init-nav)

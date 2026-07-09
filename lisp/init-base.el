;;; init-base.el -*- lexical-binding: t -*-
(require 'init-funcs)

(use-package emacs
  :config
  (setq 
   ring-bell-function 'ignore
   visible-bell t
   initial-buffer-choice #'enlight
   custom-file (expand-file-name "custom.el" user-emacs-directory))
  
  (scroll-bar-mode -1)
  (tool-bar-mode -1)
  (set-fringe-mode 10)
  (menu-bar-mode -1)

  (column-number-mode)
  (global-display-line-numbers-mode)

  (dolist (mode '(org-mode-hook
		  term-mode-hook
		  shell-mode-hook
		  dired-mode-hook))
    (add-hook mode (lambda () (display-line-numbers-mode 0))))


  :bind (("C-o" . ap/open-newline-inplace)
	 ("C-c C-e r" . ap/refresh-config)
	 ("C-c C-e o" . ap/open-config-dir)))

(use-package enlight
  :custom
  (enlight-content
   (concat
    (propertize "MENU" 'face 'highlight)
    "\n"
    (enlight-menu
     '(("Config" ("Open Config" ap/open-config-dir "c"))
       ("Projects" ("Open Project" projectile-switch-project "p")))))))

(provide 'init-base)

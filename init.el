;;; -*- lexical-binding: t -*
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;; various useful functions
(defun refresh-init-file ()
  "Refresh init.el"
  (interactive)
  (load-file "~/.emacs.d/init.el"))

(defun open-init-file ()
  "Open init.el"
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(defun open-newline-inplace ()
  "Creates newline at end of current line and keeps point inplace"
  (interactive)
  (save-excursion
    (move-end-of-line 1)
    (open-line 1)))

(use-package emacs
  :config
  (setq ring-bell-function 'ignore)
  (setq visible-bell t)
  (setq initial-buffer-choice "~/")
  (global-display-line-numbers-mode)
  :bind (("C-o" . open-newline-inplace)
	 ("C-x M-r" . refresh-init-file)
	 ("C-x M-o" . open-init-file)))

(use-package eglot
  :config
  (add-to-list 'eglot-server-programs
	       '(lua-mode . ("lua-language-server")))
  :hook ((lua-mode . eglot-ensure))
  :bind (:map eglot-mode-map
	      ("C-c r" . eglot-rename)
	      ("C-c h" . eldoc)
	      ("<f6>" . xref-find-definitions)
	      ("<f7>" . eglot-momentary-inlay-hints)))

(use-package company
  :ensure t
  :hook ((prog-mode . company-mode))
  :bind (:map company-active-map
	      ("<return>" . nil)
	      ("RET" . nil)
	      ("C-<return>" . company-complete-selection)
	      ([tab] . company-complete-selection)
	      ("TAB" . company-complete-selection)))

(use-package reformatter
  :ensure t
  :config
  (reformatter-define stylua-format
    :program "stylua"
    :args '("--respect-ignores" "-")
    :lighter " Stylua"))

(use-package magit :ensure t)

(use-package batppuccin
  :vc (:url "https://github.com/bbatsov/batppuccin-emacs" :rev :newest)
  :config
  (load-theme 'batppuccin-mocha t))

(use-package evil
  :ensure t
  :init
  (setq evil-default-state 'emacs)
  :config
  (evil-mode 1))

(use-package lua-mode
  :ensure t
  :init
  (setq lua-indent-level 4))

(use-package projectile
  :ensure t
  :init
  (projectile-mode +1)
  :bind (:map projectile-mode-map
	      ("C-c p" . projectile-command-map)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

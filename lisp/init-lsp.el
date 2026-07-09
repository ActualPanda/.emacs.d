;;; init-lsp.el -*- lexical-binding: t -*-
(use-package eglot
  :config
  (add-to-list 'eglot-server-programs
	       '(lua-mode . ("lua-language-server")))
  :hook (((lua-mode rust-mode gdscript-mode) . eglot-ensure))
  :bind (:map eglot-mode-map
	      ("C-c r" . eglot-rename)
	      ("C-c h" . eldoc)
	      ("<f6>" . xref-find-definitions)
	      ("<f7>" . eglot-momentary-inlay-hints)))

(use-package company
  :hook ((prog-mode . company-mode))
  :bind (:map company-active-map
	      ("<return>" . nil)
	      ("RET" . nil)
	      ("C-<return>" . company-complete-selection)
	      ([tab] . company-complete-selection)
	      ("TAB" . company-complete-selection)))

(use-package reformatter
  :config
  (reformatter-define stylua-format
    :program "stylua"
    :args '("--respect-ignores" "-")
    :lighter " Stylua"))

(provide 'init-lsp)

;;; init-packages.el -*- lexical-binding: t -*-
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(dolist (package-name
	 '(company emr reformatter magit evil
		   lua-mode projectile batppuccin
		   enlight cargo-mode hydra gdscript-mode
		   rainbow-delimiters paredit slime
		   clojure-mode cider))
  (unless (package-installed-p package-name)
    (package-install package-name)))

(provide 'init-packages)

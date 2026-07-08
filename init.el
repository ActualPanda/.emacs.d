;;; -*- lexical-binding: t -*
(defun update-load-path (&rest _)
  (dolist (dir '("lisp"))
    (push (expand-file-name dir user-emacs-directory) load-path)))

(update-load-path)

(require 'init-base)

(require 'init-packages)

(require 'init-theme)
(require 'init-lsp)
(require 'init-nav)
(require 'init-coding)


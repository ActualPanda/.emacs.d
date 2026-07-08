;;; init-funcs.el -*- lexical-binding: t -*-
(defun ap/refresh-config ()
  "Refresh init.el"
  (interactive)
  (load-file "~/.emacs.d/init.el"))

(defun ap/open-config-dir ()
  "Open init.el"
  (interactive)
  (find-file "~/.emacs.d"))

(defun ap/open-newline-inplace ()
  "Creates newline at end of current line and keeps point inplace"
  (interactive)
  (save-excursion
    (move-end-of-line 1)
    (open-line 1)))

(provide 'init-funcs)

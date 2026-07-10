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

(defun ap/electrify-return-if-match (arg)
  "If the text after the cursor matches `electrify-return-match' then
  open and indent an empty line between the cursor and the text.  Move the
  cursor to the new line."
  (interactive "P")
  (let ((case-fold-search nil))
    (if (looking-at electrify-return-match)
	(save-excursion (newline-and-indent)))
    (newline arg)
    (indent-according-to-mode)))

(provide 'init-funcs)

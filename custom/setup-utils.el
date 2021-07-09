;;; setup-utils.el -- sumamry
;;; Commentary:

;; Collection of helpful utils

;;; Code:


;; Describe last thing that just happened
(defun describe-last-function()
  "Describe last func."
  (interactive)
  (describe-function last-command))


;; Redefine keyboard-escape-quit to force not closing other windows
(defadvice keyboard-escape-quit (around my-keyboard-escape-quit activate)
  "Prevent triple escape from closing all other windows."
  (let (orig-one-window-p)
    (fset 'orig-one-window-p (symbol-function 'one-window-p))
    (fset 'one-window-p (lambda
			  (&optional
			   nomini
			   all-frames)
			  t))
    (unwind-protect ad-do-it (fset 'one-window-p (symbol-function 'orig-one-window-p)))))

(defun get-content (filename)
  "Return the contents of file."
  (with-temp-buffer
    (insert-file-contents filename)
    (buffer-string)))

(message "Setup utils loaded.")
(provide 'setup-utils)

;;; setup-utils.el ends here

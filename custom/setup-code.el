;;; setup-code.el -- sumamry
;;; Commentary:

;; Setup coding modes.

;;; Code:

(use-package
  lispy
  :config (add-hook
	   'emacs-lisp-mode-hook
	   (lambda () (lispy-mode 1))))


(message "Setup code loaded.")
(provide 'setup-code)

;;; setup-code.el ends here

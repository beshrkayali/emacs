;;; setup-code.el -- sumamry
;;; Commentary:

;; Custom config for coding modes

;;; Code:

;; Lisp
(use-package
  lispy
  :config (add-hook
	   'emacs-lisp-mode-hook
	   (lambda () (lispy-mode 1))))

;; Python

(use-package
  python-black
  :bind ("C-c b b" . python-black))

(message "Setup code loaded.")
(provide 'setup-code)

;;; setup-code.el ends here

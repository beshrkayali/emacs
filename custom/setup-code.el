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
  :init (setq python-black-command "/home/beshr/.local/bin/black")
  :bind ("C-c b b" . python-black))

(message "Setup code loaded.")
(provide 'setup-code)


;; JS
(setq js-indent-level 2)

(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  )
(add-hook 'web-mode-hook  'my-web-mode-hook)


;; Typescript
(setq js-indent-level 2)

(use-package
  typescript-mode
  :init (setq typescript-indent-level 2))
;;; setup-code.el ends here

;;; setup-webmode.el -- sumamry
;;; Commentary:

;; Init Emacs

;;; Code:

;; Webmode

(use-package 
  web-mode 
  :ensure t 
  :mode "\\.html$"
  :mode "\\.svelte$")


(message "Setup webmode loaded.")
(provide 'setup-webmode)

;;; setup-webmode.el ends here

;;; setup-theme.el -- sumamry
;;; Commentary:

;; Emacs theme

;;; Code:

;; Theme
;; (load-theme `melancholy t)
(use-package 
  ample-theme 
  :ensure t 
  :init (progn (load-theme 'ample t t) 
	       (load-theme 'ample-flat t t) 
	       (load-theme 'ample-light t t) 
	       (enable-theme 'ample)) 
  :defer t 
  :ensure t)

(message "Setup theme loaded.")
(provide 'setup-theme)

;;; setup-theme.el ends here

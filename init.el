;;; init.el -- sumamry
;;; Commentary:

;; Emacs conf
;;

;;; Code:

;; Add path of custom setup code
(add-to-list 'load-path (expand-file-name "custom" user-emacs-directory))

;; Packages
;; tip: instead of package-install, add more packages to list below and run: M-x pa-se Ret
(custom-set-variables '(package-selected-packages 
			'(use-package 
			   helm
			   helm-company
			   smex
			   ace-window
			   elisp-format
			   projectile
			   nlinum-relative
			   rainbow-mode
			   fish-mode
			   nim-mode
			   ample-theme
			   markdown-mode
			   yaml-mode
			   hcl-mode
			   python-black
			   olivetti
			   toml-mode
			   sass-mode
			   jinja2-mode
			   go-mode
			   yasnippet
			   yasnippet-snippets
			   ag
			   web-mode
			   wakatime-mode
			   org-roam)) 
		      '(warning-suppress-log-types '((comp))))


;; Setup things
(add-hook 'after-init-hook (lambda () 
			     (progn 
			       (require 'setup-emacs) 
			       (require 'setup-theme) 
			       (require 'setup-utils) 
			       (require 'setup-wayland)
			       ;; Modes
			       (require 'setup-helm) 
			       (require 'setup-projectile) 
			       (require 'setup-orgmode) 
			       (require 'setup-webmode) 
			       (require 'setup-mumode) ;; ~/.authinfo.gpg
			       (require 'setup-wakatime) ;; ~/.wakakey.gpg
			       )))

;; Dev
(add-to-list 'load-path "/home/beshr/src/code/elbin/")
(use-package 
  feedbin)

;;; init.el ends here

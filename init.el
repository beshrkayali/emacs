;;; init.el -- sumamry
;;; Commentary:

;; Emacs conf
;;

;;; Code:

;; Add path of custom setup code
(add-to-list 'load-path (expand-file-name "custom" user-emacs-directory))

;; Packages
;; tip: instead of package-install, add more packages to list below and run: M-x pa-se Ret
(setq package-selected-packages 
      '(use-package 
	 helm
	 helm-company
	 smex
	 systemd
	 caddyfile-mode
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
	 org-bullets
	 org-roam
	 org-roam-server
	 idle-org-agenda
	 org-super-agenda
	 helm-org-rifle
	 makefile-executor
	 lispy
	 eradio
	 magit
	 hydra))

(setq warning-suppress-log-types
      '((comp)))



;; Setup things
(add-hook
 'after-init-hook
 (lambda ()
   (progn
     (require 'setup-emacs)
     (require 'setup-theme)
     (require 'setup-utils)
     (require 'setup-wayland)
     (require 'setup-code)
     ;; Modes
     (require 'setup-helm)
     (require 'setup-projectile)
     (require 'setup-orgmode)
     (require 'setup-webmode)
     (require 'setup-mumode)   ;; ~/.authinfo.gpg
     (require 'setup-wakatime) ;; ~/.wakakey.gpg
     (require 'setup-radio)
     (require 'setup-hydra)
     )))


;; Dev
;; (add-to-list
;;  'load-path
;;  "~/src/code/elbin/")
;; (use-package elbin)

;;; init.el ends here

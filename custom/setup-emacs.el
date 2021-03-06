;;; setup-emacs.el -- sumamry
;;; Commentary:

;; Init Emacs

;;; Code:

;; Const/Vars
(defconst emacs-start-time (current-time))
(setenv "LANG" "en_US.UTF-8")

;; No startup message
(setq inhibit-startup-message t)

;; No wrapping
(set-default 'truncate-lines 1)

;; Minimal warnings wrapping
(defvar warning-minimum-log-level)
(setq warning-minimum-log-level 
      :emergency)

;; Select matching parentheses
(show-paren-mode 1)

;; No toolbars
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Global flycheck and company modes
(add-hook 'after-init-hook 'global-flycheck-mode)
(add-hook 'after-init-hook 'global-company-mode)

;; Melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)

;; Make things a bit faster
(setq inhibit-compacting-font-caches t)
(setq auto-window-vscroll nil)

;; Avoid performance issues in files with very long lines.
(global-so-long-mode 1)

;; Font
(if (equal (system-name) "atlas")
    ;; Thinkpad
    (progn
      (set-face-attribute
       'default
       nil
       :family "Cascadia Code")
      (set-face-attribute
       'default
       nil
       :height 100))
  (progn
    (set-face-attribute
     'default
     nil
     :family "Cascadia Code")
    (set-face-attribute
     'default
     nil
     :height 155)))


(use-package unicode-fonts
  :init (unicode-fonts-setup))


;; Save position
(require 'saveplace)
(setq-default save-place t)

;; Smex
;; (use-package 
;;   smex 
;;   :ensure t 
;;   :bind ("M-x" . smex) 
;;   :config (smex-initialize))

;; Relative line nums
(use-package 
  nlinum-relative 
  :ensure t 
  :init (setq nlinum-relative-redisplay-delay 0) 
  :config (add-hook 'prog-mode-hook 'nlinum-relative-mode))

;; Ace Window
(use-package 
  ace-window 
  :ensure t 
  :bind ("M-p" . ace-window))

;; Makefile executor
(use-package makefile-executor
  :config
  (add-hook 'makefile-mode-hook 'makefile-executor-mode))

;; Snippets
(use-package 
  yasnippet 
  :ensure t 
  :init (yas-global-mode 1))

;; Markdown
(use-package 
  markdown-mode 
  :ensure t
  :ensure olivetti
  :commands (markdown-mode gfm-mode) 
  :mode (("README\\.md\\'" . gfm-mode)
	 ("\\.md\\'" . olivetti-mode)
	 ("\\.md\\'" . markdown-mode)
	 ("\\.markdown\\'" . markdown-mode)) 
  :init (setq markdown-command "multimarkdown"))

(message "Setup emacs loaded.")
(provide 'setup-emacs)

;;; setup-emacs.el ends here

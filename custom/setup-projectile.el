;;; setup-projectile.el -- sumamry
;;; Commentary:

;; Setup projectile
;;

;;; Code:

(use-package
  projectile
  :ensure t
  :init (projectile-mode 1)
  (setq projectile-project-search-path
	'("~/src/" "~/src/5m/"))
  :bind ("C-c C-." . projectile-commander)
  (:map projectile-mode-map
	("s-p" . projectile-command-map)
	("C-c p" . projectile-command-map))
  :config (setq projectile-enable-caching
		t))

(message "Setup projectile mode loaded.")
(provide 'setup-projectile)

;;; setup-projectile.el ends here

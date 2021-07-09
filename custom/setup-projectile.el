;;; setup-projectile.el -- sumamry
;;; Commentary:

;; Setup projectile
;;

;;; Code:

(use-package projectile
  :init (projectile-mode +1)
  (setq projectile-project-search-path '("~/src/" "~/src/5m/"))
  :bind (:map projectile-mode-map
	      ("s-p" . projectile-command-map)
	      ("C-c p" . projectile-command-map)))

(message "Setup projectile mode loaded.")
(provide 'setup-projectile)

;;; setup-projectile.el ends here

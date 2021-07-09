;;; setup-orgmode.el -- sumamry
;;; Commentary:

;; Init Emacs

;;; Code:

;; Webmode

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(setq org-agenda-files (list "~/docs/org/home.todo.org" "~/docs/org/work.todo.org"))


(message "Setup orgmode loaded.")
(provide 'setup-orgmode)

;;; setup-orgmode.el ends here

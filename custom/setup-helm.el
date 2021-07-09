;;; setup-helm.el -- sumamry
;;; Commentary:

;; Setup helmn
;;

;;; Code:


;; Helm
(use-package helm
  :ensure t
  :init (helm-mode 1)
  ; (global-set-key (kbd "M-x") #'helm-M-x)
  (global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
  (global-set-key (kbd "C-x C-f") #'helm-find-files)
  (eval-after-load 'company
    '(progn
       (define-key company-mode-map (kbd "C-:") 'helm-company)
       (define-key company-active-map (kbd "C-:") 'helm-company))))

(message "Setup helm mode loaded.")
(provide 'setup-helm)

;;; setup-helm.el ends here

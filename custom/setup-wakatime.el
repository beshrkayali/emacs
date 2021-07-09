;;; setup-wakatime.el -- sumamry
;;; Commentary:

;; Wakatime
;;

;;; Code:

;; Add path of custom setup code

;; Wakatime
(use-package wakatime-mode
  :init (setq wakatime-api-key (shell-command-to-string "gpg -qd /home/beshr/.wakakey.gpg"))
  (setq wakatime-cli-path "/home/beshr/.local/bin/wakatime")
  (global-wakatime-mode))


(message "Setup wakatime loaded.")
(provide 'setup-wakatime)

;;; setup-wakatime.el ends here

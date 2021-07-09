;;; setup-mumode.el -- sumamry
;;; Commentary:

;; my Emacs conf
;;

;;; Code:

;; Add path of custom setup code
(when (file-directory-p "/usr/share/emacs/site-lisp/mu4e/")
  (progn
    (add-to-list 'load-path "/usr/share/emacs/site-lisp/mu4e/")
    (require 'mu4e)
    (use-package
      m4ue
      :init

      ;; Basic config
      (setq mue4e-headers-skip-duplicates  t
	    mu4e-view-show-images t
	    mu4e-view-show-addresses t
	    mu4e-compose-format-flowed nil
	    mu4e-date-format "%y/%m/%d"
	    mu4e-headers-date-format "%Y/%m/%d"
	    mu4e-change-filenames-when-moving t
	    mu4e-attachments-dir "~/Downloads"
	    mu4e-maildir "~/Maildir" ;; top-level Maildir
	    ;; the paths are relative to maildir root
	    mu4e-refile-folder "/Archive"
	    mu4e-sent-folder "/Sent"
	    mu4e-drafts-folder "/Drafts"
	    mu4e-trash-folder  "/Trash"
	    ;; details
	    user-mail-address "me@beshr.com"
	    user-full-name  "Beshr Kayali"
	    message-signature
	    (concat
	     "Beshr Kayali\n"
	     "https://beshr.com\n")
	    )

      ;; this setting allows to re-sync and re-index mail
      ;; by pressing U
      (setq mu4e-get-mail-command  "mbsync -a")

      ;; Remap `d` to move to Trash
      (fset 'my-move-to-trash "mTrash")
      (define-key mu4e-headers-mode-map (kbd "d") 'my-move-to-trash)
      (define-key mu4e-view-mode-map (kbd "d") 'my-move-to-trash)

      ;; Email sending
      (setq
       message-send-mail-function   'smtpmail-send-it
       starttls-use-gnutls t
       smtpmail-starttls-credentials
       '(("smtp.fastmail.com" 587 nil nil))
       smtpmail-auth-credentials (expand-file-name "~/.authinfo.gpg")
       smtpmail-default-smtp-server "smtp.fastmail.com"
       smtpmail-smtp-server "smtp.fastmail.com"
       smtpmail-smtp-service 587
       smtpmail-debug-info t))
    ))


(message "Setup mu mode loaded.")
(provide 'setup-mumode)

;;; setup-mumode.el ends here

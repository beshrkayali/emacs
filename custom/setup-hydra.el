;;; setup-hydra.el -- sumamry
;;; Commentary:

;; Hydra config

(use-package
  hydra
  :defer t
  :bind ("C-c ." . 'bk/hydra-main-menu/body))


(defhydra bk/hydra-main-menu (:color teal :hint nil)
  "main menu"
  ("o" bk/hydra-org/body "org" )
  ("p" bk/hydra-pomodoro/body "pomodoro" )
  ("r" bk/hydra-radio/body "radio")
  ("q" quit-window "quit" :color blue))


(defhydra bk/hydra-org (:color teal :hint nil)
  "org"
  ("a" org-agenda-list "agenda")
  ;; ("c" org-clock-goto "org-clock-goto")
  ;; ("d" deft "deft")
  ;; ("g" org-capture-goto-last-stored "goto captured")
  ;; ("p" org-pomodoro "org-pomodoro")
  ;; ("x" org-clock-remove-overlays "remove clock overlays")
  ("G" org-refile-goto-last-stored "goto refiled")
  ("i" org-roam-insert "insert")
  ("f" org-roam-find-file "find-file")
  ("b" org-roam-buffer-activate "org-roam-buffer")
  ("t" org-roam-tag-add "add tag"))

(defhydra bk/hydra-pomodoro (:color teal :hint nil)
  "pomodoro"
  ("b" (call-process-shell-command "gnome-pomodoro --no-default-window & disown") "run in background")
  ("w" (call-process-shell-command "gnome-pomodoro & disown") "run  window")
  ("s" (call-process-shell-command "gnome-pomodoro --start-stop") "start-stop")
  ("s" (call-process-shell-command "gnome-pomodoro --pause") "pause")
  ("r" (call-process-shell-command "gnome-pomodoro --resume") "resume")
  ("k" (call-process-shell-command "gnome-pomodoro --quit") "kill")
  )

(defhydra bk/hydra-radio (:color teal :hint nil)
  "radio"
  ("c" eradio-play "radio play / channel select")
  ("s" eradio-stop "radio stop")
  ("p" eradio-toggle "radio pause toggle")
  )


(message "Setup hydra loaded.")
(provide 'setup-hydra)

;;; setup-hydra.el ends here

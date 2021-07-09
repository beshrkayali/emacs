;;; setup-wayland.el -- sumamry
;;; Commentary:

;; Wayland stuff

;;; Code:

;; Integrate with wl-clipboard

(setq wl-copy-process nil)

(defun wl-copy (text) 
  (setq wl-copy-process (make-process :name "wl-copy" 
				      :buffer nil 
				      :command '("wl-copy" "-f" "-n") 
				      :connection-type 'pipe)) 
  (process-send-string wl-copy-process text) 
  (process-send-eof wl-copy-process))

(defun wl-paste () 
  (if (and wl-copy-process 
	   (process-live-p wl-copy-process)) nil ; should return nil if we're the current paste owner
    (shell-command-to-string "wl-paste -n")))

(setq interprogram-cut-function 'wl-copy)
(setq interprogram-paste-function 'wl-paste)


(message "Setup wayland loaded.")
(provide 'setup-wayland)

;;; setup-wayland.el ends here

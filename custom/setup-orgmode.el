;;; setup-orgmode.el -- sumamry
;;; Commentary:

;; Init Emacs

;;; Code:

(setq org-directory "~/Nextcloud/org/")
(setq org-log-done t)
(setq org-agenda-files (list (concat org-directory "inbox.org") 
			     (concat org-directory "home.todo.org") 
			     (concat org-directory "work.todo.org")))


(use-package org-bullets
  :config
  (add-hook
   'org-mode-hook
   (lambda () 
     (org-bullets-mode))))

(use-package org-super-agenda
  :config
  ;; Agenda
  (setq org-deadline-warning-days 7)

  ;; Prios
  (setq org-highest-priority ?A)
  (setq org-lowest-priority ?C)
  (setq org-default-priority ?A)
  (setq org-priority-faces
	'((?A . (:foreground "#F0DFAF" :weight bold))
	  (?B . (:foreground "LightSteelBlue"))
	  (?C . (:foreground "OliveDrab"))))

  (defun air-org-skip-subtree-if-priority (priority) 
    "Skip an agenda subtree if it has a priority of PRIORITY.PRIORITY may be one of the characters ?A, ?B, or ?C."
    (let ((subtree-end (save-excursion (org-end-of-subtree t))) 
	  (pri-value (* 1000 (- org-lowest-priority priority))) 
	  (pri-current (org-get-priority (thing-at-point 'line t)))) 
      (if (= pri-value pri-current) subtree-end nil))
    )
  (defun air-org-skip-subtree-if-habit () 
    "Skip an agenda entry if it has a STYLE property equal to \"habit\"."
    (let ((subtree-end (save-excursion (org-end-of-subtree t)))) 
      (if (string= (org-entry-get nil "STYLE") "habit") subtree-end nil)))

  (setq org-agenda-custom-commands
	'(("d" "Daily agenda and all TODOs"
	   ((tags "PRIORITY=\"A\""
		  ((org-agenda-skip-function
		    '(org-agenda-skip-entry-if
		      'todo 'done)) 
		   (org-agenda-overriding-header
		    "High-priority unfinished tasks:")))
	    (agenda "" ((org-agenda-ndays 1))) 
	    (alltodo "" ((org-agenda-skip-function '(or (air-org-skip-subtree-if-habit) 
							(air-org-skip-subtree-if-priority ?A) 
							(org-agenda-skip-if nil '(scheduled deadline))
							)) 
			 (org-agenda-overriding-header "ALL normal priority tasks:")))) 
	   ((org-agenda-compact-blocks t)))))

  (setq org-agenda-sorting-strategy
	(quote
	 ((agenda deadline-up priority-down)
	  (todo priority-down category-keep)
	  (tags priority-down category-keep)
	  (search category-keep)))) )


(use-package org
  :bind (("C-c c" . 'org-capture))
  :config
  (setq org-capture-templates
	'(("t" "todo" entry (file+headline (lambda () (concat org-directory "inbox.org")) "Tasks")
           "* TODO [#A] %?")))
  )


(use-package org-rifle
  :bind (("C-c r" . 'helm-org-rifle-agenda-files)))

(use-package idle-org-agenda
  :after org-agenda
  :config (idle-org-agenda-mode))


;; Org roam
(use-package 
  org-roam 
  :hook (after-init . org-roam-mode) 
  :custom (org-roam-directory (file-truename "~/Nextcloud/org/org-roam")) 
  (org-roam-buffer-position 'bottom) 
  :bind (:map org-roam-mode-map 
	      (("C-c n l" . org-roam) 
	       ("C-c n f" . org-roam-find-file) 
	       ("C-c n g" . org-roam-graph)) 
	      :map org-mode-map
	      (("C-c n i" . org-roam-insert)) 
	      (("C-c n I" . org-roam-insert-immediate))))


(message "Setup orgmode loaded.")
(provide 'setup-orgmode)

;;; setup-orgmode.el ends here

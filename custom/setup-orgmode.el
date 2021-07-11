;;; setup-orgmode.el -- sumamry
;;; Commentary:

;; Init Emacs

;;; Code:

(setq org-directory "~/Nextcloud/org/")
(setq org-log-done t)
(setq org-agenda-files (list (concat org-directory "inbox.org") 
			     (concat org-directory "agenda-files/home.todo.org") 
			     (concat org-directory "agenda-files/work.todo.org")))


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



(defun bk/assert-todo-header ()
  (when (zerop (buffer-size))
    (insert (concat "#+SEQ_TODO: TODO(t) IN-PROGRESS(i) DONE(d)\n"
                    "#+STARTUP: showall\n\n"))))

(defun bk/projectile-current-todo-org (headline)
  (set-buffer (org-capture-target-buffer (concat (projectile-project-root)
                                                 "todo.org")))
  (org-capture-put-target-region-and-position)
  (widen)
  (goto-char (point-min))
  (bk/assert-todo-header)
  (if (re-search-forward (format org-complex-heading-regexp-format
                                 (regexp-quote headline))
                         nil t)
      (beginning-of-line)
    (goto-char (point-max))
    (unless (bolp) (insert "\n"))
    (insert "* " headline "\n")
    (beginning-of-line 0)))


(use-package
  org
  :bind (("C-c c" . 'org-capture))
  :config (setq org-capture-templates
		'(("t"
		   "Task"
		   entry
		   (file+headline
		    (concat
		     org-directory
		     "inbox.org")
		    "incoming.org"
		    "Incoming tasks")
		   "* TODO %^{Description}
:LOGBOOK:
- Added: %U
:END:
%?
"
		   :empty-lines-before 0)
		  ("p"
		   "Project TODO"
		   entry
		   (function
		    (lambda ()
		      (bk/projectile-current-todo-org
		       "Todos")))
		   "* TODO %^{Description}
:LOGBOOK:
- Added: %U
:END:
%?
"
		   :empty-lines-before 0)
		  ("n"
		   "Note"
		   entry
		   (file+headline
		    "notes.org"
		    "Notes")
		   "* %^{Description}
:LOGBOOK:
- Added: %U
:END:
%?
"
		   :empty-lines-before 0))))


(use-package org-rifle
  :bind (("C-c r" . 'helm-org-rifle-agenda-files)))

(use-package idle-org-agenda
  :after org-agenda
  :config (idle-org-agenda-mode))


;; Org roam
(use-package
  org-roam
  :hook (after-init . org-roam-mode)
  :custom (org-roam-directory
	   (file-truename
	    "~/Nextcloud/org/org-roam"))
  (org-roam-buffer-position
   'bottom)
  :bind (:map org-roam-mode-map
	      (("C-c n l" . org-roam)
	       ("C-c n f" . org-roam-find-file)
	       ("C-c n g" . org-roam-graph))
	      :map org-mode-map
	      (("C-c n i" . org-roam-insert))
	      (("C-c n I" . org-roam-insert-immediate)))
  :config (setq org-roam-completion-system
		'default)
  (require 'org-roam-protocol))

(use-package org-roam-server
  :ensure t
  :config
  (setq org-roam-server-host "127.0.0.1"
        org-roam-server-port 9999
        org-roam-server-authenticate nil
        org-roam-server-export-inline-images t
        org-roam-server-serve-files nil
        org-roam-server-served-file-extensions '("pdf" "mp4" "ogv")
        org-roam-server-network-poll t
        org-roam-server-network-arrows nil
        org-roam-server-network-label-truncate t
        org-roam-server-network-label-truncate-length 60
        org-roam-server-network-label-wrap-length 20))


(message "Setup orgmode loaded.")
(provide 'setup-orgmode)

;;; setup-orgmode.el ends here

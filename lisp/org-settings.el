;; Publish haq project shortcut
(load "haq")
(defun org-publish-haq ()
  (interactive)
  (org-publish "haq" t)
  )

;; org-agenda files
(cond

 ((string-equal system-type "windows-nt")
  ;; Windows settings go here
  (setq org-agenda-files (quote ("C:/Users/vj/Dropbox/org/tasks.org")))
  ) 

 ((string-equal system-type "gnu/linux")
  ;; Linux settings go here
  (setq org-agenda-files (quote ("/home/vj/Dropbox/org/tasks.org")))
  )

 )


(use-package org-bullets
	     :ensure t
	     :config
	     (define-key modalka-mode-map (kbd "SPC c i") #'org-clock-in);; Clock in
	     (define-key modalka-mode-map (kbd "SPC c o") #'org-clock-out);; Clock out
	     (define-key modalka-mode-map (kbd "SPC c t") #'org-evaluate-time-range);; Clock update
	     (define-key modalka-mode-map (kbd "SPC c r") #'org-clock-report);; Clock update
	     (define-key modalka-mode-map (kbd "SPC e P") #'org-publish-haq)
	     (define-key modalka-mode-map (kbd "SPC e p") #'org-publish)
	     )

;; hooking up org-bullet mode
(require 'org-bullets)
(add-hook 'org-mode-hook
	  (lambda () (org-bullets-mode 1)))

(setq org-todo-keywords
      '((sequence "TODO" "DOING"  "PAUSE" "DONE" "WAITING" "CANCELLED")))

(setq org-todo-keyword-faces
      '(
	("TODO" . (:background "Red"))
	("WAITING" . (:background "Black" :foreground "White"))
	("PAUSE" . (:background "#8e44ad"))
	("DOING" .  (:background "#d98c10"))
	("DONE" . (:background "Sea green"))
	("CANCELLED" . (:foreground "Gray"))
	))

;; Org-babel <--- Love emacs
(org-babel-do-load-languages
 'org-babel-load-languages
 '((ditaa . t))) ; this line activates ditaa
(setq org-ditaa-jar-path "~/.emacs.d/ditaa/ditaa0_9.jar")


;; Artist mode settings
(eval-after-load "artist"
   '(define-key artist-mode-map [(down-mouse-3)] 'artist-mouse-choose-operation)
   )

;; Figure letter <- Cool fonts in ASCII
(use-package figlet
  :ensure t)
(require 'figlet)



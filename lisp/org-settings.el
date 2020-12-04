;; Publish haq project shortcut
(load "haq")
(defun org-publish-haq ()
  (interactive)
  (org-publish "haq" t)
  )

;; org-agenda files
(setq org-agenda-files (quote ("/home/vj/Dropbox/org/tasks.org")))

(use-package org-bullets
	     :ensure t
	     :config
	     (define-key modalka-mode-map (kbd "SPC c i") #'org-clock-in);; Clock in
	     (define-key modalka-mode-map (kbd "SPC c o") #'org-clock-out);; Clock out
	     (define-key modalka-mode-map (kbd "SPC c t") #'org-evaluate-time-range);; Clock update
	     (define-key modalka-mode-map (kbd "SPC c r") #'org-clock-report);; Clock update
	     (define-key modalka-mode-map (kbd "SPC e p") #'org-publish-haq)
	     )

;; hooking up org-bullet mode
(require 'org-bullets)
(add-hook 'org-mode-hook
	  (lambda () (org-bullets-mode 1)))

(setq org-todo-keywords
      '((sequence "TODO" "DOING" "WAITING" "DONE" "CANCELLED")))

(setq org-todo-keyword-faces
      '(
	("TODO" . "Red")
	("WAITING" . "Orange")
	("DOING" . "Yellow")
	("DONE" . "Green")
	("CANCELLED" . "Gray")
	))

;; Org-babel <--- Love emacs
(org-babel-do-load-languages
 'org-babel-load-languages
 '((ditaa . t))) ; this line activates ditaa
(setq org-ditaa-jar-path "/home/vj/.emacs.d/ditaa/ditaa0_9.jar")


;; Artist mode settings
(eval-after-load "artist"
   '(define-key artist-mode-map [(down-mouse-3)] 'artist-mouse-choose-operation)
   )

;; Figure letter <- Cool fonts in ASCII
(use-package figlet
  :ensure t)
(require 'figlet)



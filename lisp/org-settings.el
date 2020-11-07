(use-package org-bullets
  :ensure t)



;; hooking up org-bullet mode
(require 'org-bullets)
(add-hook 'org-mode-hook
	  (lambda () (org-bullets-mode 1))
	  ;; Org mode settings
	  (define-key modalka-mode-map (kbd "SPC m c i") #'org-clock-in);; Clock
	  (define-key modalka-mode-map (kbd "SPC m c o") #'org-clock-out);; Clock
	  )




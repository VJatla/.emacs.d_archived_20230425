(use-package org-bullets
	     :ensure t
	     :config
	     (define-key modalka-mode-map (kbd "SPC m c i") #'org-clock-in);; Clock in
	     (define-key modalka-mode-map (kbd "SPC m c o") #'org-clock-out);; Clock out
	     (define-key modalka-mode-map (kbd "SPC m c r") #'org-evaluate-time-range);; Clock update
	     )



;; hooking up org-bullet mode
(require 'org-bullets)
(add-hook 'org-mode-hook
	  (lambda () (org-bullets-mode 1)))

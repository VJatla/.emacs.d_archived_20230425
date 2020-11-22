(use-package org-bullets
	     :ensure t
	     :config
	     (define-key modalka-mode-map (kbd "SPC c i") #'org-clock-in);; Clock in
	     (define-key modalka-mode-map (kbd "SPC c o") #'org-clock-out);; Clock out
	     (define-key modalka-mode-map (kbd "SPC c t") #'org-evaluate-time-range);; Clock update
	     (define-key modalka-mode-map (kbd "SPC c r") #'org-clock-report);; Clock update
	     )

;; hooking up org-bullet mode
(require 'org-bullets)
(add-hook 'org-mode-hook
	  (lambda () (org-bullets-mode 1)
	    (local-set-key (kbd "SPC e") 'my-org-publish-buffer)))


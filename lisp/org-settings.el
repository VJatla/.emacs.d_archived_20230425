;; Hide the empnasis markers
(setq org-hide-emphasis-markers t)

;; Hooks
(add-hook 'org-mode-hook 'org-indent-mode)

;; Org bullet mode
(use-package org-bullets
  :ensure t)
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

;; List
(font-lock-add-keywords
 'org-mode
 '(("^ *\\([-]\\) "
    (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))

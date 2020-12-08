;; Packages
(use-package jedi
  :ensure t)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)


;; Settings
(setq python-indent-guess-indent-offset nil)


;; Key bindings
;; SPC m d = Go to python definition using jedi

(define-key modalka-mode-map (kbd "SPC m d") #'jedi:goto-definition)





;; Basic settings
(setq python-indent-guess-indent-offset nil)

;; jedi
(use-package jedi
  :ensure t)

;; company-jedi
(use-package company-jedi
  :ensure t)

;; Python mode hook
(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi)
  (define-key modalka-mode-map (kbd "f") #'jedi:goto-definition)
  (jedi-mode))

(add-hook 'python-mode-hook 'my/python-mode-hook)





;; Using anaconda mode
;; (use-package anaconda-mode
;;   :ensure t)
;; (add-hook 'python-mode-hook 'anaconda-mode)
;; (add-hook 'python-mode-hook 'anaconda-eldoc-mode)

;; ;; company-anaconda
;; (use-package company-anaconda
;;   :ensure t)
;; (eval-after-load "company"
;;  '(add-to-list 'company-backends 'company-anaconda))

(use-package markdown-mode
  :ensure t)

(use-package vmd-mode
:ensure t)


(require 'cl-lib)
(require 'company)

(defun vmd-company-backend (command &optional arg &rest ignored)
  (interactive (list 'interactive))

  (cl-case command
    (interactive (company-begin-backend 'company-sample-backend))
    (prefix (and (eq major-mode 'fundamental-mode)
                 (company-grab-symbol)))
    (candidates
     (cl-remove-if-not
      (lambda (c) (string-prefix-p arg c))
      vmd-mode/github-emojis-list))))

(add-to-list 'company-backends 'vmd-company-backend)

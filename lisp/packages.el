(require 'package) ;; Emacs builtin

;; set package.el repositories
(setq package-archives
      '(
	("melpa" . "https://melpa.org/packages/")
	)
      )

;; Initialize built-in package management
(package-initialize)
;; Simple clip
(use-package simpleclip
	      :ensure t
	      )
(require 'simpleclip)
(simpleclip-mode 1)

;; Org mode settings
(load (expand-file-name "~/.emacs.d/lisp/org-settings.el"))

;; whick-key
;; Link: https://github.com/justbur/emacs-which-key
;; Doc:
;;     Shows available options for key press
(use-package which-key
	      :ensure t
	      )
(require 'which-key)
(which-key-mode)

;; Ivy: a generic completion mechanism for Emacs
;; Counsel: a collection of Ivy-enhanced versions of common Emacs commands.
;; Swiper: an Ivy-enhanced alternative to isearch.
(use-package ivy
	      :ensure t)
(use-package counsel
	      :ensure t)
(use-package swiper
	      :ensure t)
(require 'ivy)
(require 'counsel)
(require 'swiper)
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(setq search-default-mode #'char-fold-to-regexp)


;; Projectivel to help with projects
(use-package projectile
  :ensure t)
(projectile-mode +1)


;; Treemacs: A very nice sidebar having projects
(use-package treemacs
	      :ensure t)
(require 'treemacs)

;; Window jump easy
(use-package window-jump
	      :ensure t)
(require 'window-jump)

;; Python

;; conda
(use-package conda
	      :ensure t)
(require 'conda)
(custom-set-variables
 '(conda-anaconda-home "/home/vj/anaconda3"))
(setq
 conda-env-home-directory "/home/vj/anaconda3"
 conda-env-subdirectory "envs")
(conda-env-activate "torch160")

;; For now I am using elpy, should change
;; to anaconda-mode when I have a chance
(use-package elpy
	     :ensure t)
(add-hook 'elpy-mode-hook
	  (lambda ()
            (add-hook 'before-save-hook
                      'elpy-format-code nil t)))
(require 'elpy)
(elpy-enable)


;; Load evil mode but do not activate it
(use-package evil
	    :ensure t)
(require 'evil)
(evil-mode -1)

;; Modal editing for text and code
(use-package modalka
   :ensure t)
(require 'modalka)
(load "custom-modalka-kbd")
(modalka-global-mode 1)
(setq-default cursor-type '(bar . 3))     ;; Shape of cursor in different modes
(setq modalka-cursor-type 'box)

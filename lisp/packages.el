(require 'package) ;; Emacs builtin

;; set package.el repositories
(setq package-archives
      '(
	("gnu" . "https://elpa.gnu.org/packages/")
	("melpa" . "https://melpa.org/packages/")
	)
      )

;; Initialize built-in package management
(package-initialize)

;; Install use-package if not installed yet
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Themes
(use-package spacegray-theme
  :ensure t)

(use-package nord-theme
  :ensure t)
(use-package zenburn-theme
  :ensure t)
(use-package planet-theme
  :ensure t)


;; Simple clip
(use-package simpleclip
	      :ensure t
	      )
(require 'simpleclip)
(simpleclip-mode 1)

;; Git
(use-package magit
  :ensure t)
(require 'magit)
(use-package git-gutter
  :ensure t
  )
(global-git-gutter-mode +1)

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
  :ensure t
  :config
  (setq ivy-use-virtual-buffers t
        ivy-count-format "%d/%d "))
(use-package counsel
	      :ensure t)
(use-package swiper
  :ensure t)
(use-package ivy-avy
  :ensure t)
(use-package avy
  :ensure t)
(require 'ivy)
(require 'counsel)
(require 'swiper)
(ivy-mode 1)
(setq enable-recursive-minibuffers t)
(setq search-default-mode #'char-fold-to-regexp)


;; Helm
(use-package helm
  :ensure t)
(require 'helm)
(helm-mode -1)

;; Projectile to help with projects
(use-package projectile
  :ensure t)
(projectile-mode +1)

;; for projectile I use helm
(use-package helm-projectile
  :ensure t)
(helm-projectile-on)


;; Treemacs: A very nice sidebar having projects
(use-package treemacs
	      :ensure t)
(require 'treemacs)

;; Projectile + treemacs
(use-package treemacs-projectile
  :ensure t)

;; Window jump easy
(use-package window-jump
	      :ensure t)
(require 'window-jump)

;; Autocompletion using company-mode
;; Installing company mode
(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  (setq company-idle-delay 0)  ;; Disable the delay
  (company-tng-configure-default))  ;; Enable tab style completion

;; Markdown
(load "markdown-settings")

;; Python-settings
(load "python-settings")

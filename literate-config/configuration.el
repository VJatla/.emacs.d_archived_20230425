;; Information  
(setq user-mail-address "venkatesh.jatla@gmail.com")

;; Package repositories 
(setq package-archives
      '(
	("gnu" . "https://elpa.gnu.org/packages/")
	("melpa" . "https://melpa.org/packages/")
	)
      )

;; Activating use-package (Installing if not found)
(require 'package)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Whick-key
(use-package which-key
  :ensure t)
(which-key-mode)

(setq inhibit-startup-screen t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(setq visible-bell 1)

(set-frame-font "Fira Code Retina 15" nil t)
(use-package fira-code-mode
:ensure t
:custom (fira-code-mode-disabled-ligatures '("[]" "#{" "#(" "#_" "#_(" "x"))
:config
(add-hook 'prog-mode-hook 'fira-code-mode)
(add-hook 'text-mode-hook 'fira-code-mode))

(use-package smooth-scrolling
:ensure t
:config
(require 'smooth-scrolling)
(smooth-scrolling-mode 1))

(use-package gcmh
:ensure t
:config
(gcmh-mode 1))

(use-package solarized-theme
:ensure t
:config
(load-theme 'orchid t))

(use-package dashboard
 :ensure t
 :config
(dashboard-setup-startup-hook)
(setq dashboard-set-heading-icons t)
(setq dashboard-set-file-icons t)
(setq dashboard-items '(
(agenda . 5)
(projects . 5)
(recents  . 5)
(bookmarks . 5)
(registers . 5))))

(use-package all-the-icons
:ensure t)

(use-package company
:ensure t
:config
(add-hook 'after-init-hook 'global-company-mode))

(use-package flx
:ensure t
:defer t)
(use-package flx-ido
:ensure t
:defer t
:config 
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-use-faces nil)
(setq ido-use-virtual-buffers t))
(use-package smex
:ensure t
:config
(smex-initialize))

(use-package projectile
:ensure t
:config
(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

(use-package treemacs
:ensure t
:defer t
)

(use-package magit
:ensure t)

(use-package git-gutter
:ensure t
:config
(add-hook 'prog-mode-hook 'git-gutter-mode)
(add-hook 'text-mode-hook 'git-gutter-mode))

(use-package direx
:ensure t)

(use-package wakatime-mode
:ensure t
:config
(global-wakatime-mode)
)
(custom-set-variables '(wakatime-api-key "948f1aa9-1e61-46dc-8e1f-eed41c05f2fa"))

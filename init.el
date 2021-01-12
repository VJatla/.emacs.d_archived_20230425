;;; Package repositories
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
(unless (package-installed-p 'org)
(package-refresh-contents)
  (package-install 'org))

;; All backup files are in one directory
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Load literate configuration file
(cond
  ;; Windows settings
 ((string-equal system-type "windows-nt")
  ;; The following path is necessary to get following working,
  ;; 1. wakatime
  ;; 2. anaconda-mode -- Python
  (setenv "PATH" (concat (getenv "PATH") "C:/Users/vj/scoop/apps/python/current/Scripts"))
  (setq exec-path (append exec-path '("C:/Users/vj/scoop/apps/python/current/Scripts")))

  (set-frame-font "JetBrains Mono Regular 13" nil t)
  )
 ;; Linux settings
 ((string-equal system-type "gnu/linux")
  ;; The following path is necessary to get following working,
  ;; 1. wakatime
  ;; 2. anaconda-mode
  (setenv "PATH" (concat (getenv "PATH") ":/home/vj/.local/bin"))
  (setq exec-path (append exec-path '("/home/vj/.local/bin")))
  )
 )

  ;; Loading literate config files
  (org-babel-load-file "~/.emacs.d/literate-config/configuration.org")
  (org-babel-load-file "~/.emacs.d/literate-config/keybindings.org")
  (org-babel-load-file "~/.emacs.d/literate-config/python.org")
  (org-babel-load-file "~/.emacs.d/literate-config/web.org")




;; Setting theme
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(xah-fly-keys which-key wakatime-mode use-package treemacs solarized-theme smooth-scrolling smex projectile modalka magit keyfreq key-chord highlight-symbol gruvbox-theme git-gutter gcmh direx dashboard counsel company-anaconda cfml-mode all-the-icons))
 '(wakatime-api-key "948f1aa9-1e61-46dc-8e1f-eed41c05f2fa"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

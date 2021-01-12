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

;; Theme and fonts based on syste name
(cond
((string-equal (system-name) "EMBER")
(load-theme 'gruvbox-dark-soft t)
);; ember

((string-equal (system-name) "AZUL-WIN")
 (set-frame-font "JetBrains Mono Regular 13" nil t)
 (load-theme 'sanityinc-tomorrow-day t)
);; azul-win

((string-equal (system-name) "XPS-WIN")
(load-theme 'sanityinc-tomorrow-eighties t)
);; xps-win

) ;; cond



;; Setting theme
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#000000" "#d54e53" "#b9ca4a" "#e7c547" "#7aa6da" "#c397d8" "#70c0b1" "#eaeaea"))
 '(beacon-color "#d54e53")
 '(custom-safe-themes
   '("bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" default))
 '(fci-rule-color "#424242")
 '(flycheck-color-mode-line-face-to-color 'mode-line-buffer-id)
 '(frame-background-mode 'dark)
 '(package-selected-packages
   '(xah-fly-keys which-key wakatime-mode use-package treemacs solarized-theme smooth-scrolling smex projectile modalka magit keyfreq key-chord highlight-symbol gruvbox-theme git-gutter gcmh direx dashboard counsel company-anaconda cfml-mode all-the-icons))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   '((20 . "#d54e53")
     (40 . "#e78c45")
     (60 . "#e7c547")
     (80 . "#b9ca4a")
     (100 . "#70c0b1")
     (120 . "#7aa6da")
     (140 . "#c397d8")
     (160 . "#d54e53")
     (180 . "#e78c45")
     (200 . "#e7c547")
     (220 . "#b9ca4a")
     (240 . "#70c0b1")
     (260 . "#7aa6da")
     (280 . "#c397d8")
     (300 . "#d54e53")
     (320 . "#e78c45")
     (340 . "#e7c547")
     (360 . "#b9ca4a")))
 '(vc-annotate-very-old-color nil)
 '(wakatime-api-key "948f1aa9-1e61-46dc-8e1f-eed41c05f2fa")
 '(wakatime-cli-path
   "c:/Users/vj/scoop/apps/python/current/Scripts/wakatime.exe")
 '(wakatime-python-bin nil)
 '(window-divider-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

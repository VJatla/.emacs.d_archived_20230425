;;; Package repositories
(setq package-archives
      '(
	("gnu" . "https://elpa.gnu.org/packages/")
	("melpa" . "https://melpa.org/packages/")
	)
      )

;; Shutdown emacs server function
;; define function to shutdown emacs server instance
(defun server-shutdown ()
  "Save buffers, Quit, and Shutdown (kill) server"
  (interactive)
  (save-some-buffers)
  (kill-emacs)
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
(org-babel-load-file "~/.emacs.d/literate-config/python.org")
(org-babel-load-file "~/.emacs.d/literate-config/web.org")
(org-babel-load-file "~/.emacs.d/literate-config/keybindings.org")

;; Theme and fonts based on syste name
(cond
 ((string-equal (system-name) "ember")
  (load-theme 'gruvbox-dark-soft t)
  (set-frame-font "Fantasque Sans Mono 13" nil t)
  );; ember

 ((string-equal (system-name) "AZUL-WIN")
  (set-frame-font "JetBrains Mono Regular 13" nil t)
  (load-theme 'sanityinc-tomorrow-day t)
  );; azul-win

 ((string-equal (system-name) "XPS-WIN")
  (load-theme 'sanityinc-tomorrow-eighties t)
  );; xps-win
 ) ;; cond
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#3c3836" "#fb4933" "#b8bb26" "#fabd2f" "#83a598" "#d3869b" "#8ec07c" "#ebdbb2"])
 '(custom-safe-themes
   '("83e0376b5df8d6a3fbdfffb9fb0e8cf41a11799d9471293a810deb7586c131e6" default))
 '(package-selected-packages
   '(neotree py-autopep8 xah-fly-keys which-key wakatime-mode use-package treemacs solarized-theme smooth-scrolling smex projectile org modalka markdown-mode+ magit keyfreq key-chord highlight-symbol gruvbox-theme git-gutter gcmh flycheck-pos-tip flycheck-popup-tip direx dashboard counsel company-anaconda color-theme-sanityinc-tomorrow cfml-mode all-the-icons))
 '(pdf-view-midnight-colors '("#fdf4c1" . "#32302f"))
 '(wakatime-api-key "948f1aa9-1e61-46dc-8e1f-eed41c05f2fa")
 '(wakatime-cli-path "/home/vj/.local/bin/wakatime")
 '(wakatime-python-bin nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

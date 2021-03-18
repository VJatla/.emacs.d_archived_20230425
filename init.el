 ;;; Custom set variables to different file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

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
 (setq org-agenda-include-diary t)
(cond
 ;; Windows settings
 ((string-equal system-type "windows-nt")
  ;; The following path is necessary to get following working,
  ;; 1. wakatime
  ;; 2. anaconda-mode -- Python
  (setq org-agenda-files '("C:/Users/vj/Dropbox/org/tasks"))
  (setq diary-file "C:/Users/vj/Dropbox/org/diary-file")
  (setenv "PATH" (concat (getenv "PATH") "C:/Users/vj/scoop/apps/python/current/Scripts"))
  (setq exec-path (append exec-path '("C:/Users/vj/scoop/apps/python/current/Scripts")))


  )
 ;; Linux settings
 ((string-equal system-type "gnu/linux")
  ;; The following path is necessary to get following working,
  ;; 1. wakatime
  ;; 2. anaconda-mode
  (setq org-agenda-files '("~/Dropbox/org/tasks"))
  (setq diary-file "~/Dropbox/org/diary-file")
  (setenv "PATH" (concat (getenv "PATH") ":/home/vj/.local/bin"))
  (setq exec-path (append exec-path '("/home/vj/.local/bin")))
  (setenv "PATH" (concat (getenv "PATH") ":/home/vj/anaconda3/bin"))
  (setq exec-path (append exec-path '("/home/vj/anaconda3/bin")))
  )
 )

;; Loading literate config files
(org-babel-load-file "~/.emacs.d/literate-config/configuration.org")
(org-babel-load-file "~/.emacs.d/literate-config/keybindings.org")
(org-babel-load-file "~/.emacs.d/literate-config/python.org")
(org-babel-load-file "~/.emacs.d/literate-config/web.org")

;; Theme and fonts based on syste name
(cond


 ((string-equal (system-name) "ember")
  (load-theme 'gruvbox-dark-soft t)
  (set-frame-font "Fantasque Sans Mono 14" nil t)
  (add-to-list 'default-frame-alist '(height . 140))
  (add-to-list 'default-frame-alist '(width . 100))
  );; ember


 ((string-equal (system-name) "gojira")
   (load-theme 'zenburn t)
  (set-frame-font "Fantasque Sans Mono 13" nil t)
  (add-to-list 'default-frame-alist '(height . 50))
  (add-to-list 'default-frame-alist '(width . 100))
  );; gojira-nx


  ((string-equal (system-name) "precision7920")
   (load-theme 'gruvbox-dark-soft t)
  (set-frame-font "DejaVu Sans Mono 11" nil t)
  (add-to-list 'default-frame-alist '(height . 50))
  (add-to-list 'default-frame-alist '(width . 100))
  );; Precision7920 or RTX3


 ((string-equal (system-name) "AZUL-WIN")
  (set-frame-font "JetBrains Mono Regular 13" nil t)
  (load-theme 'sanityinc-tomorrow-day t)
  );; azul-win


 ((string-equal (system-name) "XPS-WIN")
  (load-theme 'spacemacs-light t)
  (set-frame-font "JetBrains Mono Regular 13" nil t)
  );; XPS-WIN - Native



 ((string-equal (system-name) "xps-win")
  (load-theme 'spacemacs-dark t)
   (set-frame-font "Fira Code Retina 13" nil t)
   );; xps-win (WSL)

) ;; cond

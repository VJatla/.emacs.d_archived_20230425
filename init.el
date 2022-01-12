;;; Custom set variables to different file
(setq package-check-signature nil)
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; Disable themes
(defun disable-all-themes ()
  "disable all active themes."
  (dolist (i custom-enabled-themes)
    (disable-theme i)))
(disable-all-themes)

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
;;  (setq wakatime-python-bin '("C:/msys64/mingw64/bin/python.exe"))
;;  (setq wakatime-cli-path '("C:/ProgramData/Anaconda3/Scripts/wakatime.exe"))
  
  (setq org-agenda-files '("C:/Users/vj/Dropbox/org/tasks"))
  (setq diary-file "C:/Users/vj/Dropbox/org/diary-file")
  
  (setenv "PATH" (concat (getenv "PATH") "C:/msys64/mingw64/bin/"))
  (setq exec-path (append exec-path '("C:/msys64/mingw64/bin/")))
  )

 ;; Darwin
 ((string-equal system-type "darwin")

  (setq org-agenda-files '("/Users/vj/Dropbox/org/tasks"))
  (setq diary-file "/Users/vj/Dropbox/org/diary-file")
  (custom-set-variables '(wakatime-cli-path "/opt/anaconda3/bin/wakatime"))
  
  (add-to-list 'default-frame-alist
               '(font . "Menlo-13"))
  (use-package color-theme-sanityinc-tomorrow
    :ensure t)
  (load-theme 'sanityinc-tomorrow-day t)
  
  )
 
 ;; Linux settings
 ((string-equal system-type "gnu/linux")
  ;; The following path is necessary to get following working,
  ;; 1. wakatime
  ;; 2. anaconda-mode
  (setq diary-file "/home/vj/Dropbox/org/diary-file")
  (setq org-agenda-files '("/home/vj/Dropbox/org/tasks"))
  (setenv "PATH" (concat (getenv "PATH") ":/home/vj/.local/bin"))
  (setq exec-path (append exec-path '("/home/vj/.local/bin")))
  (setenv "PATH" (concat (getenv "PATH") ":/home/vj/anaconda3/bin"))
  (setq exec-path (append exec-path '("/home/vj/anaconda3/bin")))
  )
 )

;; Loading literate config files
(org-babel-load-file "~/.emacs.d/literate-config/configuration.org")
(org-babel-load-file "~/.emacs.d/literate-config/keybindings/keybindings.org")
(org-babel-load-file "~/.emacs.d/literate-config/python.org")
(org-babel-load-file "~/.emacs.d/literate-config/json.org")
(org-babel-load-file "~/.emacs.d/literate-config/web.org")
(org-babel-load-file "~/.emacs.d/literate-config/latex.org")
(org-babel-load-file "~/.emacs.d/literate-config/elisp.org")
(org-babel-load-file "~/.emacs.d/literate-config/org.org")


;; Theme and fonts based on system name
(cond
 ((string-equal (system-name) "aurora")
  (use-package nord-theme
    :ensure t)
   (load-theme 'nord t)
  (setq org-agenda-files '("/home/vj/Dropbox/org/tasks"))
  (setq diary-file "/home/vj/Dropbox/org/diary-file")
  (add-to-list 'default-frame-alist
               '(font . "LiberationMono-12"))
  );; Jolly




  ((string-equal (upcase (system-name)) "SUSE")
   (load-theme 'spacemacs-dark t)
  (setq org-agenda-files '("/home/vj/Dropbox/org/tasks"))
  (setq diary-file "/home/vj/Dropbox/org/diary-file")
  (add-to-list 'default-frame-alist
               '(font . "LiberationMono-14.5"))
  );; Suse

  ((string-equal (upcase (system-name)) "YANTRAM")
   (use-package leuven-theme
     :ensure t)
   (load-theme 'leuven t)
  (setq org-agenda-files '("/home/vj/Dropbox/org/tasks"))
  (setq diary-file "/home/vj/Dropbox/org/diary-file")
  (add-to-list 'default-frame-alist
               '(font . "JetBrainsMono Nerd Font-14.5"))
  );; YANTRA


 ((string-equal (system-name) "black-pearl")
  (load-theme 'base16-tomorrow-night t)
       (add-to-list 'default-frame-alist
		    '(font . "mononoki-14.5"))
            (custom-set-variables '(wakatime-cli-path "/home/vj/.local/bin/wakatime"))
  );; Black pearl
 
  ((string-equal (system-name) "XPS-WIN")
  (load-theme 'sanityinc-tomorrow-eighties t)
     (add-to-list 'default-frame-alist
		'(font . "JetBrains Mono Medium-12"))
     );; xps-win

  ((string-equal (upcase (system-name)) "NIMBUS")
   (use-package color-theme-sanityinc-tomorrow
     :ensure t)
     (load-theme 'sanityinc-tomorrow-eighties t)
     (add-to-list 'default-frame-alist
		  '(font . "FiraCode Nerd Font Mono-24"))
     (custom-set-variables '(wakatime-cli-path "/home/vj/.local/bin/wakatime"))
     
     );; xps-win (WSL)


    ((string-equal (upcase (system-name)) "SAIL")
   (use-package zenburn-theme
     :ensure t)
   (load-theme 'zenburn t)
        (add-to-list 'default-frame-alist
		  '(font . "JetBrains Mono-14.5"))

     (custom-set-variables '(wakatime-cli-path "/home/vj/anaconda3/bin/wakatime"))
     );; XPS


    ((string-equal (system-name) "EM0456E55E16C2")
     (use-package monokai-pro-theme
       :ensure t)
  (load-theme 'monokai-pro t)
     (add-to-list 'default-frame-alist
		  '(font . "JetBrains Mono Regular Nerd Font Complete Mono Windows Compatible-11"))

     (custom-set-variables '(wakatime-cli-path "c:/Users/vj/anaconda3/Scripts/wakatime"))
     );; EMED latitude 7420 laptop

    ((string-equal (system-name) "ember")
     (use-package gruvbox-theme
       :ensure t)
     (load-theme 'gruvbox-dark-soft t)
     (use-package fira-code-mode
       :ensure t
       :config
       (global-fira-code-mode t))
     (add-to-list 'default-frame-alist
		  '(font . "Fira Mono-11"))
     );; EMBER - Linux
    ) 


;; Use putty for windows <-- Cygwin doesn not need this
(when (eq window-system 'w32)
  (setq putty-directory "C:/Users/vj/scoop/apps/putty/current")
  (setq tramp-default-method "plink")
  (add-to-list 'exec-path putty-directory))

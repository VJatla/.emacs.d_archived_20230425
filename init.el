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

;; Org-agenda files
(defun org-get-agenda-files-recursively (dir)
  "Get org agenda files from root DIR."
  (directory-files-recursively dir "\.org$"))

(defun org-set-agenda-files-recursively (dir)
  "Set org-agenda files from root DIR."
  (setq org-agenda-files 
	(org-get-agenda-files-recursively dir)))

(defun org-add-agenda-files-recursively (dir)
  "Add org-agenda files from root DIR."
  (nconc org-agenda-files 
	 (org-get-agenda-files-recursively dir)))


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
  (setq org-agenda-files '("/home/vj/Dropbox/org/projects/active/"))
  (setenv "PATH" (concat (getenv "PATH") ":/home/vj/.local/bin"))
  (setq exec-path (append exec-path '("/home/vj/.local/bin")))
  (setenv "PATH" (concat (getenv "PATH") ":/home/vj/anaconda3/bin"))
  (setq exec-path (append exec-path '("/home/vj/anaconda3/bin")))
  )
 )

;; Loading literate config files
(org-babel-load-file "~/.emacs.d/literate-config/configuration.org")
(org-babel-load-file "~/.emacs.d/literate-config/keybindings/keybindings.org")
(org-babel-load-file "~/.emacs.d/literate-config/json.org")
(org-babel-load-file "~/.emacs.d/literate-config/web.org")
(org-babel-load-file "~/.emacs.d/literate-config/latex.org")
(org-babel-load-file "~/.emacs.d/literate-config/elisp.org")
(org-babel-load-file "~/.emacs.d/literate-config/org.org")

(org-babel-load-file "~/.emacs.d/literate-config/lsp.org")

(org-babel-load-file "~/.emacs.d/literate-config/cpp.org")
(org-babel-load-file "~/.emacs.d/literate-config/python.org")


;; Theme and fonts based on system name
(cond
 ((string-equal (system-name) "aurora.example.org")
  (use-package color-theme-sanityinc-tomorrow
    :ensure t)
  (load-theme 'sanityinc-tomorrow-eighties t)
  (add-to-list 'default-frame-alist
               '(font . "Liberation Mono-16"))
  (setq org-agenda-files nil) ; zero out for testing
  (org-set-agenda-files-recursively "/home/vj/Dropbox/org/")
  (setq diary-file "/home/vj/Dropbox/org/diary-file")
  ;; Python environment
  (setenv "WORKON_HOME" "/home/vj/anaconda3/envs/")
  (custom-set-variables '(wakatime-cli-path "/home/vj/.local/bin/wakatime"))
  );; MX@aurora


 ((string-equal (system-name) "P7920")

  ;; Theme
  (use-package nord-theme
    :ensure t)
  (load-theme 'nord t)

  ;; Font
  (add-to-list 'default-frame-alist
	       '(font . "JetBrains Mono-14"))

  ;; Binary file paths
  (custom-set-variables '(wakatime-cli-path "/home/vj/.local/bin/wakatime"))

  ;; Python HOME environment
  (setenv "WORKON_HOME" "/home/vj/anaconda3/envs/")
  
  );; 
 
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
		  '(font . "JetBrains Mono-14"))
     (setq treemacs-python-executable "/home/vj/anaconda3/bin/python")
     (custom-set-variables '(wakatime-cli-path "/home/vj/anaconda3/bin/wakatime"))
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

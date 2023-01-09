;;; Custom set variables to different fil
;;;
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
	("melpa" . "https://melpa.org/packages/")
	 ("gnu-devel" ."https://elpa.gnu.org/devel/")
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




;; Copy paste using wsl
(defun wsl-copy-region-to-clipboard (start end)
  "Copy region to Windows clipboard."
  (interactive "r")
  (call-process-region start end "clip.exe" nil 0))

(defun wsl-cut-region-to-clipboard (start end)
  (interactive "r")
  (call-process-region start end "clip.exe" nil 0)
  (kill-region start end))

(defun wsl-clipboard-to-string ()
  "Return Windows clipboard as string."
  (let ((coding-system-for-read 'dos))
(substring; remove added trailing \n
 (shell-command-to-string
  "powershell.exe -Command Get-Clipboard") 0 -1)))

(defun wsl-paste-from-clipboard (arg)
  "Insert Windows clipboard at point. With prefix ARG, also add to kill-ring"
  (interactive "P")
  (let ((clip (wsl-clipboard-to-string)))
(insert clip)
(if arg (kill-new clip))))




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
  
  (setq org-agenda-files '("C:/Users/vj/Dropbox/org/tasks/active"))
  (setq diary-file "C:/Users/vj/Dropbox/org/diary-file")
  (setenv "PATH" (concat (getenv "PATH") "C:/msys64/mingw64/bin/"))
  (setq exec-path (append exec-path '("C:/msys64/mingw64/bin/")))
  )

 ;; Darwin
 ((string-equal system-type "darwin")

  (setq org-agenda-files '("/Users/vj/Dropbox/org/tasks/active"))
  (setq diary-file "/Users/vj/Dropbox/org/diary-file")
  (custom-set-variables '(wakatime-cli-path "/opt/anaconda3/bin/wakatime"))
  
  (add-to-list 'default-frame-alist
               '(font . "Menlo-12"))
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
  (setq org-agenda-files '("/home/vj/Dropbox/org/tasks/active"))
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

(org-babel-load-file "~/.emacs.d/literate-config/cpp.org")
(org-babel-load-file "~/.emacs.d/literate-config/python.org")


;; Theme and fonts based on system name
(cond

 ((string-equal (upcase (system-name)) "NILGIRI")
  (use-package monokai-pro-theme
    :ensure t)
  (use-package dracula-theme
    :ensure t)
    (use-package color-theme-sanityinc-tomorrow
    :ensure t)
  
  (load-theme 'sanityinc-tomorrow-eighties t)
  (setq zenburn-scale-org-headlines t)
  (add-to-list 'default-frame-alist
               '(font . "DejaVu Sans Mono-13"))
  (setq org-agenda-files nil) ; zero out for testing
  (org-set-agenda-files-recursively "/home/vj/Dropbox/org/tasks/active")
  (setq diary-file "/home/vj/Dropbox/org/diary-file")
  ;; Python environment
  (setenv "WORKON_HOME" "/home/vj/anaconda3/envs/")
  (custom-set-variables '(wakatime-cli-path "/home/vj/anaconda3/bin/wakatime"))
  );; mrmoose


  ((string-equal (system-name) "P7920")

  ;; Theme
  (load-theme 'tango-dark t)
  

  ;; Font 
  (add-to-list 'default-frame-alist
	       '(font . "Jetbrains Mono-14"))

  ;; Binary file paths
  (custom-set-variables '(wakatime-cli-path "/home/vj/.local/bin/wakatime"))

  ;; Python HOME environment
  (setq python-python-command "/home/vj/anaconda3/envs/haq/bin/python")
  (setq elpy-rpc-virtualenv-path "/home/vj/anaconda3/envs/haq/")
  (setenv "WORKON_HOME" "/home/vj/anaconda3/envs/")
  );; 
 
  ((string-equal (system-name) "XPS-WIN")
  (load-theme 'sanityinc-tomorrow-eighties t)
     (add-to-list 'default-frame-alist
		'(font . "FiraCode-Retina-13"))
     );; xps-win


  ((string-equal (upcase (system-name)) "IVORY.LOCAL")
  
  (load-theme 'solarized-light t)
  (add-to-list 'default-frame-alist
                '(font . "Victor Mono-16"))
  (setq org-agenda-files nil) ; zero out for testing
  (org-set-agenda-files-recursively "/Users/vj/Dropbox/org/tasks/active")
  (setq diary-file "/Users/vj/Dropbox/org/diary-file")
  ;; Python environment
  (setenv "WORKON_HOME" "/Users/vj/opt/anaconda3/envs/")


  (setq mac-command-modifier 'control)
  (setq mac-control-modifier 'meta)
  (setq mac-option-modifier 'meta)
  
  );; mrmoose

  

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
     (add-to-list 'default-frame-alist
		  '(font . "Fira Code-12"))
     );; EMBER - Linux


        ((string-equal (system-name) "onyx")
     (use-package zenburn-theme
       :ensure t)
     (load-theme 'zenburn t)
     (add-to-list 'default-frame-alist
		  '(font . "JetBrains Mono-12"))
     );; EMBER - Linux

	
    )


;; Use putty for windows <-- Cygwin doesn not need this
(when (eq window-system 'w32)
  (setq putty-directory "C:/Users/vj/scoop/apps/putty/current")
  (setq tramp-default-method "plink")
  (add-to-list 'exec-path putty-directory))




(define-key global-map (kbd "C-x C-y") 'wsl-paste-from-clipboard)
(define-key global-map (kbd "C-x M-w") 'wsl-copy-region-to-clipboard)
(define-key global-map (kbd "C-x C-w") 'wsl-cut-region-to-clipboard)

  (setq mac-command-modifier 'control)
  (setq mac-control-modifier 'meta)
(setq mac-option-modifier 'meta)
(put 'upcase-region 'disabled nil)

(defun  quick-buffer-switch ()
  (interactive)
  (switch-to-buffer nil))

;; Selection functions
(defun select-till-buffer-end ()
  (interactive)
  (xah-select-block)
  (end-of-buffer))

;; Use f5 to run based on major mode
(add-hook 'python-mode-hook
	(lambda () 
	  (local-set-key (kbd "<f5>") #'python-shell-send-buffer)	  
	)
)
(add-hook 'emacs-lisp-mode-hook
	(lambda () 
		(local-set-key (kbd "<f5>") #'eval-buffer)
	)
)
(add-hook 'org-mode-hook
	(lambda ()
		(local-set-key (kbd "<f5>") #'haq)))

;; Initializing modalka
(require 'modalka)
(add-hook 'text-mode-hook #'modalka-mode)
(add-hook 'prog-mode-hook #'modalka-mode)
(setq-default cursor-type '(bar . 3))     ;; Shape of cursor in different modes
(setq modalka-cursor-type 'box)


;; Global keybindings
(define-key key-translation-map (kbd "ESC") #'modalka-mode)


;; Ivy, swiper and counsel
;; (global-set-key "\C-s" 'swiper)
;; (global-set-key (kbd "C-c C-r") 'ivy-resume)
;; (global-set-key (kbd "<f6>") 'ivy-resume)
;; (global-set-key (kbd "M-x") 'counsel-M-x)
;;(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> o") 'counsel-describe-symbol)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
;; (global-set-key (kbd "C-c g") 'counsel-git)
;; (global-set-key (kbd "C-c j") 'counsel-git-grep)
;; (global-set-key (kbd "C-c k") 'counsel-ag)
;; (global-set-key (kbd "C-x l") 'counsel-locate)
;; (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
;; (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)


;; Window key bindings
(define-key modalka-mode-map (kbd "SPC w o") #'other-window)
(define-key modalka-mode-map (kbd "SPC w 1") #'delete-other-windows)
(define-key modalka-mode-map (kbd "SPC w |") #'split-window-horizontally)
(define-key modalka-mode-map (kbd "SPC w -") #'split-window-vertically)
(define-key modalka-mode-map (kbd "SPC w d") #'delete-window)
(define-key modalka-mode-map (kbd "SPC j") #'window-jump-left) ;; <--- I use these often
(define-key modalka-mode-map (kbd "SPC l") #'window-jump-right);; <--- Use these often
(define-key modalka-mode-map (kbd "SPC w i") #'window-jump-up)
(define-key modalka-mode-map (kbd "SPC w k") #'window-jump-down)
(define-key modalka-mode-map (kbd "SPC w <left>") 'shrink-window-horizontally)
(define-key modalka-mode-map (kbd "SPC w <right>") 'enlarge-window-horizontally)
(define-key modalka-mode-map (kbd "SPC w <down>") 'shrink-window)
(define-key modalka-mode-map (kbd "SPC w <up>") 'enlarge-window)


;; Movement key bindings
(define-key modalka-mode-map (kbd "i") #'previous-line)
(define-key modalka-mode-map (kbd "k") #'next-line)
(define-key modalka-mode-map (kbd "l") #'forward-char)
(define-key modalka-mode-map (kbd "j") #'backward-char)
(define-key modalka-mode-map (kbd "w") #'forward-word)
(define-key modalka-mode-map (kbd "b") #'backward-word)
(define-key modalka-mode-map (kbd "e") #'move-end-of-line)
(define-key modalka-mode-map (kbd "0") #'move-beginning-of-line)
(define-key modalka-mode-map (kbd "g g") #'beginning-of-buffer)
(define-key modalka-mode-map (kbd "G") #'end-of-buffer)





;; File and buffer operations
(define-key modalka-mode-map (kbd "SPC s") #'save-buffer)
(define-key modalka-mode-map (kbd "SPC o") #'counsel-find-file)
(define-key modalka-mode-map (kbd "SPC r") #'recentf-open-files)
(define-key modalka-mode-map (kbd "SPC k") #'kill-buffer)
(define-key modalka-mode-map (kbd "SPC a") #'helm-M-x) 
(define-key modalka-mode-map (kbd "#") #'goto-line)
(define-key modalka-mode-map (kbd "SPC f") #'ivy-switch-buffer)
(define-key modalka-mode-map (kbd "SPC c c") #'save-buffers-kill-terminal)


;; Copy paste management
(define-key modalka-mode-map (kbd "c") #'kill-ring-save);; M-w
(define-key modalka-mode-map (kbd "C") #'simpleclip-copy)
(define-key modalka-mode-map (kbd "x") #'kill-region);; C-w
(define-key modalka-mode-map (kbd "X") #'simpleclip-cut)
(define-key modalka-mode-map (kbd "v") #'yank);; C-y
(define-key modalka-mode-map (kbd "V") #'simpleclip-paste)


;; Git project operations (using counsel for now)
(define-key modalka-mode-map (kbd "SPC g g") #'magit-status) ;; find files in project
(define-key modalka-mode-map (kbd "SPC g o") #'counsel-git) ;; find files in project
(define-key modalka-mode-map (kbd "SPC g /") #'counsel-git-grep) ;; grep inside git repository

;; Treemacs adn Projectile
(define-key modalka-mode-map (kbd "SPC t") #'treemacs) ;; open treemacs
(define-key modalka-mode-map (kbd "SPC p") #'projectile-command-map) ;; Projectile command map




(define-key modalka-mode-map (kbd "s") #'swiper);; C-s


;; Code editing
(define-key modalka-mode-map (kbd "r") #'query-replace);; C-s
(define-key modalka-mode-map (kbd "SPC SPC") #'modalka-mode) ;;
(define-key modalka-mode-map (kbd "d w") #'kill-word);; M-d
(define-key modalka-mode-map (kbd "d b") #'delete-backward-word);; M-d
(define-key modalka-mode-map (kbd "d l") #'kill-whole-line);; kill till end of the line
(define-key modalka-mode-map (kbd "d e") #'kill-line);; kill till end of the line
(define-key modalka-mode-map (kbd ";") #'comment-dwim);; kill till end of the line
(define-key modalka-mode-map (kbd "u") #'undo);; C-_

;; Selection
(define-key modalka-mode-map (kbd "m s") #'set-mark-command);; C-SPC
(define-key modalka-mode-map (kbd "p") #'pop-to-mark-command);; C-s
(define-key modalka-mode-map (kbd "m l") #'xah-select-line);; C-s
(define-key modalka-mode-map (kbd "m G") #'select-till-buffer-end);; C-sh
(define-key modalka-mode-map (kbd "m r") #'rectangle-mark-mode);; C-sh

;; Bookmarks
(define-key modalka-mode-map (kbd "SPC * s") #'bookmark-set);; C-x r m
(define-key modalka-mode-map (kbd "SPC * j") #'bookmark-jump);; C-x r b

;; Repeat last command
(define-key modalka-mode-map (kbd ",") #'repeat);; C-x r m

;; miscellaneous
(define-key modalka-mode-map (kbd "SPC q") #'quick-calc)    ;; quick calc
(define-key modalka-mode-map (kbd "`") #'org-agenda)    ;; quick calc

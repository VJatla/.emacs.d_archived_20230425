(defun  quick-buffer-switch ()
  (interactive)
  (switch-to-buffer nil))

(defun load-elpy-keys ()
  (define-key modalka-mode-map (kbd "SPC d") #'elpy-goto-definition)
  )


;; Selection functions
(defun select-till-buffer-end ()
  (interactive)
  (xah-select-block)
  (end-of-buffer))


;; Global keybindingso
(define-key key-translation-map (kbd "ESC") #'modalka-mode) ;; ESC to exit modalka
(define-key key-translation-map (kbd "<f10>") #'modalka-mode) ;; F8 to exit modalka

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


;; File and buffer operations
(define-key modalka-mode-map (kbd "SPC s") #'save-buffer)
(define-key modalka-mode-map (kbd "SPC o") #'counsel-find-file)
(define-key modalka-mode-map (kbd "SPC r") #'recentf-open-files)
(define-key modalka-mode-map (kbd "SPC k") #'kill-buffer)
(define-key modalka-mode-map (kbd "a") #'counsel-M-x) ;; Inspired from Xah-fly keys
(define-key modalka-mode-map (kbd "SPC a") #'eval-buffer) ;; Inspired from Xah-fly keys
(define-key modalka-mode-map (kbd "#") #'goto-line)
(define-key modalka-mode-map (kbd "SPC f") #'ivy-switch-buffer)
(define-key modalka-mode-map (kbd "f") #'newline)
(define-key modalka-mode-map (kbd "SPC c c") #'save-buffers-kill-terminal)


;; Window management
(define-key modalka-mode-map (kbd "SPC w o") #'other-window)
(define-key modalka-mode-map (kbd "SPC w 1") #'delete-other-windows)
(define-key modalka-mode-map (kbd "SPC w |") #'split-window-horizontally)
(define-key modalka-mode-map (kbd "SPC w -") #'split-window-vertically)
(define-key modalka-mode-map (kbd "SPC w d") #'delete-window)
(define-key modalka-mode-map (kbd "SPC j") #'window-jump-left)
(define-key modalka-mode-map (kbd "SPC l") #'window-jump-right)
(define-key modalka-mode-map (kbd "SPC w k") #'window-jump-up)
(define-key modalka-mode-map (kbd "SPC w j") #'window-jump-down)

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



;; Code navigation
(define-key modalka-mode-map (kbd "i") #'previous-line) ;; C-p
(define-key modalka-mode-map (kbd "k") #'next-line) ;; C-n
(define-key modalka-mode-map (kbd "l") #'forward-char) ;; C-f
(define-key modalka-mode-map (kbd "j") #'backward-char) ;; C-b
(define-key modalka-mode-map (kbd "w") #'forward-word) ;; C-b
(define-key modalka-mode-map (kbd "b") #'backward-word) ;; C-b
(define-key modalka-mode-map (kbd "e") #'move-end-of-line) ;; C-e
(define-key modalka-mode-map (kbd "0") #'move-beginning-of-line) ;; C-a
(define-key modalka-mode-map (kbd "g g") #'beginning-of-buffer) ;; M-<
(define-key modalka-mode-map (kbd "G") #'end-of-buffer) ;; M->
(define-key modalka-mode-map (kbd "s") #'swiper);; C-s


;; Code editing
(define-key modalka-mode-map (kbd "r") #'query-replace);; C-s
(define-key modalka-mode-map (kbd "SPC SPC") #'modalka-mode) ;;
(define-key modalka-mode-map (kbd "d w") #'kill-word);; M-d
(define-key modalka-mode-map (kbd "d b") #'evil-delete-backward-word);; M-d
(define-key modalka-mode-map (kbd "d l") #'kill-whole-line);; kill till end of the line
(define-key modalka-mode-map (kbd "d e") #'kill-line);; kill till end of the line
(define-key modalka-mode-map (kbd ";") #'comment-dwim);; kill till end of the line
(define-key modalka-mode-map (kbd "u") #'undo);; C-_

;; Selection
(define-key modalka-mode-map (kbd "m s") #'set-mark-command);; C-SPC
(define-key modalka-mode-map (kbd "p") #'pop-to-mark-command);; C-s
(define-key modalka-mode-map (kbd "m l") #'xah-select-line);; C-s
(define-key modalka-mode-map (kbd "m G") #'select-till-buffer-end);; C-sh

;; Activiating major mode based keybindings
(add-hook 'elpy-mode-hook 'load-elpy-keys)

;; Bookmarks
(define-key modalka-mode-map (kbd "SPC b s") #'bookmark-set);; C-x r m
(define-key modalka-mode-map (kbd "SPC b j") #'bookmark-jump);; C-x r b

;; Repeat last command
(define-key modalka-mode-map (kbd ",") #'repeat);; C-x r m

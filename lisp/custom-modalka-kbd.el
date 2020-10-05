;; My keybindings for quick reference


;; Toggl modalka mode
(global-set-key (kbd "<f8>") #'modalka-mode)

;; Make the cursor change based on modalka mode
(setq-default cursor-type '(bar . 3))
(setq modalka-cursor-type 'box)

;; Use modalka in only for programming and text editing
(add-hook 'text-mode-hook #'modalka-mode)
(add-hook 'prog-mode-hook #'modalka-mode)


;; My custom commands using space leader key
(modalka-define-kbd "SPC x" "M-x")
(modalka-define-kbd "SPC s" "C-x C-s")

;; Commands using two spaces (rare commands I use)
(define-key modalka-mode-map (kbd "SPC SPC s") #'ispell-word) ;; Check spelling

;; Code navigation
(define-key modalka-mode-map (kbd "j") #'previous-line) ;; C-p
(define-key modalka-mode-map (kbd "k") #'next-line) ;; C-n
(define-key modalka-mode-map (kbd "l") #'forward-char) ;; C-f
(define-key modalka-mode-map (kbd "h") #'backward-char) ;; C-b
(define-key modalka-mode-map (kbd "$") #'move-end-of-line) ;; C-e
(define-key modalka-mode-map (kbd "0") #'move-beginning-of-line) ;; C-a
(define-key modalka-mode-map (kbd "g g") #'beginning-of-buffer) ;; M-<
(define-key modalka-mode-map (kbd "G") #'end-of-buffer) ;; M->

;; Selection
(modalka-define-kbd "v" "C-SPC") ;; Start mark


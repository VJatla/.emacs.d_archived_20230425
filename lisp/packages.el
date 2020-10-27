(require 'package) ;; Emacs builtin

;; set package.el repositories
(setq package-archives
      '(
	("melpa" . "https://melpa.org/packages/")
	)
      )


;; Initialize built-in package management
(package-initialize)
;; Simple clip
(require 'simpleclip)
(simpleclip-mode 1)

;; Org mode settings
(load (expand-file-name "~/.emacs.d/lisp/org-settings.el"))




;; whick-key
;; Link: https://github.com/justbur/emacs-which-key
;; Doc:
;;     Shows available options for key press
(require 'which-key)
(which-key-mode)


;; Ivy: a generic completion mechanism for Emacs
;; Counsel: a collection of Ivy-enhanced versions of common Emacs commands.
;; Swiper: an Ivy-enhanced alternative to isearch.
(require 'ivy)
(require 'counsel)
(require 'swiper)
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(setq search-default-mode #'char-fold-to-regexp)

;; Treemacs: A very nice sidebar having projects
(require 'treemacs)

;; Window jump easy
(require 'window-jump)

;; Python
(require 'conda)
(custom-set-variables
 '(conda-anaconda-home "/home/vj/anaconda3"))
(setq
 conda-env-home-directory "/home/vj/anaconda3"
 conda-env-subdirectory "envs")
(conda-env-activate "torch160")

;; For now I am using elpy, should change
;; to anaconda-mode when I have a chance
(add-hook 'elpy-mode-hook
	  (lambda ()
            (add-hook 'before-save-hook
                      'elpy-format-code nil t)))
(require 'elpy)
(elpy-enable)

;; Modal editing for text and code
(require 'modalka)
(load "custom-modalka-kbd")
(modalka-global-mode 1)
(setq-default cursor-type '(bar . 3))     ;; Shape of cursor in different modes
(setq modalka-cursor-type 'box)

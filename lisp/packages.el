(require 'package) ;; Emacs builtin

;; set package.el repositories
(setq package-archives
      '(
	("gnu" . "https://elpa.gnu.org/packages/")
	("melpa" . "https://melpa.org/packages/")
	)
      )


;; Initialize built-in package management
(package-initialize)


;; whick-key
;; Link: https://github.com/justbur/emacs-which-key
;; Doc:
;;     Shows available options for key press
(require 'which-key)
(which-key-mode)


;; Ivy: a generic completion mechanism for Emacs
;; Counsel: a collection of Ivy-enhanced versions of common Emacs commands.
;; Swiper: an Ivy-enhanced alternative to isearch.
(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq enable-recursive-minibuffers t)
(setq search-default-mode #'char-fold-to-regexp)

;; anaconda-mode
(require 'anaconda-mode)
(load "pysettings")


;; Modal editing for text and code
(require 'modalka)
(load "custom-modalka-kbd")
(add-hook 'text-mode-hook #'modalka-mode) ;; When to turn on modalka
(add-hook 'prog-mode-hook #'modalka-mode)
(setq-default cursor-type '(bar . 3))     ;; Shape of cursor in different modes
(setq modalka-cursor-type 'box)

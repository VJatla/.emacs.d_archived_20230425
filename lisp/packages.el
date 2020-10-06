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


;; Shall I use modal editing? (modalka, EVil, boon, Ryo)
;; (load "custom-modalka-kbd")
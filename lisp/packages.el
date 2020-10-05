(require 'package) ;; Emacs builtin

;; set package.el repositories
(setq package-archives
      '(
	("gnu" . "https://elpa.gnu.org/packages/")
	("melpa" . "https://melpa.org/packages/")
	)
      )

;; initialize built-in package management
(package-initialize)

;; Require modalka
(require 'modalka)




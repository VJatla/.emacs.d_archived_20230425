;; A detailed init file: For learning emacs ;;

;; I started at xah-lee tutorial ;;
;; Link: http://ergoemacs.org/emacs/emacs_make_modern.html ;;

;; My main way of learning emacs is
;;     `C-h v`: Help with variables
;;     `C-h f`: Help with function

;; Inhibiting startup screen ;;
;;     Doc:
;;         If the value is nil and `inhibit-startup-screen' is nil,
;;         show the startup screen.  If the value is string, visit
;;         the specified file or directory using `find-file'.
;;         If t, open the `*scratch*' buffer."
(setq inhibit-startup-screen t)

;; Removing tool bar using tool-bar-mode ;;
;;     Doc:
;;         (tool-bar-mode &optional ARG)
;;         ARG = +ve => enabled
;;         ARG = -ve => not enabled
(tool-bar-mode -1)

;; Removing menu-bar using menu-bar-mode
;;     Doc: <<< Similar to tool-bar-mode >>>
(menu-bar-mode -1)


;; Setting font
;; Doc:
;;     (set-face-attribute FACE FRAME &rest ARGS)
(set-face-attribute 'default nil :height 170) ;; 130 => 13 pt


;; Adding lisp directory to load path to load personal configurations
;; Doc:
;;     (add-to-list LIST-VAR ELEMENT &optional APPEND COMPARE-FN)
(add-to-list 'load-path "~/.emacs.d/lisp/")


;; Loading package managing script `./lisp/packages`
;; Doc:
;;     (load FILE &optional NOERROR NOMESSAGE NOSUFFIX MUST-SUFFIX)
(load "packages")
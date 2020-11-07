;; I was too worried about the result of learning emacs that I wasted
;; a lot of time. I used to have these thoughts,

;; 1. Should I invest time in Emacs or other IDE/editors?
;;	  Emacs seems to be a distro. A properly and carefully
;;        configured emacs will (I believe) help the user achieving
;;        happiness due to concentration (Flow: The Psychology Of Optimal Experience)
;;        at a much faster rate than other tools. The idealogy behind emacs
;;        is also something I respect, there is a sense of freedom using it.

;; 2. If I learn emacs and in the future (job) I need to use another
;;    IDE is the time wasted?
;;        This is a kind of expectation or seeking reward behavior. This
;;        according to my life ideals (karma yoga) is not good. If tomorrow
;;        I cannot use it let it be. I shall not think too much about that.

;; 3. Maybe I should use emacs + evil-mode. Vi key bindings seem
;;    to be supported in all the major IDE/editors?
;;        If in future I have to use another IDE/editor, I will learn
;;        them at that time with the same rigor and focus I gave to emacs.
;;        I want to complete my Ph.D. in emacs and after that the path is
;;        unknown (which I will not worry about today).

;; 4. What if I can skip all the pain of configuring emacs/learning
;;    elisp by using emacs distros like a prelude, doom emacs, Spacemacs?
;;        Some packages like prelude seem to stick very close to emacs
;;        bare-bones but using them I will miss out on the fun of discovery.
;;        For example when I discovered `which-key`. I would rather not
;;        miss out on that fun. I will configure one by one reading Reddit and
;;        Github man pages.

;; My main way of learning emacs is
;;     `C-h v`: Help for variables
;;     `C-h f`: Help for function

;; Inhibiting startup screen ;;
;;     Doc:
;;         If the value is nil and `inhibit-startup-screen' is nil,
;;         show the startup screen.  If the value is string, visit
;;         the specified file or directory using `find-file'.
;;         If t, isopen the `*scratch*' buffer."
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

;; Disable scroll bar
(scroll-bar-mode -1)

;; Removing visual bell
;;     Doc: Non-nil means try to flash the frame to represent a bell
(setq visible-bell 1)

;; Scroll margin
;;     Doc:
(setq scroll-margin 5)

;; All backup files are in one directory
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; White space mode
(require 'whitespace)
(setq whitespace-style '(face lines-tail))
(global-whitespace-mode t)

;; Recent file mode
(recentf-mode 1)


;; Adding lisp directory to load path to load personal configurations
;; Doc:
;;     (add-to-list LIST-VAR ELEMENT &optional APPEND COMPARE-FN)
(add-to-list 'load-path "~/.emacs.d/lisp/")


;; Loading package managing script `./lisp/packages`
;; Doc:
;;     (load FILE &optional NOERROR NOMESSAGE NOSUFFIX MUST-SUFFIX)
(load "packages")

;; Load org-settings
(load "org-settings")

;; Please edit this file as per your installation
;;
;; Disclaimer:
;;     To make it look fun I ripped off "The Hero's Journey".
;;     Link: https://en.wikipedia.org/wiki/Hero%27s_journey


;; Enabling theme (comes with emacs)
;; Doc:
;;     (load-theme THEME &optional NO-CONFIRM NO-ENABLE)
;; Note:
;;     I use different themes in different systems. So I don't
;;     define theme in the `the_call.el`. A hero can take any
;;     form and shape.
(load-theme 'sanityinc-tomorrow-eighties 1)


;; Setting font
;; Doc:
;;     (set-face-attribute FACE FRAME &rest ARGS)
(set-face-attribute 'default nil :height 170) ;; 170 => 17 pt

;; The call (Beginning of customization)
;; (load "C:/Users/vj/.emacs.d/the_call.el") ;; >>> Windows
(load "/home/vj/.emacs.d/the_call.el") ;; >>> Linux
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(simpleclip gruvbox-theme which-key treemacs spacemacs-theme planet-theme modalka counsel color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized anaconda-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

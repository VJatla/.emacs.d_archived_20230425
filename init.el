(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(conda-anaconda-home "/home/vj/anaconda3")
 '(custom-safe-themes
   '("37768a79b479684b0756dec7c0fc7652082910c37d8863c35b702db3f16000f8" "b721b84f75419ba5a4176f3dbb23264439bc62c1115bc1e05dc536679ccb9f3c" default))
 '(package-selected-packages
   '(company impatient-mode simple-httpd markdown-mode nord-theme ivy lsp-mode xah-fly-keys window-jump which-key use-package treemacs spacegray-theme simpleclip projectile org-bullets modalka evil elpy counsel conda)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; Please edit this file as per your installation
;;
;; Disclaimer:
;;     To make it look fun I ripped off "The Hero's Journey".
;;     Link: https://en.wikipedia.org/wiki/Hero%27s_journey


;; Different settings for different systems
(cond

 ;; Windows
 ((string-equal system-type "windows-nt")
  (load "C:/Users/vj/AppData/Roaming/.emacs.d/the_call.el")
  (set-face-attribute 'default nil :family "Consolas" :height 150)
  (load-theme 'spacegray-easy))

 ;; macOS
 ((string-equal system-type "darwin") ;  macOS
  (progn
    (message "Mac OS X")))

 ;; Linux
 ((string-equal system-type "gnu/linux")
  (set-face-attribute 'default nil :family "Fira Code" :height 150)
    (load-theme 'nord)
    (add-to-list 'exec-path "/home/vj/Software/node-v14.15.0-linux-x64/")
    (add-to-list 'exec-path "/home/vj/Software/node-v14.15.0-linux-x64/bin/")
 (load "/home/vj/.emacs.d/the_call.el")))

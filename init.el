(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(conda-anaconda-home "/home/vj/anaconda3")
 '(custom-safe-themes
   '("b3796d54750f628de2f389738584a8463bb504026b9d9e52812a07e9525767d7" "f2c35f8562f6a1e5b3f4c543d5ff8f24100fae1da29aeb1864bbc17758f52b70" "37768a79b479684b0756dec7c0fc7652082910c37d8863c35b702db3f16000f8" "b721b84f75419ba5a4176f3dbb23264439bc62c1115bc1e05dc536679ccb9f3c" default))
 '(package-selected-packages
   '(treemacs-magit ox-reveal ivy-avy magit swiper-helm git-gutter helm-projectile helm counsel-projectile treemacs-projectile sublimity company impatient-mode simple-httpd markdown-mode nord-theme ivy lsp-mode xah-fly-keys window-jump which-key use-package treemacs spacegray-theme simpleclip projectile org-bullets modalka evil elpy counsel conda)))

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
  (load "/home/vj/.emacs.d/the_call.el")
  (cond
   ((string-equal system-name "precision7920")
    (load-theme 'zenburn)
    (set-face-attribute 'default nil :family "DejaVu Sans Mono" :height 150)
    ))
  (cond
   ((string-equal system-name "bazul")
   (load-theme 'nord)
   (set-face-attribute 'default nil :family "Victor Mono" :height 150)))
  (cond
   ((string-equal system-name "chickadee")
   (set-face-attribute 'default nil :family "Fira Code" :height 150)
   ))
    (add-to-list 'exec-path "/home/vj/Software/node-v14.15.0-linux-x64/")
    (add-to-list 'exec-path "/home/vj/Software/node-v14.15.0-linux-x64/bin/")))

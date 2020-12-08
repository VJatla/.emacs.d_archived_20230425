(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Linum-format "%7i ")
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#21252B" "#E06C75" "#98C379" "#E5C07B" "#61AFEF" "#C678DD" "#56B6C2" "#ABB2BF"])
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(conda-anaconda-home "/home/vj/anaconda3")
 '(custom-safe-themes
   '("7c20c453ad5413b110ccc3bb5df07d69999d741d29b1f894bd691f52b4abdd31" "ae88c445c558b7632fc2d72b7d4b8dfb9427ac06aa82faab8d760fff8b8f243c" "c560237b7505f67a271def31c706151afd7aa6eba9f69af77ec05bde5408dbcd" "ff4d091b20e9e6cb43954e4eeae1c3b334e28b5923747c7bd5d2720f2a67e272" "afd761c9b0f52ac19764b99d7a4d871fc329f7392dfc6cd29710e8209c691477" "9e39a8334e0e476157bfdb8e42e1cea43fad02c9ec7c0dbd5498cf02b9adeaf1" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "b0334e8e314ea69f745eabbb5c1817a173f5e9715493d63b592a8dc9c19a4de6" "f22d7a8e5fab23879540e4f9ce64f82b4a897c62fff96f6ba0c9f5ec21dd0d35" "edb73be436e0643727f15ebee8ad107e899ea60a3a70020dfa68ae00b0349a87" "b3796d54750f628de2f389738584a8463bb504026b9d9e52812a07e9525767d7" "f2c35f8562f6a1e5b3f4c543d5ff8f24100fae1da29aeb1864bbc17758f52b70" "37768a79b479684b0756dec7c0fc7652082910c37d8863c35b702db3f16000f8" "b721b84f75419ba5a4176f3dbb23264439bc62c1115bc1e05dc536679ccb9f3c" default))
 '(fci-rule-character-color "#202020")
 '(fci-rule-color "#3E4451")
 '(fringe-mode 4 nil (fringe))
 '(hl-sexp-background-color "#1c1f26")
 '(hl-todo-keyword-faces
   '(("TODO" . "#dc752f")
     ("NEXT" . "#dc752f")
     ("THEM" . "#2d9574")
     ("PROG" . "#3a81c3")
     ("OKAY" . "#3a81c3")
     ("DONT" . "#f2241f")
     ("FAIL" . "#f2241f")
     ("DONE" . "#42ae2c")
     ("NOTE" . "#b1951d")
     ("KLUDGE" . "#b1951d")
     ("HACK" . "#b1951d")
     ("TEMP" . "#b1951d")
     ("FIXME" . "#dc752f")
     ("XXX+" . "#dc752f")
     ("\\?\\?\\?+" . "#dc752f")))
 '(main-line-color1 "#1E1E1E")
 '(main-line-color2 "#111111")
 '(main-line-separator-style 'chamfer)
 '(nrepl-message-colors
   '("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3"))
 '(package-selected-packages
   '(flatui-dark-theme flatui-theme jedi soothe-theme spacemacs-theme atom-one-dark-theme figlet material-theme org-html-themes ox-twbs treemacs-magit ox-reveal ivy-avy magit swiper-helm git-gutter helm-projectile helm counsel-projectile treemacs-projectile sublimity company impatient-mode simple-httpd markdown-mode nord-theme ivy lsp-mode xah-fly-keys window-jump which-key use-package treemacs spacegray-theme simpleclip projectile org-bullets modalka evil elpy counsel conda))
 '(pdf-view-midnight-colors '("#655370" . "#fbf8ef"))
 '(powerline-color1 "#1E1E1E")
 '(powerline-color2 "#111111")
 '(tetris-x-colors
   [[229 192 123]
    [97 175 239]
    [209 154 102]
    [224 108 117]
    [152 195 121]
    [198 120 221]
    [86 182 194]])
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   '((20 . "#f36c60")
     (40 . "#ff9800")
     (60 . "#fff59d")
     (80 . "#8bc34a")
     (100 . "#81d4fa")
     (120 . "#4dd0e1")
     (140 . "#b39ddb")
     (160 . "#f36c60")
     (180 . "#ff9800")
     (200 . "#fff59d")
     (220 . "#8bc34a")
     (240 . "#81d4fa")
     (260 . "#4dd0e1")
     (280 . "#b39ddb")
     (300 . "#f36c60")
     (320 . "#ff9800")
     (340 . "#fff59d")
     (360 . "#8bc34a")))
 '(vc-annotate-very-old-color nil))

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


;; User email
(setq user-mail-address "venkatesh.jatla@gmail.com")

;; Different settings for different systems
(cond
 ;; Windows
 ((string-equal system-type "windows-nt")
  (load "C:/Users/vj/AppData/Roaming/.emacs.d/the_call.el")
  (set-face-attribute 'default nil :family "Consolas" :height 150)
    (load-theme 'flatui))

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
    (set-face-attribute 'default nil :family "Fira Code" :height 130)
    (use-package material-theme
      :ensure t)
    (load-theme 'xps)
   ))
    (add-to-list 'exec-path "/home/vj/Software/node-v14.15.0-linux-x64/")
    (add-to-list 'exec-path "/home/vj/Software/node-v14.15.0-linux-x64/bin/")))



;; --- Template to switch settings between windows and linux
(cond

 ((string-equal system-type "windows-nt")
  ;; Windows settings go here
  ) 

 ((string-equal system-type "gnu/linux")
  ;; Linux settings go here
  )

 )


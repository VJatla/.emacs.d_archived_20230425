(define-key key-translation-map (kbd "ESC") #'ryo-modal-mode)
(require 'expand-region)

;; Cursor shape
(setq-default cursor-type 'bar)
(setq-default cursor-color 'white) 
(setq ryo-modal-cursor-type 'box)
(setq ryo-modal-cursor-color 'white)


;; Ryo key bindings
(ryo-modal-keys
 ;; --- Vim style navigation --;;
 ("i" ryo-modal-mode)
 ("," ryo-modal-repeat)
 
 ("h" backward-char)
 ("j" next-line)
 ("k" previous-line)
 ("l" forward-char)


 ("w" forward-word)
 ("b" backward-word)
 
 ("$" move-end-of-line)
 ("0" move-beginning-of-line)

 ("v" set-mark-command)

 ;; Delete commands
 ("d"
 	(("w" kill-word)
  	("d" kill-whole-line)
  	("b" backward-kill-word)))

 ;; Change commands
 ("c"
  (("w" kill-word)
  	("b" backward-kill-word)
  	("l" kill-whole-line))
  :exit t)

 );; Ryo bindings end

;;    1. Go to the end of file and do C-x C-e
;;    2. M-x org-publish-project RET org RET
(require 'org)
(require 'ox-html)
(require 'ox-publish)

;; org-setting
(setq org-html-head
      "
<link rel='stylesheet' type='text/css' href='https://fniessen.github.io/org-html-themes/src/readtheorg_theme/css/htmlize.css'/>
<link rel='stylesheet' type='text/css' href='https://fniessen.github.io/org-html-themes/src/readtheorg_theme/css/readtheorg.css'/>
<script src='https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<script src='https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js'></script>
<script type='text/javascript' src='https://fniessen.github.io/org-html-themes/src/lib/js/jquery.stickytableheaders.min.js'></script>
<script type='text/javascript' src='https://fniessen.github.io/org-html-themes/src/readtheorg_theme/js/readtheorg.js'></script>
")

(cond

 ((string-equal system-type "windows-nt")
  ;; Windows settings go here
  (setq org-publish-project-alist
      '(
	("haq-pg"
	 :base-directory "C:/Users/vj/Dropbox/Marios_Shared/HAQ-AOLME/documentation/org/"
	 :publishing-directory "C:/Users/vj/Dropbox/Marios_Shared/HAQ-AOLME/software/HAQ/docs/"
	 :base-extension "org"
	 :recursive t
	 :publishing-function org-html-publish-to-html
	 :html-postamble "
<p>Author: %a</p>
<p>Email: %e</p>
<p>Exported: %T</p>
<p>
<a blank='_target' href='https://github.com/VJatla/HAQ'>HAQ-GitHub</a>
<img width='30px' src='imgs/Octocat.png'/>
</p>
")
	("haq-static"
	 :base-directory "C:/Users/vj/Dropbox/Marios_Shared/HAQ-AOLME/documentation/org/"
	 :publishing-directory "C:/Users/vj/Dropbox/Marios_Shared/HAQ-AOLME/software/HAQ/docs/"
	 :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|html"
	 :recursive t
	 :publishing-function org-publish-attachment
	 )
	("haq" :components ("haq-pg" "haq-static"))
	))

  ) 

 ((string-equal system-type "gnu/linux")
  ;; Linux settings go here
  (setq org-publish-project-alist
      '(
	("haq-pg"
	 :base-directory "/home/vj/Dropbox/Marios_Shared/HAQ-AOLME/documentation/org/"
	 :publishing-directory "/home/vj/Dropbox/Marios_Shared/HAQ-AOLME/software/HAQ/docs/"
	 :base-extension "org"
	 :recursive t
	 :publishing-function org-html-publish-to-html
	 :html-postamble "
<p>Author: %a</p>
<p>Email: %e</p>
<p>Exported: %T</p>
<p>
<a blank='_target' href='https://github.com/VJatla/HAQ'>HAQ-GitHub</a>
<img width='30px' src='https://vjatla.github.io/HAQ/imgs/Octocat.png'/>
</p>
")
	("haq-static"
	 :base-directory "/home/vj/Dropbox/Marios_Shared/HAQ-AOLME/documentation/org/"
	 :publishing-directory "/home/vj/Dropbox/Marios_Shared/HAQ-AOLME/software/HAQ/docs/"
	 :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|html"
	 :recursive t
	 :publishing-function org-publish-attachment
	 )
	("haq" :components ("haq-pg" "haq-static"))
	))

  )

 )



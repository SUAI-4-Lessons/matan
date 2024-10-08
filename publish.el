
(require 'package)
(package-initialize)


(require 'org)
(require 'ox-publish)


(defvar site-attachments
  (regexp-opt '("jpg" "jpeg" "gif" "png" "svg"
                "ico" "cur" "css" "js" "woff" "html" "pdf"))
  "File types that are published as static files.")

(setq org-html-head "
<style type=\"text/css\">
 @import url('https://unpkg.com/@catppuccin/palette/css/catppuccin.css');
  @import url('https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap');

  body{
      background: var(--ctp-latte-base);
  }

  *{
      font-family: \"Roboto\", serif;
      color: var(--ctp-latte-text);
  }

  a{
      color: var(--ctp-latte-lavender);
  }

  h1{
      color: var(--ctp-latte-text)
  }

  h2{
      color: var(--ctp-latte-subtext0)
  }

  
  h3{
      color: var(--ctp-latte-subtext1)
  }

  code{
      font-family: \"Jetbrains Mono\", monospace;
      background:  var(--ctp-latte-mantle);
      color: var(--ctp-latte-flamingo);
      border-radius: 5px;
      padding-left: 4px;
      padding-right: 4px;
      font-size: small;
  }
</style>
")

(setq org-html-postamble nil)



(setq org-publish-project-alist
      (list
       (list "site-org"
             :base-directory "."
             :include '("index.org")
             :publishing-function '(org-html-publish-to-html)
             :publishing-directory "./public"
             :exclude (regexp-opt '("README"))
	     :auto-sitemap nil
             :sitemap-file-entry-format "%d *%t*"
             :html-head-extra "<link rel=\"icon\" type=\"image/x-icon\" href=\"/favicon.ico\"/>"
             )
       (list "site-static"
             :base-directory "."
             :exclude "public/"
             :base-extension site-attachments
             :publishing-directory "./public"
             :publishing-function 'org-publish-attachment
             :recursive t)
       (list "site" :components '("site-org"))))

(provide 'publish)
;;; publish.el ends here

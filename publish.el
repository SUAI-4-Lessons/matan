
(require 'package)
(package-initialize)


(require 'org)
(require 'ox-publish)


(defvar site-attachments
  (regexp-opt '("jpg" "jpeg" "gif" "png" "svg"
                "ico" "cur" "css" "js" "woff" "html" "pdf"))
  "File types that are published as static files.")



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

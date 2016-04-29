;; Edited from http://emacs.stackexchange.com/a/9838
(defun rasmus/org-html-wrap-blocks-in-code (src backend info)
  "Wrap a source block in <pre><code class=\"lang\">.</code></pre>"
  (when (org-export-derived-backend-p backend 'html)
    (replace-regexp-in-string
     "\\(</pre>\\)" "</code>\n\\1"
     (replace-regexp-in-string "<pre class=\"src src-\\([^\"]*?\\)\">"
                               "<pre>\n<code class=\"\\1\">" src))))

;; (setq org-emphasis-regexp-components
;;       '("     ('\"{“”"
;;         "-   .,!?;''“”\")}/\\“”"
;;         "    \r\n,"
;;         "."
;;         1))

(require 'org)
(require 'org-element)
(require 'ox-html)
(setcar (nthcdr 2 org-emphasis-regexp-components) " \t\r\n")
(org-set-emph-re 'org-emphasis-regexp-components org-emphasis-regexp-components)
(custom-set-variables `(org-emphasis-alist ',org-emphasis-alist))
(org-element--set-regexps)
;; (require 'htmlize)
(add-to-list 'org-export-filter-src-block-functions
             'rasmus/org-html-wrap-blocks-in-code)

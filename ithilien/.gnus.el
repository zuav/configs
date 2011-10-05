;;; .gnus.el --- Gnus

;; Copyright (C) 2006, 2007, 2009, 2010, 2011  Alexander Zhuckov

;; Author: Alexander Zhuckov
;; Keywords: extensions

;;; Commentary:

;; 
(require 'gnus-demon)

(gnus-demon-add-handler 'gnus-demon-scan-news 30 7)

;;; Code:
(setq gnus-select-method '(nntp "news.eternal-september.org"))

(setq gnus-secondary-select-methods
      '((nnimap "altell"
                (nnimap-address "mail"))))

(setq gnus-message-archive-group "sent-mail")
(setq gnus-message-archive-method
      '(nnml "archive"
             (nnml-directory   "~/Mail/archive")
             (nnml-active-file "~/Mail/archive/active")
             (nnml-get-new-mail nil)))

(setq nnimap-split-crosspost nil
      imap-log               nil)

(setq gnus-visual           t
      gnus-large-newsgroup  2000
      gnus-read-active-file 'some)

(setq nnrss-ignore-article-fields '(description slash:comments slash:hit_parade lj:reply-count))

 ;; let Gnus change the "From:" line by looking at current group we are in.
(setq gnus-posting-styles
      '(("erlang-questions" (address "zuav@yandex.ru"))
        ("ejabberd"         (address "zuav@yandex.ru"))
        ("debian-announce"  (address "zuav@yandex.ru"))
        ("debian-russian"   (address "zuav@yandex.ru"))))

;; support for Atom 
(require 'mm-url)
(defadvice mm-url-insert (after DE-convert-atom-to-rss () )
  "Converts atom to RSS by calling xsltproc."
  (when (re-search-forward "xmlns=\"http://www.w3.org/.*/Atom\"" 
                           nil t)
    (goto-char (point-min))
    (message "Converting Atom to RSS... ")
    (call-process-region (point-min) (point-max) 
                         "xsltproc" 
                         t t nil 
                         (expand-file-name "~/atom2rss.xsl") "-")
    (goto-char (point-min))
    (message "Converting Atom to RSS... done")))

(ad-activate 'mm-url-insert)

;;; .gnus.el ends here

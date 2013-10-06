;;; .gnus.el --- Gnus

;;; Code:
(setq gnus-select-method '(nntp "news.eternal-september.org"))

(setq gnus-secondary-select-methods
      '((nnimap "crystax"
                (nnimap-address "imap.crystax.net")
                (nnimap-server-port 143)
                (nnimap-stream starttls))
        (nnml   "")))

(setq imap-log     nil
      imap-debug   nil
      nnimap-debug nil)

(setq gnus-message-archive-group "sent-mail")
(setq gnus-message-archive-method
      '(nnml "archive"
             (nnml-directory   "~/Mail/archive")
             (nnml-active-file "~/Mail/archive/active")
             (nnml-get-new-mail nil)))

(setq gnus-visual           t
      gnus-large-newsgroup  2000
      gnus-read-active-file 'some)

;;; .gnus.el ends here

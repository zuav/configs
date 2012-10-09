;;; .gnus.el --- Gnus

;; Copyright (C) 2006, 2007, 2009, 2010, 2011, 2012  Alexander Zhukov

;; Author: Alexander Zhukov
;; Keywords: extensions

;;; Commentary:

;; 

;;; Code:
;(require 'gnus-demon)
;(require 'imap)

;(gnus-demon-add-handler 'gnus-demon-scan-news 30 7)

(setq gnus-select-method '(nntp "news.eternal-september.org"))

(setq gnus-secondary-select-methods
      '(;(nnimap "yandex"
        ;        (nnimap-address "imap.yandex.ru")
        ;        (nnimap-stream ssl))
        (nnml   "")
        (nnimap "gmail"
                (nnimap-address "imap.gmail.com")
                (nnimap-stream ssl))))

(setq imap-log t
      imap-debug t
      nnimap-debug  t)

(setq gnus-message-archive-group "sent-mail")
(setq gnus-message-archive-method
      '(nnml "archive"
             (nnml-directory   "~/Mail/archive")
             (nnml-active-file "~/Mail/archive/active")
             (nnml-get-new-mail nil)))

(setq gnus-visual           t
      gnus-large-newsgroup  2000
      gnus-read-active-file 'some)

;;(setq nnimap-split-crosspost nil
;;      nnimap-split-inbox     nil  ;; "INBOX"
;;      imap-log               t)

;;(setq nnimap-split-rule
;;      '(("INBOX.cleanvm-trustedarm"   "^Subject: trustedarm.*build on .+")
;;        ("INBOX.cleanvm-apkr10"       "^Subject: apkr10.*build on .+")
;;        ("INBOX.cleanvm-bereg"        "^Subject: bereg.*build on .+")
;;        ("INBOX.cleanvm-seosvt"       "^Subject: seosvt.*build on .+")
;;        ("INBOX.cleanvm"              "^From: CleanVM bot .*")
;;        ("INBOX.cron-daemon"          "^From: .*(Cron Daemon)$")
;;        ("INBOX.tasks"                "^From: TeamForge Administrator.*")))

;; let Gnus change the "From:" line by looking at current group we are in.
;;(setq gnus-posting-styles
;;      '(("erlang-questions" (address "zuav@yandex.ru"))
;;        ("ejabberd"         (address "zuav@yandex.ru"))
;;        ("debian-announce"  (address "zuav@yandex.ru"))
;;        ("debian-russian"   (address "zuav@yandex.ru"))))

;;; .gnus.el ends here

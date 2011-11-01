;;; .gnus.el --- Gnus

;; Copyright (C) 2006, 2007, 2009, 2010, 2011  Alexander Zhukov

;; Author: Alexander Zhukov
;; Keywords: extensions

;;; Commentary:

;; 

;;; Code:
(require 'gnus-demon)
(require 'smtpmail)

(gnus-demon-add-handler 'gnus-demon-scan-news 30 7)

(setq user-mail-address             "zhukov@altell.ru"
      send-mail-function            'smtpmail-send-it
      message-send-mail-function    'smtpmail-send-it
      smtpmail-smtp-server          "mail.altell.local"
      smtpmail-auth-credentials     (expand-file-name "~/.authinfo")
      smtpmail-debug-info           t
      smtpmail-debug-verb           t)

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
      nnimap-split-inbox     "INBOX"
      imap-log               nil)

(setq nnimap-split-rule
      '(("INBOX.cleanvm-trustedarm"   "^Subject: trustedarm.*build on .+")
        ("INBOX.cleanvm-apkr10"       "^Subject: apkr10.*build on .+")
        ("INBOX.cleanvm-bereg"        "^Subject: bereg.*build on .+")
        ("INBOX.cleanvm-seosvt"       "^Subject: seosvt.*build on .+")
        ("INBOX.cleanvm"              "^From: CleanVM bot .*")
        ("INBOX.cron-daemon"          "^From: .*(Cron Daemon)$")
        ("INBOX.tasks"                "^From: TeamForge Administrator.*")))

(setq gnus-visual           t
      gnus-large-newsgroup  2000
      gnus-read-active-file 'some)

 ;; let Gnus change the "From:" line by looking at current group we are in.
(setq gnus-posting-styles
      '(("erlang-questions" (address "zuav@yandex.ru"))
        ("ejabberd"         (address "zuav@yandex.ru"))
        ("debian-announce"  (address "zuav@yandex.ru"))
        ("debian-russian"   (address "zuav@yandex.ru"))))

;;; .gnus.el ends here

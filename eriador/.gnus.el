;;; .gnus.el --- Gnus

;; Copyright (C) 2006, 2007, 2009  Alexander Zhuckov

;; Author: Alexander Zhuckov
;; Keywords: extensions

;;; Commentary:

;; 

;;; Code:
(setq gnus-select-method '(nntp "news.eternal-september.org"))
(setq gnus-secondary-select-methods
      '((nnimap "yandex"
                (nnimap-address       "imap.yandex.ru")
                (nnimap-stream        starttls)
                (nnimap-authinfo-file "/home/zuav/.authinfo"))))
(setq nnimap-split-crosspost nil
      ;nnimap-split-inbox     "Inbox"
      imap-log               t)
;;-;;(setq gnus-secondary-select-methods '((nnml "")))
;;-;;(setq nnmail-split-methods
;;-;;      '(("klio"           "^From:.*klioner")
;;-;;        ("debian-russian" "^From:.*debian-russian@lists.debian.org\\|^To:.*debian-russian@lists.debian.org\\|^[Cc][Cc]:.*debian-russian@lists.debian.org")
;;-;;        ("other" "")))
;;-;;(setq mail-sources
;;-;;      '((file :path "/var/spool/mail/zuav")
;;-;;        (pop :server "pop.yandex.ru"
;;-;;             :user "zuav"
;;-;;             :password "hss0t7xj")
;;-;;        (pop :server "mail.spbnit.ru"
;;-;;             :user "zuav"
;;-;;             :password "qwerty12")))
;;-;;

;;;;;(setq gnus-secondary-select-methods
;;;;;      '((nnimap "unison"
;;;;;                (nnimap-address       "imap.unison.org")
;;;;;                (nnimap-server-port   143)
;;;;;                (nnimap-authenticator login)
;;;;;                (nnimap-authinfo-file "/home/zuav/.authinfo"))))
;;;;;
;;;;;(setq gnus-message-archive-group "sent-mail")
;;;;;(setq gnus-message-archive-method
;;;;;      '(nnml "archive"
;;;;;             (nnml-directory   "~/Mail/archive")
;;;;;             (nnml-active-file "~/Mail/archive/active")
;;;;;             (nnml-get-new-mail nil)))
;;;;;
;;;;;
;;;;;(setq nnimap-split-rule
;;;;;      '(("jack"                     "^From:.*Diomidov")
;;;;;        ("div"                      "^From:.*dmiva@list.ru")
;;;;;        ("commit"                   "^From:.*UNISON Subversion Commits")
;;;;;        ("bugz"                     "^From:.*bugzilla-daemon")
;;;;;        ("ubuntu-announce"          "^To:.*ubuntu-announce")
;;;;;        ("ubuntu-security-announce" "^To:.*ubuntu-security-announce")
;;;;;        ("ubuntu-news"              "^To:.*ubuntu-news")
;;;;;        ("ubuntu-ru"                "^To:.*ubuntu-ru")
;;;;;        ("erlang-announce"          "^To:.*erlang-announce")
;;;;;        ("erlang-questions"         "^To:.*erlang-questions\\|^From:.*erlang-questions\\|^Cc:.*erlang-questions")
;;;;;        ("spam"                     "^To:.*stanaphonespb@intermedia.net")
;;;;;        ("other"                    "")))
;;;;;

(setq gnus-visual           t
      gnus-large-newsgroup  2000
      gnus-read-active-file 'some)

;;; .gnus.el ends here

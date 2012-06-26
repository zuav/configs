;;;;
;;;; Emacs configuration file
;;;; by
;;;; Alexander Zhukov
;;;;
;;;; 11.03.1996 -- but I think it was really
;;;; created somewhere in Jan, 1996 or even early
;;;;

(add-to-list 'load-path (expand-file-name "~/src/elisp"))

;;;;
;;;; Packages I need
;;;;
(require 'cc-vars)
(require 'cc-mode)
(require 'generic-x)
(require 'calendar)
(require 'gud)
(require 'woman)
(require 'tramp)
(require 'copyright)
(require 'autoinsert)
(require 'term)
(require 'hideshow)
(require 'midnight)
(require 'savehist)
(require 'saveplace)
(require 'warnings)
(require 'outline)
;;
(require 'bbdb)
(require 'w3m)
(require 'jabber)
;;
(require 'psed)
(require 'bm)
(require 'bar-cursor)
(require 'ssh)
(require 'doc-view)
(require 'sh-utils)
(require 'top-mode)
;(require 'emacsd-tile)

;;;;
;;;; load libraries
;;;;
(load "paren")
(load "complete")
(load "desktop")

;;;;
;;;; Options
;;;;
(setq-default indent-tabs-mode nil)                 ; no tab chars in sources
(setq-default tab-width 8)                          ; default tab width in chars
(setq-default truncate-lines t)                     ; don't wrap long lines
(setq split-width-threshold nil)		    ; always split windows vertically
(setq-default show-trailing-whitespace nil)
(setq-default fill-column 72)
(setq-default save-place t)
(setq-default ssh-directory-tracking-mode t)
(setq-default bm-buffer-persistence t)
(setq-default ispell-dictionary "russian")
(setq-default ff-search-directories
      '("." ".."
        "/usr/include"
        "/usr/include/c++/4.4/*"
        "/opt/qtsdk-2010.05/qt/include/*"))
;;;;
(setq x-meta-keysym 'alt)
(setq x-super-keysym 'meta)
(setq default-indicate-empty-lines nil)
(setq backup-by-copying t)
(setq case-fold-file-names nil)
(setq compile-command "make ")
(setq compilation-scroll-output t)
(setq dired-chown-program "/bin/chown")
;;(setq european-calendar-style t)                    ; turn on european calendar style
;;;(setq calendar-week-start-day   1
;;;      calendar-day-name-array   ["Вс" "Пн" "Вт" "Ср" "Чт" "Пт" "Сб"]
;;;      calendar-month-name-array ["Январь" "Февраль" "Март" "Апрель" "Май" 
;;;                                 "Июнь" "Июль" "Август" "Сентябрь"
;;;                                 "Октябрь" "Ноябрь" "Декабрь"])
(setq calendar-week-start-day   1)
(setq kill-whole-line t)
(setq line-number-mode t)
(setq column-number-mode t)
(setq next-line-add-newlines nil)
(setq next-screen-context-lines 1)
(setq require-final-newline t)
(setq scroll-step           0
      scroll-conservatively 1
      scroll-margin         0)
(setq transient-mark-mode t                         ; transient mark mode
      mark-even-if-inactive t)                      ;
(setq rlogin-explicit-args '("-8"))                 ; rlogin
(setq vc-consult-headers nil)                       ; CVS
(setq vc-mistrust-permissions t)                    ;
(setq vc-follow-symlinks 'ask)
(setq vc-cvs-stay-local nil)
(setq cvs-auto-remove-handled 'status)
(setq cvs-auto-remove-directories 'handled)
(setq ring-bell-function '(lambda () ()))           ; no bells at all
(setq message-log-max 1000)                         ; no limit on how many log messages to keep
(setq woman-fill-frame     t                        ; WoMan
      woman-default-indent 7                        ;
      woman-use-own-frame  nil)                     ;
(setq tail-program-options (list "--follow=name"))  ;
(setq diary-file "~/lib/personal/diary")            ; Diary
(setq todo-file-do   "~/lib/personal/todo-do"       ; TODO
      todo-file-done "~/lib/personal/todo-done"     ;
      todo-file-top  "~/lib/personal/todo-top")     ;
(setq display-time-day-and-date  t
      display-time-24hr-format   t
      display-time-mail-file     "/var/spool/mail/zuav"
      display-time-use-mail-icon t)
(setq ediff-diff-options "-w"                       ; ignore changes in whitespace
      ediff-split-window-function 'split-window-horizontally
      ediff-window-setup-function 'ediff-setup-windows-plain)
(setq emerge-diff-options "-w")                      ; ignore changes in whitespace
(setq tramp-default-method "scp")
(setq password-cache-expiry nil)                     ; for tramp
(setq dictionary-server "localhost")
(setq kill-emacs-query-functions
      (append kill-emacs-query-functions
              (list '(lambda ()
                       (yes-or-no-p "Really kill emacs? ")))))
(setq mail-user-agent 'gnus-user-agent)
(setq gud-chdir-before-run nil)
(setq gdb-show-main t)
(setq process-coding-system-alist '(("cvs" . cp1251)))
(setq printer-name "telecom")
(setq ps-print-color-p nil)
(setq ps-multibyte-buffer 'bdf-font)
(setq font-lock-maximum-size nil)
(setq font-lock-maximum-decoration t)
(setq bbdb-file "~/lib/personal/bbdb"
      bbdb-north-american-phone-numbers-p nil
      bbdb-no-duplicates-p t
      bbdb/mail-auto-create-p nil
      bbdb/news-auto-create-p nil)
(setq dired-recursive-deletes 'top
      dired-recursive-copies 'top)
(setq doc-view-cache-directory     "/var/tmp/docview1000")
(setq bm-repository-size 10000)
(setq zuav-fidogate-passwd 499679240)
(setq c-default-style '((c++-mode . "stroustrup") (other . "stroustrup")))
(setq blink-matching-paren-distance nil)
(setq w3m-home-page                     "about://bookmark/"
      w3m-use-cookies                   t
      w3m-command-arguments             (nconc w3m-command-arguments '("-cookie"))
      w3m-default-display-inline-images t)
(setq browse-url-browser-function 'w3m-browse-url)
(setq line-number-display-limit-width 2000)
(setq auto-mode-alist
      (cons '("/\\(rfc\\|std\\)[0-9]+\\.txt\\(\\.gz\\)?\\'" . rfcview-mode)
            auto-mode-alist))
(setq mpg123-command-args          '("-b 2048 --aggressive --stereo")
      mpg123-startup-volume        50
      mpg123-mp3-scan-bytes        500
      mpg123-process-coding-system 'cp1251
      mpg123-lazy-check            "mp3")
(setq auto-insert-query nil)                     ; autotype, copyright, etc
(setq inferior-lisp-program "/usr/bin/sbcl")
(setq jabber-roster-show-title  nil
      jabber-roster-line-format " %c %-30n %u %-8s  %S")

;;-;;(setq inferior-erlang-display-buffer-any-frame t
;;-;;      inferior-erlang-machine-options          '("-sname" "emacs"))

;;;;
;;;; Turn on or off some modes and features
;;;;
(auto-image-file-mode 1)                ; turn on viewing files as images
(delete-selection-mode 1)               ; yank replaces selected region
(menu-bar-mode '-1)                     ; no menu. I hate it.
(tool-bar-mode '-1)                     ; no toolbar. I hate it too.
(scroll-bar-mode '-1)	                ; no scroll-bar. I hate it too
(auto-compression-mode 1)               ; turn on autodecompression of gz etc
(display-time-mode 1)                   ; turn on time display
(mouse-avoidance-mode 'banish)          ; remove mouse to upper right corner
(mouse-wheel-mode 1)                    ; turn on mouse wheel
(desktop-save-mode 1)                   ; automatically save desktop on exit
(size-indication-mode 1)                ; show size of the current file in the mode line
(global-font-lock-mode t)
(show-paren-mode)                       ; hilight corresp. parenthies
(partial-completion-mode)               ; smart name completetion
(bar-cursor-mode 1)                     ; change cursor from bar to block in overwrite mode
(desktop-save-mode 1)
(windmove-default-keybindings)
;;(semantic-mode nil)			; todo: 

(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil                              t)
(autoload 'hide-lines                    "hide-lines" "Hide lines based on a regexp"   t)
(autoload 'rfcview-mode                  "rfcview"    nil                              t)
;;
(add-to-list 'warning-suppress-types '(undo discard-info))
;;--;;(add-to-list 'tramp-default-proxies-alist
;;--;;             '("erebor\\.unison\\.local\\'" "\\`root\\'" "/ssh:%h:"))
(add-to-list 'ff-special-constructs 
    ;; Erlang includes
    '("^-include(\"\\(.*\\)\"" .
      (lambda ()
        (buffer-substring (match-beginning 1) (match-end 1)))))

;;;;
;;;; hooks
;;;;
;;;; Erlang mode
(add-hook 'erlang-mode-hook '(lambda () (add-hook 'local-write-file-hooks 'delete-trailing-whitespace)))
(add-hook 'erlang-mode-hook '(lambda () (setq show-trailing-whitespace t
                                              tab-width 4
                                              ff-search-directories '("."
                                                                      "../include"
                                                                      "../../*/include"
                                                                      "../src"
                                                                      "../../*/src")
                                              ff-other-file-alist '(("\\.erl" (".hrl"))
                                                                    ("\\.hrl" (".erl")))
                                              )))
;;;; Shell mode
(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)
(add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'shell-mode-hook '(lambda () (setq tab-width 8)))
;;;; bookmark package (bm)
(add-hook 'after-init-hook 'bm-repository-load)
(add-hook 'find-file-hooks 'bm-buffer-restore)
(add-hook 'kill-buffer-hook 'bm-buffer-save)
(add-hook 'kill-emacs-hook '(lambda nil (bm-buffer-save-all) (bm-repository-save)))
(add-hook 'after-save-hook 'bm-buffer-save)
(add-hook 'after-revert-hook 'bm-buffer-restore)
(set-face-background 'bm-persistent-face "DarkOrange1")
(set-face-background 'bm-face            "tomato")
;;;; w3m mode
(add-hook 'w3m-mode-hook '(lambda ()
                            (local-unset-key [up])
                            (local-unset-key [down])
                            (local-unset-key [left])
                            (local-unset-key [right])))
;;;; jabber client
(add-hook 'jabber-post-connect-hooks 'jabber-autoaway-start)
;;;; CC mode
(add-hook 'c-mode-common-hook '(lambda () (add-hook 'local-write-file-hooks
                                                    'delete-trailing-whitespace)))
(add-hook 'c-mode-common-hook '(lambda () (setq c-comment-only-line-offset '(0 . 0))))
(add-hook 'c-mode-common-hook '(lambda () (c-toggle-auto-state -1)))
(add-hook 'c-mode-common-hook '(lambda () (setq comment-column '72)))
(add-hook 'c-mode-common-hook '(lambda () (setq c-hanging-braces-alist
                                                '((brace-list-open)
                                                  (brace-entry-open)
                                                  (substatement-open after)
                                                  (block-open . after)
                                                  (block-close . c-snug-do-while)
                                                  (extern-lang-open after)
                                                  (inexpr-class-open after)
                                                  (inexpr-class-close before)
                                                  (namespace-open after)
                                                  (class-open after)
                                                  (inline-open)
                                                  (inline-close)))))
(add-hook 'c-mode-common-hook '(lambda () (setq show-trailing-whitespace nil)))
(add-hook 'c-mode-common-hook '(lambda () (hs-minor-mode 1)))
(add-hook 'c-mode-common-hook '(lambda () (setq indent-tabs-mode nil
                                                tab-width 4)))
;;;;
(add-hook 'python-mode-hook '(lambda ()
                               (setq show-trailing-whitespace t)
                               (add-hook 'local-write-file-hooks 'delete-trailing-whitespace)
                               (setq indent-tabs-mode t)))
;;;;
(add-hook 'todo-mode-hook 'hl-line-mode)

;;;;
(add-hook 'dired-mode-hook 'hl-line-mode)
;;;;
;;;;
;;;;
(add-hook 'calendar-load-hook
          (lambda ()
            (calendar-set-date-style 'european)))


(defun zuav-find-next-close-curly ()
  (interactive)
  (search-forward "}" nil t))
(defun zuav-find-prev-open-curly ()
  (interactive)
  (search-backward "{" nil t))


;;;;
;;;; SQL mode
;;;;
(add-hook 'sql-mode-hook '(lambda ()
                            (add-hook 'local-write-file-hooks
                                      'delete-trailing-whitespace)
                            (setq show-trailing-whitespace t)
                            (setq tab-width 4)))
;;;;
;;;;  GUD mode
;;;;
;;;;(add-hook 'gdb-mode-hook
;;;;          '(lambda ()
;;;;             (local-set-key [f8] 'gud-next)
;;;;             (local-set-key [f7] 'gud-step)))
;;;;
;;;; Add color to the current GUD line (obrigado google)
;;;;
(defvar gud-overlay
  (let* ((ov (make-overlay (point-min) (point-min))))
    (overlay-put ov 'face 'secondary-selection) ov)
  "Overlay variable for GUD highlighting.")

(defadvice gud-display-line (after my-gud-highlight act)
  "Highlight current line."
  (let* ((ov gud-overlay)
         (bf (gud-find-file true-file)))
    (save-excursion
      (set-buffer bf)
      (move-overlay ov (line-beginning-position) (line-end-position)
                    (current-buffer)))))

(defun gud-kill-buffer ()
  (if (eq major-mode 'gud-mode)
      (delete-overlay gud-overlay)))

(add-hook 'kill-buffer-hook 'gud-kill-buffer)

;;;;
;;;; default frame parameters
;;;;
(cond (window-system
       (setq default-frame-alist
             (append '((cursor-type . bar)
                       (background-mode . dark)
                       (foreground-color . "gray85")
                       (background-color . "black")
                       (cursor-color . "white")
                       ;(border-width . 1)
                       ;(border-color . "black")
                       ;(background-color . "white")
                       )
                     default-frame-alist))))
;;;;
;;;;
;;;;
(defun my-eval-current-buffer ()
  "Eval current buffer.
If current buffer is not in the Emasc Lisp mode, signal error."
  (interactive)
  (if (not (eq major-mode 'emacs-lisp-mode))
      (error "Not a Emacs Lisp file: %s" (buffer-file-name (current-buffer))))
  (eval-current-buffer)
  (message "Buffer evaluated successfully"))
;;
(defun zuav-line-to-top-of-window ()
  "Scroll current line to top of window.
Replaces three keystroke sequence C-u 0 C-l."
  (interactive)
  (recenter 0))

(defun switch-to-other-buffer ()
  (interactive)
  (switch-to-buffer (other-buffer)))


;;;;
;;;; Global keybindings
;;;;
(define-key function-key-map "\033[35~" [f21])
;;
(global-unset-key "\C-xf")
(global-unset-key "\C-z")
(global-unset-key [M-right])
(global-unset-key [M-left])
(global-unset-key [f1])
;;
(global-set-key [XF86Mail]        'gnus)
(global-set-key [f1]              'bm-next)
(global-set-key [f2]              'switch-to-other-buffer)
(global-set-key [f3]              'todo-show)            ; switch to TODO buffer
(global-set-key [f4]              'svn-examine)
(global-set-key [f5]              'w3m)
(global-set-key [f6]              'other-window)
(global-set-key [f7]              'psed)
(global-set-key [f8]              'my-eval-current-buffer)
(global-set-key [f9]              'zuav-compile)
(global-set-key [f11]             'shell)
(global-set-key [f12]             'ff-find-other-file)
(global-set-key [A-f9]            'compile)
(global-set-key [M-right]         'forward-sexp)
(global-set-key [M-left]          'backward-sexp)
(global-set-key [S-f1]            'bm-previous)
(global-set-key [S-f3]            'calendar)
(global-set-key [A-f1]            'bm-toggle)
(global-set-key [A-f2]            'apt-utils-search)
(global-set-key [A-f3]            'zuav-kill-buffer)
(global-set-key [A-tab]           'other-frame)
(global-set-key [?\A-l]           'zuav-line-to-top-of-window)
(global-set-key [home]            'beginning-of-line)
(global-set-key [end]             'end-of-line)
(global-set-key [kp-5]            'goto-line)
(global-set-key [kp-7]            'beginning-of-line)
(global-set-key [end]             'end-of-line)
(global-set-key [kp-1]            'end-of-line)
(global-set-key [?\C-.]           'pop-tag-mark)
(global-set-key [C-left]          'backward-word)
(global-set-key [C-right]         'forward-word)
(global-set-key [C-kp-home]       'beginning-of-buffer)
(global-set-key [C-kp-7]          'beginning-of-buffer)
(global-set-key [C-kp-end]        'end-of-buffer)
(global-set-key [C-kp-1]          'end-of-buffer)
(global-set-key [C-kp-begin]      'goto-last-change)
(global-set-key [begin]           'goto-line)
(global-set-key [insertchar]      'overwrite-mode)
(global-set-key [C-backspace]     'undo)
(global-set-key [delete]          'delete-char)          ; for X
(global-set-key "\C-x\C-b"        'buffer-menu)
(global-set-key "\C-ci"           'todo-insert-item)     ; insert new item
(global-set-key "\C-x\C-d"        'dired)
(global-set-key "\C-cd"           'dictionary-search)
(global-set-key [?\A-0]           'buffer-menu)  ;    bs-show)
;(global-set-key [C-A-delete]      'xlock)
;(global-set-key [C-A-kp-delete]   'xlock)
(global-set-key "\C-ch"           'hide-lines)
(global-set-key "\C-x\C-\\"       'goto-last-change)
(global-set-key (kbd "C-c g")     'google-word-at-point)
;;;;
;;;; Modes specific keybindings
;;;;
(define-key c-mode-map [C-prior] 'c-beginning-of-defun)
(define-key c-mode-map [C-next]  'c-end-of-defun)
;;
(define-key c++-mode-map [C-prior] 'c-beginning-of-defun)
(define-key c++-mode-map [C-next]  'c-end-of-defun)
(define-key c++-mode-map [?\A-\]]  'zuav-find-next-close-curly)
(define-key c++-mode-map [?\A-\[]  'zuav-find-prev-open-curly)
(define-key c++-mode-map [kp-add]  'hs-toggle-hiding)
(define-key c-mode-map [kp-add]  'hs-toggle-hiding)
;;
(define-key outline-mode-map [C--] 'hide-subtree)
(define-key outline-mode-map [C-=] 'show-entry)
;;
(define-key w3m-mode-map [A-left]  'w3m-previous-buffer)
(define-key w3m-mode-map [A-right] 'w3m-next-buffer)



;; to correctly set X-Reply-To for fido messages
;; borrowed from B.Tobotras' .emacs
(add-hook 'message-setup-hook
          '(lambda ()
             ;; Add X-Comment-To: field. We need From: field from original
             ;; letter. How to get right?
             (if message-reply-buffer
                 (let ((cur-buffer (current-buffer)) from-field)
                   (save-excursion
                     (set-buffer message-reply-buffer)
                     (if (string-match "^From: " (buffer-string))
                         (progn
                           (setq from-start (+ (match-end 0) 1))
                           (goto-char from-start)
                           (end-of-line)
                           (setq from-field (buffer-substring from-start (point))))))
                   (if from-field
                       (save-excursion
                         (goto-char (point-min))
                         (insert "X-Comment-To: "
                                 (Make-Comment-To from-field) "\n")))))
             ;(setq message-signature 'My-Signature)
             ))

(defun Make-Comment-To (from)
  (if (string-match " *<.*> *" from)
      (concat (substring from 0 (match-beginning 0)) (substring from (match-end 0)))
    (if (string-match "\(.*\)" from)
        (substring from (+ (match-beginning 0) 1) (- (match-end 0) 1)) from)))

;;;;
;;;; Supercite
;;;;
(setq sc-preferred-header-style 0
      sc-rewrite-header-list '((my-header-line-generator))
      sc-citation-leader " "
      sc-confirm-always-p t
      sc-preferred-attribution-list
      '( "initials" "x-attribution" "firstname" "sc-lastchoice" ))

(defun my-header-line-generator ()
  (let ((sc-mumble "")
        (whofrom (sc-whofrom)))
    (if whofrom
        (insert sc-reference-tag-string
                (sc-hdr "" (sc-mail-field "sc-author") " ")
                (sc-hdr "("   (sc-mail-field "sc-attribution") ") ")
                "writes:\n"))))
(add-hook 'mail-citation-hook 'sc-cite-original)

;;;;
;;;; These was disabled by default
;;;;
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;;;;
;;;; Insidious Big Brother Database (bbdb)
;;;;
(bbdb-initialize 'gnus 'message 'sc)

;;;;
;;;; autotype & copyright
;;;;
(add-hook 'find-file-hooks  'auto-insert)
(add-hook 'before-save-hook 'copyright-update)

(defun lindon ()
  "Start lindon virtual machine."
  (interactive)
  (call-process "/usr/bin/virtualbox" nil 0 nil "--startvm" "lindon"))

(defun mordor ()
  "Start mordor virtual machine."
  (interactive)
  (call-process "/usr/bin/virtualbox" nil 0 nil "--startvm" "mordor"))

(defun harad ()
  "Start harad virtual machine."
  (interactive)
  (call-process "/usr/bin/virtualbox" nil 0 nil "--startvm" "harad"))

(defun calibre ()
  "Start Calibre."
  (interactive)
  (call-process "/opt/calibre/calibre" nil 0 nil))

(defun qtdesigner ()
  "Start Qt Designer."
  (interactive)
  (call-process "/opt/qtsdk-2010.05/qt/bin/designer" nil 0 nil))

(defun googleearth ()
  "Start googleearth."
  (interactive)
  (call-process "/usr/bin/googleearth" nil 0 nil))

(defun icedove ()
  "Start IceDove program."
  (interactive)
  (call-process "/usr/bin/icedove" nil 0 nil))

(defun mozilla-thunderbird ()
  "Start icedove program."
  (interactive)
  (start-process "icedove" "icedove" "icedove"))


(defun chrome ()
  "Start Chrome browser."
  (interactive)
  (call-process "google-chrome" nil 0 nil))

(defun firefox ()
  "Start firefox browser."
  (interactive)
  (call-process "iceweasel" nil 0 nil))

(defun virtualbox ()
  "Start VirtualBox."
  (interactive)
  (call-process "virtualbox" nil 0 nil))

(defun xfig ()
  "Start xfig program"
  (interactive)
  (call-process "xfig" nil 0 nil))

(defun xpdf ()
  "Start xpdf program"
  (interactive)
  (call-process "xpdf" nil 0 nil))

(defun k3b ()
  "Start k3b program"
  (interactive)
  (call-process "k3b" nil 0 nil))

(defun mplayer (options file)
  "Start mplayer program"
  (interactive "sOptions: \nfView file: ")
  (setq file (expand-file-name file))
  (setq options (concat "-fs " options))
  (apply 'start-process "mplayer" "mplayer" "mplayer" (append (split-string options) (list file))))

(defun soffice (file)
  "Start OpenOffice program with file to edit"
  (interactive "fFile name: ")
  (setq file (expand-file-name file))
  (apply 'call-process "soffice" nil 0 nil (list file)))

(defun dvd (track)
  "Run mplayer to View DVD."
  (interactive "sTrack number: ")
  (let ((option (concat "dvd://" track)))
    (apply 'call-process "mplayer" nil 0 nil (list option))))

(defvar zuav-run-today-file "/home/zuav/.run-today"
  "File name where started today funcs are written.")

(defun zuav-run-once (func)
  "Run function FUNC if it was not run today."
  (save-excursion
    (find-file zuav-run-today-file)
    (let* ((run-list-date nil)
           (run-list nil)
           (today (calendar-current-date))
           (run t))
      (if (> (point-max) (point-min))
          (progn (setq run-list-date (read (current-buffer)))
                 (setq run-list (read (current-buffer)))))
      (cond ((null run-list-date)                  ; no run-today file
             (progn (setq run-list-date today)
                    (setq run-list (list func))))
            ((equal run-list-date today)           ; equal dates
             (if (member func run-list)
                 (setq run nil)
               (setq run-list (cons func run-list))))
            (t                                     ; not equal dates
             (progn (setq run-list-date today)
                    (setq run-list (list func)))))
      (if (null run)
          (kill-buffer (current-buffer))
        (progn
          ;; write new run-today file
          (delete-region (point-min) (point-max))
          (print run-list-date (current-buffer))
          (print run-list (current-buffer))
          (write-file zuav-run-today-file)
          (kill-buffer (current-buffer))
          ;; run FUNC
          (apply func nil))))))

(defun zuav-kill-buffer ()
  "Kill current buffer"
  (interactive)
  (kill-buffer (current-buffer)))

(defun zuav-compile ()
  "Just run make without prompting."
  (interactive)
  (compile compile-command))

;;;;
;;;; Function from gnu.emacs.sources
;;;;
(defun goto-last-change (&optional mark-point)
  "Set point to the position of the last change.
With a prefix arg (optional arg MARK-POINT non-nil), set mark so \
\\[exchange-point-and-mark]
will return point to the current position."
  (interactive "P")
  ;; (or (buffer-modified-p)
  ;;     (error "Buffer not modified"))
  (and (eq buffer-undo-list t)
       (error "No undo information in this buffer"))
  (if mark-point (push-mark))
  (let ((position nil)
	(undo-list buffer-undo-list)
	undo)
    (while undo-list
      (setq undo (car undo-list))
      (cond ((and (consp undo) (integerp (car undo)) (integerp (cdr undo)))
	     ;; (BEG . END)
	     (setq position (cdr undo)
		   undo-list '()))
	    ((and (consp undo) (stringp (car undo))) ; (TEXT . POSITION)
	     (setq position (abs (cdr undo))
		   undo-list '()))
	    ((and (consp undo) (eq (car undo) t))) ; (t HIGH . LOW)
	    ((and (consp undo) (null (car undo)))
	     ;; (nil PROPERTY VALUE BEG . END)
	     (setq position (cdr (last undo))
		   undo-list '()))
	    ((and (consp undo) (markerp (car undo)))) ; (MARKER . DISTANCE)
	    ((integerp undo))		; POSITION
	    ((null undo))		; nil
	    (t (error "Invalid undo entry: %s" undo)))
      (setq undo-list (cdr undo-list)))
    (if position
	(goto-char position)
      (error "Buffer not modified"))))


(defun google-word-at-point ()
  (interactive)
  (let ((word (thing-at-point 'word)))
    (if word
        (funcall browse-url-browser-function
                 (concat "http://www.google.com/search?q="
                         (url-hexify-string word)))
      (error "No word at point!"))))


(defvar find-file-root-prefix "/sudo:root@localhost:"
"*The filename prefix used to open a file with `find-file-root'.
This should look something like \"/sudo:root@localhost:\" (new style
TRAMP) or \"/[sudo:root@localhost]/\" (XEMacs or old style TRAMP).")

(defvar find-file-root-history nil
"History list for files found using `find-file-root'.")

(defvar find-file-root-hook nil
"Normal hook for functions to run after finding a \"root\" file.")

(defun find-file-root ()
  "*Open a file as the root user.
Prepends `find-file-root-prefix' to the selected file name so that it
maybe accessed via the corresponding tramp method."
  (interactive)
  (let* ( ;; We bind the variable `file-name-history' locally so we can
         ;; use a separate history list for "root" files.
         (file-name-history find-file-root-history)
         (name (or buffer-file-name default-directory))
         (tramp (and (tramp-tramp-file-p name)
                     (tramp-dissect-file-name name)))
         path dir file)

    ;; If called from a "root" file, we need to fix up the path.
    (when tramp
      (setq path (tramp-file-name-path tramp)
            dir (file-name-directory path)))

    (when (setq file (read-file-name "Find file (UID = 0): " dir path))
      (find-file (concat find-file-root-prefix file))
      ;; If this all succeeded save our new history list.
      (setq find-file-root-history file-name-history)
      ;; allow some user customization
      (run-hooks 'find-file-root-hook))))

(defface find-file-root-header-face
  '((t (:foreground "white" :background "red3")))
  "*Face use to display header-lines for files opened as root.")

(defun find-file-root-header-warning ()
  "*Display a warning in header line of the current buffer.
   This function is suitable to add to `find-file-root-hook'."
  (let* ((warning "WARNING: EDITING FILE AS ROOT!")
         (space (+ 6 (- (frame-width) (length warning))))
         (bracket (make-string (/ space 2) ?-))
         (warning (concat bracket warning bracket)))
    (setq header-line-format
          (propertize  warning 'face 'find-file-root-header-face))))

(add-hook 'find-file-root-hook 'find-file-root-header-warning)


(eval-after-load "tetris"
  '(progn
     (setq tetris-score-file "/home/zuav/lib/personal/tetris-scores")))


(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(canlock-password "b600beba9651f7c871f347668e74849f7fc7b8fb")
 '(jabber-account-list (quote (("zuav@jabber.ru" (:connection-type . starttls)) ("a_zhukov@im" (:connection-type . network)))))
 '(jabber-alert-message-hooks (quote (jabber-message-scroll)))
 '(jabber-alert-presence-hooks nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )


;;;;
;;;; Load save sessions support
;;;;
;;-;;(desktop-load-default)
;;-;;(desktop-read)
(savehist-load)

;;(semantic-load-enable-code-helpers)

;;;;
;;;; Start automatically
;;;;
;(zuav-run-once 'gnus)
;(zuav-run-once 'todo-show)

(server-start)

;;;; .emacs ends 

;;;;
;;;; Emacs configuration file
;;;;
;;;; Alexander Zhukov
;;;;
;;;; 11.03.1996 -- but I think it was really
;;;; created somewhere in Jan, 1996 or even early
;;;;

;(setq Info-directory-list '("/usr/local/share/info" "/usr/local/share/info/emacs" "/Users/zuav/lib/share/info"))

;(add-to-list 'load-path (expand-file-name "~/src/elisp"))
;(add-to-list 'load-path "/usr/local/share/git-core/contrib/emacs")

;;;
;;; MELPA, Marmalde
;;;
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)


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
(require 'smtpmail)
;;
;(require 'git-blame)
;;
;(require 'psed)
;(require 'sh-utils)


;;;;
;;;; load libraries
;;;;
(load "paren")
(load "desktop")

;;;;
;;;; Options
;;;;
(setq-default indent-tabs-mode nil)                 ; no tab chars in sources
(setq-default tab-width 8)                          ; default tab width in chars
(setq-default truncate-lines t)                     ; don't wrap long lines
(setq-default show-trailing-whitespace nil)
(setq-default fill-column 72)
(setq-default save-place t)
(setq-default ssh-directory-tracking-mode t)
;;;;
(setq split-width-threshold nil)		    ; always split windows vertically
(setq default-indicate-empty-lines nil)
(setq backup-by-copying t)
(setq case-fold-file-names nil)
(setq compile-command "make ")
(setq compilation-scroll-output t)
(setq dired-chown-program      "/bin/chown"
      dired-auto-revert-buffer t)
(setq user-mail-address             "zuav@crystax.net"
      send-mail-function            'smtpmail-send-it
      message-send-mail-function    'smtpmail-send-it
      smtpmail-smtp-server          "smtp.crystax.net"
      smtpmail-smtp-service         587
      smtpmail-stream-type          'starttls
      smtpmail-debug-info           nil
      smtpmail-debug-verb           nil)
(setq kill-whole-line t)
(setq line-number-mode t)
(setq next-line-add-newlines nil)
(setq next-screen-context-lines 1)
(setq require-final-newline t)
(setq scroll-step           0
      scroll-conservatively 1
      scroll-margin         0)
(setq transient-mark-mode t                         ; transient mark mode
      mark-even-if-inactive t)                      ;
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
      ediff-split-window-function 'split-window-vertically
      ediff-window-setup-function 'ediff-setup-windows-plain)
(setq emerge-diff-options "-w")                      ; ignore changes in whitespace
(setq tramp-default-method "scp")
(setq password-cache-expiry nil)                     ; for tramp
(setq dictionary-server "localhost")
(setq confirm-kill-emacs 'yes-or-no-p)
(setq mail-user-agent 'gnus-user-agent)
(setq gud-chdir-before-run nil)
(setq gdb-show-main t)
(setq dired-recursive-deletes 'top
      dired-recursive-copies 'top)
(setq blink-matching-paren-distance nil)
(setq line-number-display-limit-width 2000)
(setq auto-insert-query nil)                     ; autotype, copyright, etc
(setq inferior-lisp-program "/usr/bin/sbcl")
;(setq magit-last-seen-setup-instructions "1.4.0")

;;;;
;;;; Turn on or off some modes and features
;;;;
(auto-image-file-mode 1)                ; turn on viewing files as images
(delete-selection-mode 1)               ; yank replaces selected region
(scroll-bar-mode -1)	                ; no scroll-bar. I hate it too
(tool-bar-mode -1)
(auto-compression-mode 1)               ; turn on autodecompression of gz etc
(display-time-mode -1)                  ; turn off time and date display
(mouse-avoidance-mode 'banish)          ; remove mouse to upper right corner
(mouse-wheel-mode 1)                    ; turn on mouse wheel
(desktop-save-mode 1)                   ; automatically save desktop on exit
(bar-cursor-mode 1)                     ; change cursor from bar to block in overwrite mode
(windmove-default-keybindings)
(display-time-mode 1)
(global-hl-line-mode -1)

(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil                              t)
(autoload 'hide-lines                    "hide-lines" "Hide lines based on a regexp"   t)
;;(autoload 'do-not-edit-readonly          "do-not-edit")

;; /sudo:root@eriador:/etc
(add-to-list 'warning-suppress-types '(undo discard-info))
(set-default 'tramp-default-proxies-alist (quote ((".*" "\\`root\\'" "/ssh:%h:"))))
(add-to-list 'tramp-connection-properties (list (regexp-quote "/ssh:zuav@eriador:") "locale" "LC_COLLATE=C"))
(add-to-list 'tramp-connection-properties (list (regexp-quote "/ssh:zuav@neon:")    "locale" "LC_COLLATE=C"))
(add-to-list 'tramp-connection-properties (list (regexp-quote "/ssh:zuav@radon:")   "locale" "LC_COLLATE=C"))

;;;;
;;;; doc-view
;;;;
(require 'doc-view)
(setq doc-view-cache-directory "/var/tmp/docview1000"
      doc-view-resolution      4800)

;;;;
;;;; find-file settings
;;;;
(require 'find-file)
(setq-default ff-search-directories
      '("."
        ".."
        "/usr/include"
        "/usr/include/c++/4.4/*"
        "/opt/qtsdk-2010.05/qt/include/*"
        "../include"
        "../../*/include"
        "../src"
        "../../*/src"
        "/usr/local/lib/erlang/lib"))

;;;;
;;;; Erlang includes, erlang mode
;;;;
;;;;;;(add-to-list 'load-path "/usr/local/lib/erlang/lib/tools-2.11/emacs")
;;;;;;(setq erlang-root-dir "/usr/local/lib/erlang")
;;;;;;(require 'erlang-start)
;;;;;;(setq inferior-erlang-display-buffer-any-frame t
;;;;;;      inferior-erlang-machine-options          '("-sname" "emacs"))
;;;;;;(require 'erlang)
;;;;;;(defvar erlang-lib-dir (concat erlang-root-dir "/lib"))
;;;;;;(defvar erlang-libs-names (directory-files erlang-lib-dir))
;;;;;;;;
;;;;;;(defun erlang-lib-versioned-name (libstr)
;;;;;;  (let* ((parts (split-string libstr "/"))
;;;;;;         (libname (car parts))
;;;;;;         (verlibname)
;;;;;;         (result))
;;;;;;    (dolist (name erlang-libs-names result)
;;;;;;      (when (string-match libname name)
;;;;;;        (setq result (cons name result))))
;;;;;;    (setq verlibname
;;;;;;          (cond ((> (length result) 0) (car (nreverse result)))
;;;;;;                (t libname)))
;;;;;;    (mapconcat 'identity (cons verlibname (cdr parts)) "/")))
;;;;;;;;
;(erlang-lib-versioned-name "eunit/include/eunit.hrl")
;(erlang-lib-versioned-name "unit/include/eunit.hrl")
;;
(add-to-list 'ff-special-constructs 
    '("^-include(\"\\(.*\\)\"" .
      (lambda ()
        (buffer-substring (match-beginning 1) (match-end 1)))))
;;
(add-to-list 'ff-special-constructs 
    '("^-include_lib(\"\\(.*\\)\"" .
      (lambda ()
        (erlang-lib-versioned-name (buffer-substring (match-beginning 1) (match-end 1))))))
;;
(defvar erl-other-file-alist '(("\\.erl" (".hrl")) ("\\.hrl" (".erl"))))
(add-hook 'erlang-mode-hook '(lambda ()
                               (setq show-trailing-whitespace t
                                     tab-width 4
                                     comment-column      64
                                     comment-fill-column 139)
                               ;;
                               (add-hook 'local-write-file-hooks 'delete-trailing-whitespace)
                               ;;
                               (setq ff-other-file-alist 'erl-other-file-alist)))
;;;;
;;;; Objective C++
;;;;
(add-to-list 'auto-mode-alist '("\\.mm\\'" . objc-mode))
;;;;
;;;; Makefile mode
;;;;
(add-hook 'makefile-mode-hook '(lambda ()
                                 (setq show-trailing-whitespace t)
                                 (add-hook 'local-write-file-hooks
                                           'delete-trailing-whitespace)))
;;;;
;;;; Shell mode
;;;;
(add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt)
(add-hook 'comint-output-filter-functions 'comint-strip-ctrl-m)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'shell-mode-hook '(lambda () (setq tab-width 8)))
;;;;

;;;;
;;;; bookmark package (bm)
;;;;
(require 'bm)
(setq-default bm-buffer-persistence t)
(setq bm-repository-size 10000)
(add-hook 'after-init-hook 'bm-repository-load)
(add-hook 'find-file-hooks 'bm-buffer-restore)
(add-hook 'kill-buffer-hook 'bm-buffer-save)
(add-hook 'kill-emacs-hook '(lambda nil (bm-buffer-save-all) (bm-repository-save)))
(add-hook 'after-save-hook 'bm-buffer-save)
(add-hook 'after-revert-hook 'bm-buffer-restore)
(set-face-background 'bm-persistent-face "DarkOrange1")
(set-face-background 'bm-face "tomato")

;;;;
;;;; CC mode
;;;;
(setq c-default-style '((c++-mode . "stroustrup") (other . "stroustrup")))
(add-hook 'c-mode-common-hook '(lambda () (add-hook 'local-write-file-hooks
                                                    'delete-trailing-whitespace)))
(add-hook 'c-mode-common-hook '(lambda () (setq c-comment-only-line-offset '(0 . 0))))
(add-hook 'c-mode-common-hook '(lambda () (c-toggle-auto-state -1)))
(add-hook 'c-mode-common-hook '(lambda () (setq comment-column      '64
                                                comment-fill-column '139)))
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
                                                  (inline-open 0)
                                                  (inline-close 0)))))
(add-hook 'c-mode-common-hook '(lambda () (setq show-trailing-whitespace nil)))
(add-hook 'c-mode-common-hook '(lambda () (hs-minor-mode 1)))
(add-hook 'c-mode-common-hook '(lambda ()
                                 (setq indent-tabs-mode nil
                                                tab-width 4)))

;;;; Java mode 
(add-hook 'java-mode-hook '(lambda ()
                             (c-set-offset 'inline-open 0)))
;;;;
(add-hook 'python-mode-hook '(lambda ()
                               (setq show-trailing-whitespace t)
                               (add-hook 'local-write-file-hooks 'delete-trailing-whitespace)
                               (setq indent-tabs-mode t)))
;;;;
(add-hook 'dired-mode-hook 'hl-line-mode)
;;;;
;;;;
;;;;
(add-hook 'calendar-load-hook
          (lambda ()
            (calendar-set-date-style 'european)))
;;;;
;;(add-hook 'find-file-hooks 'do-not-edit-readonly)
;;;;
(add-hook 'grep-mode-hook 'hl-line-mode)
(add-hook 'Buffer-menu-mode-hook 'hl-line-mode)



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
;;;; irfc
;;;;
(setq irfc-directory (expand-file-name "~/Documents/rfc"))
(setq irfc-assoc-mode t)
;;;;
;;;; Org mode
;;;;
;-;(require 'org)
;-;(add-hook 'org-mode-hook '(lambda ()
;-;                            (local-unset-key (kbd "C-j"))
;-;                            (hl-line-mode)))
;-;;;;;
;;;; Remember
;;;;
(define-key global-map "\C-cr" 'remember)
(define-key global-map "\C-cR" 'remember-region)
;;;;
;;;; google translate
;;;;
(setq google-translate-default-target-language "ru")
;;;;
;;;; default frame parameters
;;;;
;; (pp (frame-parameters))
;; (pp (frame-parameters (car (frame-list))))
;; (frame-width (selected-frame))
;; (frame-height (selected-frame))
;;
;; menlo, 28:  83x27 fullscreen: 23.12.2016 28.07.2014
;; menlo, 27:  88x28 fullscreen: 05.08.2014
;; menlo, 26:  88x28 fullscreen: 01.09.2014
;; menlo, 25:  93x30 fullscreen: 01.10.2014
;; menlo, 24:  99x32 fullscreen: 31.10.2014
;; menlo, 23:  99x34 fullscreen: 03.12.2014
;; menlo, 22: 108x35 fullscreen: 30.01.2015
;; menlo, 20: 117x37 fullscreen: 04.03.2015
;; menlo, 19: 128x40 fullscreen: 18.05.2015
;; menlo, 17: 141x44 fullscreen: 18.11.2015
;;
(add-to-list 'default-frame-alist '(cursor-type . bar))
;;(add-to-list 'default-frame-alist '(background-mode . dark))
;;(add-to-list 'default-frame-alist '(cursor-color . "white"))
(add-to-list 'default-frame-alist '(font . "-unknown-Liberation Mono-normal-normal-normal-*-18-*-*-*-m-0-iso10646-1"))
;(add-to-list 'default-frame-alist '(font . "-apple-Menlo-medium-normal-normal-*-13-*-*-*-m-0-iso10646-1"))

;; fix problem with incorrect russian font selection, without this line
;; emacs uses some other proportional font for russian letters
;; OS X specific
;(set-fontset-font "fontset-default" '(#x0000 . #xFFFFF) '("Menlo" . "unicode-bmp"))

;;;;
;;;;
;;;;
(defun my-eval-current-buffer ()
  "Eval current buffer.
If current buffer is not in the Emasc Lisp mode, signal error."
  (interactive)
  (if (not (eq major-mode 'emacs-lisp-mode))
      (error "Not a Emacs Lisp file: %s" (buffer-file-name (current-buffer))))
  (eval-buffer)
  (message "Buffer evaluated successfully"))

;;
(defun open-create-named-shell-buffer (name &optional work-dir)
  "Run shell in the buffer with the name NAME and set working directory to WORK-DIR.
If WORK-DIR is omitted, then use home directory as working directory.
If buffer with name NAME exists, then switch to it."
  (interactive)
  (unless work-dir (setq work-dir "~"))
  (let ((old-buffer (get-buffer name)))
    (cond (old-buffer
           (shell name))
          (t
           (let ((temp-buffer (generate-new-buffer "temp")))
             ;;(message "created buffer with name: %s" (buffer-name temp-buffer))
             (set-buffer temp-buffer)
             (cd (expand-file-name work-dir))
             (shell name)
             (kill-buffer temp-buffer))))
    (delete-other-windows)))
;(global-unset-key [?\s-3])
;(global-set-key [?\s-3] (lambda () (interactive) (open-create-named-shell-buffer "test" "/tmp")))


;;(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/pdf-tools")
;;(setq pdf-info-epdfinfo-program "/usr/local/bin/epdfinfo")
;;(require 'pdf-tools)
;;(require 'pdf-occur)
;;(require 'pdf-outline)
;;(pdf-tools-install)
;;

;;;;
;;;; Ruby
;;;;
(eval-after-load "ruby-mode"
  '(progn
     (add-hook 'inf-ruby-mode-hook '(lambda () (setq comint-process-echoes t)))
     (add-hook 'ruby-mode-hook '(lambda () (add-hook 'local-write-file-hooks
                                                     'delete-trailing-whitespace)))
     (define-key ruby-mode-map "\C-c\C-c" 'comment-or-uncomment-region)))
(add-to-list 'ff-special-constructs 
    '("^require_relative '\\(.*\.rb\\)'" .
      (lambda ()
        (buffer-substring (match-beginning 1) (match-end 1)))))


;  (add-to-list 'load-path "/path/to/dash-at-point")
;  (autoload 'dash-at-point "dash-at-point"
;            "Search the word at point with Dash." t nil)
(global-set-key "\C-cs" 'dash-at-point)
(global-set-key "\C-cl" 'dash-at-point-with-docset)


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
(global-unset-key [?\s-p])              ; was (ns-print-buffer)
;;
(global-set-key [f1]              'bm-next)
(global-set-key [f2]              (lambda () (interactive) (switch-to-buffer (other-buffer))))
(global-set-key [f3]              (lambda () (interactive) (find-file (expand-file-name "~/lib/personal/todo.org"))))
(global-set-key [f4]              'magit-status)
(global-set-key [f5]              'gnus)
(global-set-key [f6]              'other-window)
(global-set-key [f7]              'psed)
(global-set-key [f8]              'my-eval-current-buffer)
(global-set-key [f9]              'compile)
(global-set-key [f11]             (lambda () (interactive) (open-create-named-shell-buffer "*shell*")))
(global-set-key [f12]             'ff-find-other-file)
(global-set-key [M-right]         'forward-sexp)
(global-set-key [M-left]          'backward-sexp)
(global-set-key [S-f1]            'bm-previous)
(global-set-key [S-f3]            'calendar)
(global-set-key [s-f1]            'bm-toggle)
(global-set-key [s-f3]            (lambda () (interactive) (kill-buffer (current-buffer))))
(global-set-key [home]            'beginning-of-buffer)
(global-set-key [end]             'end-of-buffer)
;(global-set-key [?\s-down]        'beginning-of-buffer)
(global-set-key [?\C-.]           'pop-tag-mark)
(global-set-key [C-left]          'backward-word)
(global-set-key [C-right]         'forward-word)
(global-set-key [insertchar]      'overwrite-mode)
(global-set-key [C-backspace]     'undo)
(global-set-key [delete]          'delete-char)          ; for X
(global-set-key "\C-x\C-b"        'buffer-menu)
(global-set-key "\C-x\C-d"        'dired)
(global-set-key "\C-cd"           'google-translate-at-point) ;'dictionary-search)
(global-set-key [?\s-0]           'buffer-menu)
(global-set-key "\C-ch"           'hide-lines)
(global-set-key "\C-x\C-\\"       'goto-last-change)
(global-set-key (kbd "C-c g")     'google-word-at-point)
(global-set-key [?\s-v]           'scroll-up-command)
(global-set-key "\C-hy"           'yari)

;;;;
;;;; Modes specific keybindings
;;;;
(define-key c-mode-map [C-prior] 'c-beginning-of-defun)
(define-key c-mode-map [C-next]  'c-end-of-defun)
;;;
(define-key c++-mode-map  [C-prior] 'c-beginning-of-defun)
(define-key c++-mode-map  [C-next]  'c-end-of-defun)
(define-key c++-mode-map  [?\A-\]]  'zuav-find-next-close-curly)
(define-key c++-mode-map  [?\A-\[]  'zuav-find-prev-open-curly)
(define-key c++-mode-map  [kp-add]  'hs-toggle-hiding)
(define-key c-mode-map    [kp-add]  'hs-toggle-hiding)
(define-key objc-mode-map [kp-add]  'hs-toggle-hiding)
(define-key java-mode-map [kp-add]  'hs-toggle-hiding)
;;;
(define-key outline-mode-map [C--] 'hide-subtree)
(define-key outline-mode-map [C-=] 'show-entry)


;;;
;;; Remote hosts
;;;
(defun norcass() (interactive) (ssh "azhukov@norcas.accessline.com") (delete-other-windows))
;-;(defun radon()   (interactive) (ssh "radon")   (delete-other-windows))
;-;(defun xenon()   (interactive) (ssh "xenon")   (delete-other-windows))
;-;(defun carbon()  (interactive) (ssh "carbon")  (delete-other-windows))
;-;(defun krypton() (interactive) (ssh "krypton") (delete-other-windows))
;-;(defun sulphur() (interactive) (ssh "sulphur") (delete-other-windows))
;-;(defun cobalt()  (interactive) (ssh "cobalt")  (delete-other-windows))
;
;
;-;(defun eriador()  (interactive) (ssh "eriador")  (delete-other-windows))
;-;(defun durthang() (interactive) (ssh "durthang") (delete-other-windows))

;;;;
;;;; Save frequently visited files in registers or assign then to quick keys
;;;;
(global-set-key  (kbd "C-j") 'jump-to-register)
(set-register ?a (cons 'file "~/Library/Containers/com.amazon.Kindle/Data/Library/Application Support/Kindle/My Kindle Content"))
(set-register ?d (cons 'file "~/Downloads"))
(set-register ?e (cons 'file "~/.emacs"))
(set-register ?h (cons 'file "~/"))
(set-register ?n (cons 'file "~/lib/personal/notes"))
(set-register ?t (cons 'file "~/tmp"))
(global-set-key [?\s-1] (lambda () (interactive) (jump-to-register ?h)))
(global-set-key [?\s-2] (lambda () (interactive) (open-create-named-shell-buffer "staging" "~/crystax-ndk/staging")))
(global-set-key [?\s-3] (lambda () (interactive) (open-create-named-shell-buffer "crew" "~/src/ndk/crew")))
(global-set-key [?\s-4] (lambda () (interactive) (open-create-named-shell-buffer "ndk" "~/src/ndk")))
(global-set-key [?\s-5] (lambda () (interactive) (neon)))
(global-set-key [?\s-6] (lambda () (interactive) (radon)))
(global-set-key [?\s-7] (lambda () (interactive) (eriador)))
(global-set-key [?\s-8] (lambda () (interactive) (inf-ruby) (delete-other-windows)))
;;(global-set-key [?\s-5] (lambda () (interactive) (open-create-named-shell-buffer "crew" "~/src/ndk/platform/ndk/crew")))
;;(global-unset-key [?\s-7])
;;> 
;;> (set-register ?a (cons 'file "/sudo::/etc/apt/sources.list"))
;;> (set-register ?c (cons 'file "~/.irssi/config"))
;;> (set-register ?C (cons 'file "/sudo::/etc/default/console-setup"))

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
(put 'scroll-left 'disabled nil)


;;;;
;;;; Insidious Big Brother Database (bbdb)
;;;;
;;(require 'bbdb)
;(setq bbdb-file "~/lib/personal/bbdb"
;      bbdb-north-american-phone-numbers-p nil
;      bbdb-no-duplicates-p t
;      bbdb/mail-auto-create-p nil
;      bbdb/news-auto-create-p nil)
;(bbdb-initialize 'gnus 'message 'sc)

;;;;
;;;; autotype & copyright
;;;;
(add-hook 'find-file-hooks  'auto-insert)
(add-hook 'before-save-hook 'copyright-update)
;(remove-hook 'before-save-hook 'copyright-update)

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
     (setq tetris-score-file "/Users/zuav/lib/personal/tetris-scores")))


;; S=s165:U=1149da2:E=1513a341a2c:C=149e282ead8:P=1cd:A=en-devtoken:V=2:H=db58fd0407b7fac45edf787467962bdb
;; org-tags-column: 115 for monokai, 140 for default theme
;; hl-line background  for monokai: "#3E3D31"

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Buffer-menu-name-width 28)
 '(ansi-color-names-vector
   ["#272822" "#F92672" "#A6E22E" "#E6DB74" "#66D9EF" "#FD5FF0" "#A1EFE4" "#F8F8F2"])
 '(auth-source-save-behavior nil)
 '(calendar-date-style (quote european))
 '(calendar-week-start-day 1)
 '(canlock-password "b600beba9651f7c871f347668e74849f7fc7b8fb")
 '(column-number-mode t)
 '(compilation-message-face (quote default))
 '(custom-safe-themes
   (quote
    ("a2cde79e4cc8dc9a03e7d9a42fabf8928720d420034b66aecc5b665bbf05d4e9" "3629b62a41f2e5f84006ff14a2247e679745896b5eaa1d5bcfbc904a3441b0cd" "9492cf1ac00c8a1f7130a867a97404dfeb6727801c6b2b40b853b91543f7af67" "f78de13274781fbb6b01afd43327a4535438ebaeec91d93ebdbba1e3fba34d3c" "08b8807d23c290c840bbb14614a83878529359eaba1805618b3be7d61b0b0a32" "c7a9a68bd07e38620a5508fef62ec079d274475c8f92d75ed0c33c45fbe306bc" "1dffeecd1565d04cd2059234e872cd80fcbe813488602d5c42b5c9e576924d9f" "f81a9aabc6a70441e4a742dfd6d10b2bae1088830dc7aba9c9922f4b1bd2ba50" "1160f5fc215738551fce39a67b2bcf312ed07ef3568d15d53c87baa4fd1f4d4e" "a800120841da457aa2f86b98fb9fd8df8ba682cebde033d7dbf8077c1b7d677a" "557c283f4f9d461f897b8cac5329f1f39fac785aa684b78949ff329c33f947ec" "1fc1fdf975c8c8c3767c29787a063eee50cbceef903644a0771fa66568ee8777" "c567c85efdb584afa78a1e45a6ca475f5b55f642dfcd6277050043a568d1ac6f" "70b51a849b665f50a97a028c44cec36b398398357d8f7c19d558fe832b91980f" "c59857e3e950131e0c17c65711f1812d20a54b829115b7c522672ae6ba0864cc" "6df30cfb75df80e5808ac1557d5cc728746c8dbc9bc726de35b15180fa6e0ad9" "1e3b2c9e7e84bb886739604eae91a9afbdfb2e269936ec5dd4a9d3b7a943af7f" "6c62b1cd715d26eb5aa53843ed9a54fc2b0d7c5e0f5118d4efafa13d7715c56e" "38ba6a938d67a452aeb1dada9d7cdeca4d9f18114e9fc8ed2b972573138d4664" "0fb6369323495c40b31820ec59167ac4c40773c3b952c264dd8651a3b704f6b5" "a1289424bbc0e9f9877aa2c9a03c7dfd2835ea51d8781a0bf9e2415101f70a7e" "4904daa168519536b08ca4655d798ca0fb50d3545e6244cefcf7d0c7b338af7e" "196cc00960232cfc7e74f4e95a94a5977cb16fd28ba7282195338f68c84058ec" "30b7087fdd149a523aa614568dc6bacfab884145f4a67d64c80d6011d4c90837" "cd2a93d7b63aff07b3565c1c95e461cb880f0b00d8dd6cdd10fa8ece01ffcfdf" "91faf348ce7c8aa9ec8e2b3885394263da98ace3defb23f07e0ba0a76d427d46" "3ed645b3c08080a43a2a15e5768b893c27f6a02ca3282576e3bc09f3d9fa3aaa" "05c3bc4eb1219953a4f182e10de1f7466d28987f48d647c01f1f0037ff35ab9a" "4e262566c3d57706c70e403d440146a5440de056dfaeb3062f004da1711d83fc" "5d9351cd410bff7119978f8e69e4315fd1339aa7b3af6d398c5ca6fac7fd53c7" "57f8801351e8b7677923c9fe547f7e19f38c99b80d68c34da6fa9b94dc6d3297" "0e3c610358b5a20468b9e5598997407754033d27fb87a6cbbc26450275bd0219" "bd115791a5ac6058164193164fd1245ac9dc97207783eae036f0bfc9ad9670e0" "e24180589c0267df991cf54bf1a795c07d00b24169206106624bb844292807b9" "60f04e478dedc16397353fb9f33f0d895ea3dab4f581307fbf0aa2f07e658a40" "68769179097d800e415631967544f8b2001dae07972939446e21438b1010748c" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(fci-rule-color "#3C3D37")
 '(fringe-mode nil nil (fringe))
 '(global-magit-file-mode t)
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
    (("#3C3D37" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#3C3D37" . 100))))
 '(ispell-dictionary "english")
 '(ispell-program-name "aspell")
 '(magit-diff-use-overlays nil)
 '(markdown-fontify-code-blocks-natively t)
 '(monokai-distinct-fringe-background t)
 '(monokai-high-contrast-mode-line nil)
 '(monokai-use-variable-pitch nil)
 '(mouse-wheel-scroll-amount (quote (1 ((shift) . 1) ((control)))))
 '(org-directory "~/lib/org")
 '(org-tags-column 140)
 '(package-selected-packages
   (quote
    (cmake-mode coffee-mode eruby-mode magit swift3-mode yaml-mode yari tablist ssh monokai-theme markdown-mode let-alist inf-ruby hide-lines haskell-mode google-translate go-mode exec-path-from-shell elixir-mode dash-at-point d-mode bm bison-mode bbdb bar-cursor atom-one-dark-theme atom-dark-theme)))
 '(ping-program-options (quote ("-c 8")))
 '(pos-tip-background-color "#A6E22E")
 '(pos-tip-foreground-color "#272822")
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(speedbar-show-unknown-files t)
 '(speedbar-supported-extension-expressions
   (quote
    (".org" ".[ch]\\(\\+\\+\\|pp\\|c\\|h\\|xx\\)?" ".tex\\(i\\(nfo\\)?\\)?" ".el" ".emacs" ".l" ".lsp" ".p" ".java" ".js" ".f\\(90\\|77\\|or\\)?" ".ad[abs]" ".p[lm]" ".tcl" ".m" ".scm" ".pm" ".py" ".g" ".s?html" ".ma?k" "[Mm]akefile\\(\\.in\\)?" ".[he]rl")))
 '(sr-speedbar-right-side nil)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF"))))
 '(vc-annotate-very-old-color nil)
 '(vc-follow-symlinks t)
 '(weechat-color-list
   (unspecified "#272822" "#3C3D37" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0")))

;; (setq org-tags-column 115)
;; (setq org-tags-column 140)


;-; (custom-set-faces
;-;  ;; custom-set-faces was added by Custom.
;-;  ;; If you edit it by hand, you could mess it up, so be careful.
;-;  ;; Your init file should contain only one such instance.
;-;  ;; If there is more than one, they won't work right.
;-;  '(eruby-standard-face ((t (:background "gray25"))))
;-;  '(markdown-code-face ((t (:inherit fixed-pitch :background "gray30")))))
;-; 
(savehist-load)

(server-start)
(load-theme 'monokai t)
;;;; .emacs ends 
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

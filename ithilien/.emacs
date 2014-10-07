;;;;
;;;; Emacs configuration file
;;;;
;;;; Alexander Zhukov
;;;;
;;;; 11.03.1996 -- but I think it was really
;;;; created somewhere in Jan, 1996 or even early
;;;;

(setq Info-directory-list '("/usr/local/share/info" "/usr/local/share/info/emacs" "/Users/zuav/lib/share/info"))

(add-to-list 'load-path (expand-file-name "~/src/elisp"))
(add-to-list 'load-path "/usr/local/share/git-core/contrib/emacs")


;;;
;;; MELPA, Marmalde
;;;
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;;;
;;; exec-path-from-shell
;;; OS X specific
;;;
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "PS1")
  (exec-path-from-shell-copy-env "EDITOR")
  (exec-path-from-shell-copy-env "EMAIL")
  (exec-path-from-shell-copy-env "ANDROID_SDK")
  (exec-path-from-shell-copy-env "ANDROID_HOME")
  (exec-path-from-shell-copy-env "ANDROID_SDK_ROOT")
  (exec-path-from-shell-copy-env "LANG")
  (exec-path-from-shell-copy-env "LC_COLLATE")
  (exec-path-from-shell-copy-env "INFOPATH")
  (exec-path-from-shell-copy-env "HOMEBREW_KEEP_INFO"))

;;
;; set language environment based on the LANG var
;; OS X specific
;;
(set-locale-environment)
(require 'russian-macosx)
(setq default-input-method "russian-macosx")

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
(require 'git-blame)
(require 'magit-blame)
(require 'jabber)
;;
(require 'psed)
(require 'sh-utils)


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
(setq x-meta-keysym 'alt)
(setq x-super-keysym 'meta)
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
(setq kill-emacs-query-functions
      (append kill-emacs-query-functions
              (list '(lambda ()
                       (yes-or-no-p "Really kill emacs? ")))))
(setq mail-user-agent 'gnus-user-agent)
(setq gud-chdir-before-run nil)
(setq gdb-show-main t)
(setq dired-recursive-deletes 'top
      dired-recursive-copies 'top)
(setq blink-matching-paren-distance nil)
(setq line-number-display-limit-width 2000)
(setq auto-insert-query nil)                     ; autotype, copyright, etc
(setq inferior-lisp-program "/usr/bin/sbcl")

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

(autoload 'ansi-color-for-comint-mode-on "ansi-color" nil                              t)
(autoload 'hide-lines                    "hide-lines" "Hide lines based on a regexp"   t)
;;(autoload 'do-not-edit-readonly          "do-not-edit")

;;
(add-to-list 'warning-suppress-types '(undo discard-info))
(add-to-list 'tramp-default-proxies-alist 
             '("\\lorien\\'" "\\`root\\'" "/ssh:%h:"))

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
(add-to-list 'load-path "/usr/local/lib/erlang/lib/tools-2.7/emacs")
(setq erlang-root-dir "/usr/local/lib/erlang")
(require 'erlang-start)
(setq inferior-erlang-display-buffer-any-frame t
      inferior-erlang-machine-options          '("-sname" "emacs"))
(require 'erlang)
(defvar erlang-lib-dir (concat erlang-root-dir "/lib"))
(defvar erlang-libs-names (directory-files erlang-lib-dir))
;;
(defun erlang-lib-versioned-name (libstr)
  (let* ((parts (split-string libstr "/"))
         (libname (car parts))
         (verlibname)
         (result))
    (dolist (name erlang-libs-names result)
      (when (string-match libname name)
        (setq result (cons name result))))
    (setq verlibname
          (cond ((> (length result) 0) (car (nreverse result)))
                (t libname)))
    (mapconcat 'identity (cons verlibname (cdr parts)) "/")))
;;
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

;;;
;;; w3m mode
;;;
(require 'w3m)
;;-;;(setq w3m-home-page "about://bookmark/"
;;-;;      w3m-use-cookies t
;;-;;      w3m-command-arguments (nconc w3m-command-arguments '("-cookie"))
;;-;;      w3m-default-display-inline-images t)
;(setq browse-url-browser-function 'w3m-browse-url)
;(setq browse-url-browser-function 'browse-url-default-browser)
(add-hook 'w3m-mode-hook '(lambda ()
                            (local-unset-key [up])
                            (local-unset-key [down])
                            (local-unset-key [left])
                            (local-unset-key [right])))
(define-key w3m-mode-map [s-left]  'w3m-previous-buffer)
(define-key w3m-mode-map [s-right] 'w3m-next-buffer)

;;;;
;;;; jabber client
;;;;
(setq jabber-roster-show-title    nil
      jabber-roster-line-format   " %c %-30n %u %-8s  %S"
      jabber-roster-show-bindings nil
      jabber-show-resources       nil
      jabber-auto-reconnect       t
      jabber-history-enabled      t
      jabber-use-global-history   nil
      jabber-backlog-number       1000
      jabber-backlog-days         365.0)
;;
(defun zuav-jabber-notify-message (from text)
  (call-process "/Applications/terminal-notifier.app/Contents/MacOS/terminal-notifier" nil nil nil
                "-sender"   "org.gnu.Emacs"
                "-title"    "Jabber Message"
                "-subtitle" (concat "From: " from)
                "-message"  text))

;(zuav-jabber-notify-message "zuav" "text")
;;
(defun jabber-notify-message-hook (from buf text proposed-alert)
  (zuav-jabber-notify-message from text))
;;
(add-hook 'jabber-post-connect-hooks  'jabber-autoaway-start)
(add-hook 'jabber-alert-message-hooks 'jabber-notify-message-hook)

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
;;;; Org mode
;;;;
(require 'org)
(add-hook 'org-mode-hook '(lambda ()
                            (local-unset-key (kbd "C-j"))))

;;;;
;;;; default frame parameters
;;;;
;; (pp (frame-parameters))
;; (pp (frame-parameters (car (frame-list))))
;; (frame-width (selected-frame))
;; (frame-height (selected-frame))
(add-to-list 'default-frame-alist '(cursor-type . bar))
(add-to-list 'default-frame-alist '(fullscreen . fullheight))
;(add-to-list 'initial-frame-alist '(fullscreen . fullheight))
;;
;; menlo, 28: 83x27 fullscreen: 28.07.2014
;; menlo, 27: 88x28 fullscreen: 05.08.2014
;; menlo, 26: 88x28 fullscreen: 01.09.2014
;; menlo, 25: 93x30 fullscreen: 01.10.2014
;;
(add-to-list 'default-frame-alist '(font . "-apple-Menlo-medium-normal-normal-*-25-*-*-*-m-0-iso10646-1"))
(add-to-list 'initial-frame-alist '(mode . dark))
(add-to-list 'initial-frame-alist '(background-color . "black"))
(add-to-list 'initial-frame-alist '(foreground-color . "gray85"))
(add-to-list 'initial-frame-alist '(cursor-color . "white"))

;-;(add-to-list 'default-frame-alist '(font . "-apple-Menlo-medium-normal-normal-*-12-*-*-*-m-0-iso10646-1"))
;-;(add-to-list 'initial-frame-alist '(width . 160))
;-;(add-to-list 'initial-frame-alist '(height . 56))
;(add-to-list 'initial-frame-alist '(top . 22))
;(add-to-list 'initial-frame-alist '(left . 110))

(require 'speedbar)
(add-to-list 'speedbar-frame-parameters '(background-color . "grey"))

;; fix problem with incorrect russian font selection, without this line
;; for russian letters used some other proportional font
;; OS X specific
(set-fontset-font "fontset-default" '(#x0000 . #xFFFFF) '("Menlo" . "unicode-bmp"))

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
             (kill-buffer temp-buffer))))))

;(global-unset-key [?\s-3])
;(global-set-key [?\s-3] (lambda () (interactive) (open-create-named-shell-buffer "test" "/tmp")))

;;;;
;;;; Ruby
;;;;
(add-hook 'inf-ruby-mode-hook '(lambda ()
                                 (setq comint-process-echoes t)))
(add-hook 'ruby-mode-hook '(lambda () (add-hook 'local-write-file-hooks
                                                'delete-trailing-whitespace)))

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
(global-set-key [?\C-.]           'pop-tag-mark)
(global-set-key [C-left]          'backward-word)
(global-set-key [C-right]         'forward-word)
(global-set-key [insertchar]      'overwrite-mode)
(global-set-key [C-backspace]     'undo)
(global-set-key [delete]          'delete-char)          ; for X
(global-set-key "\C-x\C-b"        'buffer-menu)
(global-set-key "\C-x\C-d"        'dired)
(global-set-key "\C-cd"           'dictionary-search)
(global-set-key [?\s-0]           'buffer-menu)
(global-set-key "\C-ch"           'hide-lines)
(global-set-key "\C-x\C-\\"       'goto-last-change)
(global-set-key (kbd "C-c g")     'google-word-at-point)
(global-set-key [?\s-v]           'scroll-up-command)

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

;;;;
;;;; Save frequently visited files in registers or assign then to quick keys
;;;; 
;;;;
(global-set-key  (kbd "C-j") 'jump-to-register)
(set-register ?d (cons 'file "~/Downloads"))
(set-register ?e (cons 'file "~/.emacs"))
(set-register ?h (cons 'file "~/"))
(set-register ?t (cons 'file "/tmp"))
(global-set-key [?\s-1] (lambda () (interactive) (jump-to-register ?h)))
(global-set-key [?\s-4] (lambda () (interactive) (open-create-named-shell-buffer "ndk" "~/src/ndk/platform/ndk")))
(global-set-key [?\s-5] (lambda () (interactive) (open-create-named-shell-buffer "ndk-test" "~/src/ndk-test")))
(global-set-key [?\s-8] (lambda () (interactive) (run-ruby)))
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
(require 'bbdb)
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


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Buffer-menu-name-width 28)
 '(auth-source-save-behavior nil)
 '(calendar-date-style (quote european))
 '(calendar-day-abbrev-array ["Вс" "Пн" "Вт" "Чт" "Пт" "Сб" "Вс"])
 '(calendar-day-name-array ["Воскресенье" "Понедельник" "Вторник" "Среда" "Четверг" "Пятница" "Суббота"])
 '(calendar-month-abbrev-array ["Янв" "Фев" "Мар" "Апр" "Май" "Июн" "Июл" "Авг" "Сен" "Окт" "Ноя" "Дек"])
 '(calendar-month-name-array ["Январь" "Февраль" "Март" "Апрель" "Май" "Июнь" "Июль" "Август" "Сентябрь" "Октябрь" "Ноябрь" "Декабрь"])
 '(calendar-week-start-day 1)
 '(canlock-password "b600beba9651f7c871f347668e74849f7fc7b8fb")
 '(column-number-mode t)
 '(custom-safe-themes (quote ("57f8801351e8b7677923c9fe547f7e19f38c99b80d68c34da6fa9b94dc6d3297" "0e3c610358b5a20468b9e5598997407754033d27fb87a6cbbc26450275bd0219" "bd115791a5ac6058164193164fd1245ac9dc97207783eae036f0bfc9ad9670e0" "e24180589c0267df991cf54bf1a795c07d00b24169206106624bb844292807b9" "60f04e478dedc16397353fb9f33f0d895ea3dab4f581307fbf0aa2f07e658a40" "68769179097d800e415631967544f8b2001dae07972939446e21438b1010748c" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" default)))
 '(ispell-dictionary "english")
 '(ispell-program-name "aspell")
 '(jabber-account-list (quote (("zuav@jabber.ru" (:connection-type . starttls)) ("zuav@crystax.net" (:connection-type . network)) ("alexander.zhuckov@gmail.com" (:connection-type . starttls)))))
 '(jabber-alert-message-hooks (quote (jabber-message-scroll)))
 '(jabber-alert-presence-hooks nil)
 '(jabber-auto-reconnect t)
 '(jabber-backlog-days 365.0)
 '(jabber-backlog-number 1000)
 '(jabber-chat-fill-long-lines nil)
 '(jabber-connection-ssl-program nil)
 '(jabber-history-enabled t)
 '(jabber-roster-line-format " %c %-30n %u %-8s  %S")
 '(jabber-roster-show-bindings t)
 '(jabber-roster-show-title nil)
 '(jabber-use-global-history nil)
 '(monokai-distinct-fringe-background t)
 '(monokai-high-contrast-mode-line nil)
 '(monokai-use-variable-pitch nil)
 '(mouse-wheel-scroll-amount (quote (1 ((shift) . 1) ((control)))))
 '(ping-program-options (quote ("-c 8")))
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(speedbar-supported-extension-expressions (quote (".org" ".[ch]\\(\\+\\+\\|pp\\|c\\|h\\|xx\\)?" ".tex\\(i\\(nfo\\)?\\)?" ".el" ".emacs" ".l" ".lsp" ".p" ".java" ".js" ".f\\(90\\|77\\|or\\)?" ".ad[abs]" ".p[lm]" ".tcl" ".m" ".scm" ".pm" ".py" ".g" ".s?html" ".ma?k" "[Mm]akefile\\(\\.in\\)?" ".[he]rl")))
 '(sr-speedbar-delete-windows t)
 '(sr-speedbar-right-side t)
 '(sr-speedbar-skip-other-window-p t)
 '(sr-speedbar-width-x 42)
 '(vc-follow-symlinks t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(savehist-load)

(server-start)
;;;; .emacs ends 

(load-file "~/code/emacs.d/emacs-color-theme-solarized/color-theme-solarized.el")
;;(color-theme-solarized-light)
;;(load-theme 'zenburn)

(package-initialize)
;;(elpy-enable)
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)


;; so left clicks open the file in the same window in dired
(setq mouse-1-click-follows-link -450)
(setq slime-net-coding-system 'utf-8-unix)
(tool-bar-mode -1)
(setq frame-title-format
  '("" invocation-name ": "(:eval (if (buffer-file-name)
                (abbreviate-file-name (buffer-file-name))
                  "%b"))))


(global-set-key (kbd "C-x l") 'point-to-register)
(global-set-key (kbd "C-x C-l") 'jump-to-register)
(global-set-key (kbd "C-3") 'shell)
(global-set-key (kbd "C-4") 'eshell)
(global-set-key (kbd "C-9") 'kill-buffer-and-window)
(global-set-key (kbd "C-z") 'undo)

;;(global-set-key (kbd "M-y") 'find-file-other-frame)

;;(add-to-list 'load-path "~/.emacs.d/bongo/")
;;(autoload 'bongo "bongo"
;;  "start bongo by switching to a Bongo buffer." t)

;;(setq package-archives '(("ELPA" . "http://tromey.com/elpa/")
;;                           ("gnu" . "http://elpa.gnu.org/packages/")))

;;(add-to-list 'load-path "~/.emacs.d/eap/")
;;(setq eap-music-library
;;      "~/music" ;default value "~/Music"
;;
;;      eap-playlist-library
;;      "~/music/my-playlists") ;default value "~/eap-playlist-library"

;;(require 'eap-autoloads)

;;(add-to-list 'load-path "~/code/emacs.d/egg/")
;;(require 'egg)

; NOT needed if installed from package
;;(add-to-list 'load-path "~/code/emacs.d/auctex-11.87/")
;;(load "auctex.el" nil t t)
;;(load "preview-latex.el" nil t t)

;; New method introduced in AUCTeX 11.86:
(setq TeX-view-program-list '(("Okular" "okular %o")))
(setq TeX-view-program-selection '((output-pdf "Okular")))
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
;;(add-hook 'LaTeX-mode-hook 'flyspell-mode) ; flyspell sucks ass
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
;;make previews bigger
(set-default 'preview-scale-function 1.3)

;;math symbols
;;(add-to-list 'load-path "/usr/share/emacs/site-lisp/ess")
;;(require 'ess-site)

;;(add-to-list 'load-path "~/code/emacs.d/lacarte.el")
(load-file "~/code/emacs.d/lacarte.el")
(require 'lacarte)
(setq LaTeX-math-menu-unicode t)
(add-hook 'LaTeX-mode-hook
          (lambda () (local-set-key (kbd "M-l") #'helm-math-symbols)))

(defvar helm-c-source-lacarte-math
    '((name . "Math Symbols")
      (init . (lambda()
                (setq helm-c-lacarte-major-mode major-mode)))
      (candidates
       . (lambda () (if (eq helm-c-lacarte-major-mode 'latex-mode)
                        (delete '(nil) (lacarte-get-a-menu-item-alist LaTeX-math-mode-map)))))
      (action . (("Open" . (lambda (candidate)
                             (call-interactively candidate)))))))

 (defun helm-math-symbols ()
    "Anything for searching math menus"
    (interactive)
    (helm '(helm-c-source-lacarte-math)
              (thing-at-point 'symbol) "Symbol: "
              nil nil "*helm math symbols*"))


(defun mykeytranslate ()
 "key translates"
  (interactive)
  (progn
;;    (load-theme 'zenburn)
    (color-theme-solarized-light)
    (mykeytranslates)))

(defun mykeytranslates ()
 "key translates"
  (interactive)
  (progn
    (keyboard-translate ?\C-p ?\C-t)
    (keyboard-translate ?\C-e ?\C-p)
    (keyboard-translate ?\C-f ?\C-e)
    (keyboard-translate ?\C-h ?\C-b)
    (keyboard-translate ?\C-b ?\C-x)
    (keyboard-translate ?\C-x ?\C-h)
    (keyboard-translate ?\C-t ?\C-f)
    (keyboard-translate ?\C-i ?\C-k)
    (keyboard-translate ?\C-k ?\C-j)
;;    (keyboard-translate ?\C-z ?\C-h)
    (load-file "~/code/emacs.d/dired-details.el")
    (require 'dired-details)
    (load-file "~/code/emacs.d/dired-details-plus/dired-details+.el")
    (require 'dired-details+)))


(defun change-dired-my ()
  (interactive)
  (wdired-change-to-wdired-mode)
  (cua-mode t))

;;yasnippet
(add-to-list 'load-path
              "~/code/emacs.d/yasnippet")
(require 'yasnippet)
(yas/global-mode 1)

(setq yas/root-directory '("~/code/emacs.d/snippets"
                           "~/code/emacs.d/yasnippet/snippets"))
(mapc 'yas/load-directory yas/root-directory)

;; open stuff in dired as it should be
(load-file "~/code/emacs.d/openwith.el")
(require 'openwith)
(openwith-mode t)

;; magit
(require 'magit)

;; (add-to-list 'load-path "~/code/emacs.d/auto-complete")
(require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories "/home/veel/code/emacs.d/auto-complete/dict")
(ac-config-default)
;; (setq ac-use-menu-map t)
(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")
;; (define-key ac-mode-map (kbd "TAB") 'auto-complete)
;; (define-key ac-menu-map (kbd "C-n") 'ac-next)
;; (define-key ac-menu-map (kbd "C-p") 'ac-previous)
;; (add-to-list 'ac-sources ac-source-yasnippet)
;; (define-key ac-complete-mode-map (kbd "RET") nil)

;; ;; dirty fix for having AC everywhere
;; (define-globalized-minor-mode real-global-auto-complete-mode
;;   auto-complete-mode (lambda ()
;;                        (if (not (minibufferp (current-buffer)))
;;                          (auto-complete-mode 1))
;;                        ))
;; (real-global-auto-complete-mode t)

;;flycheck
;;(add-to-list 'load-path "~/code/emacs.d/flycheck/")
;;(require 'flycheck)

(add-to-list 'load-path "~/code/emacs.d/slime/")  ; your SLIME directory
;;(setq inferior-lisp-program "/usr/bin/clisp") ; your Lisp system
(require 'slime)
(slime-setup)
(slime-setup '(slime-fancy))

;;(load (expand-file-name "~/quicklisp/slime-helper.el"))
  ;; Replace "sbcl" with the path to your implementation
(setq inferior-lisp-program "sbcl")

;; (add-to-list 'load-path "~/code/emacs.d/workgroups.el/")
;; (require 'workgroups)
;; (setq wg-prefix-key (kbd "M-_"))
;; (workgroups-mode 1)
;; (setq wg-morph-on nil)

(add-to-list 'load-path "~/code/emacs.d/emms/lisp/")
(require 'emms-setup)
(emms-standard)
(emms-default-players)

(add-to-list 'load-path "~/code/emacs.d/highlight-symbol.el/")
(require 'highlight-symbol)
;;TODO: find some useful keybindings

(add-to-list 'load-path "~/code/emacs.d/rainbow-delimiters/")
(require 'rainbow-delimiters)
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)
;;(add-hook '-mode-hook 'rainbow-delimiters-mode)

;; mu4e
;;(load-file "~/code/emacs.d/mu4econf.el")
;;(setq mail-user-agent 'mu4e-user-agent)

(load-file "~/code/emacs.d/mailto-handler.el") 
;;(load-file "~/code/emacs.d/dired-details.el")
;;(require 'dired-details)
;;(add-to-list 'load-path "~/code/emacs.d/dired-details-plus/dired-details+.el")
;;(require 'dired-details+)

;;;Orgmode
;;(setq load-path (cons "~/.emacs.d/org-mode/lisp" load-path))
;;(setq load-path (cons "~/.emacs.d/org-mode/contrib/lisp" load-path))
;;(require 'org-install)
;;(require 'org)
;; The following lines are always needed.  Choose your own keys.
;;(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
;;(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
;;(global-set-key "\C-cl" 'org-store-link)
;;(global-set-key "\C-ca" 'org-agenda)
;;(global-set-key "\C-cb" 'org-iswitchb)
(load-file "~/code/elisp/stuff/manga.el")

(global-unset-key (kbd "M-e"))
(global-set-key (kbd "M-n") 'next-buffer)
(global-set-key (kbd "M-e") 'previous-buffer)

;; (add-to-list 'load-path "~/code/emacs.d/strokes.el")

;; Android mode
;;(add-to-list 'load-path "~/code/emacs.d/android-mode")
;;(require 'android-mode)
;;(custom-set-variables '(android-mode-sdk-dir "~/code/builds/android-sdk-linux"))

;;Variables;; variables
(defalias 'yes-or-no-p 'y-or-n-p)
(setq blink-matching-paren nil)
(show-paren-mode 1)
(setq show-paren-delay 0)
(setq visible-bell nil)
(tool-bar-mode 0)
(menu-bar-mode 0)
(setq-default indent-tabs-mode nil)
(global-hl-line-mode 1)
(blink-cursor-mode 0)
(mouse-wheel-mode t)
(global-linum-mode 1)
(setq inhibit-startup-message t)
;;(set-scroll-bar-mode nil)
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "/usr/local/bin/conkeror")

;; replaced by session.el
;;(require 'recentf)
;;(setq recentf-auto-cleanup 'never)
;;(setq recentf-max-saved-items 100
;;      recentf-save-file "~/code/emacs.d/cache/recentf")
;;(recentf-mode t)
;;(run-at-time t 3000 'recentf-save-list)

(setq dired-guess-shell-alist-user
      (list
       (list "\\.pdf$"    "okular")
;;       (list "\\.\\(rgb\|tiff\|tif\|xbm\|gif\|pgm\|ppm\|bmp\|tga\\)$"  "display")
       (list "\\.avi$" "mplayer")
       ))

(require 'dired-x)
(add-hook 'dired-mode-hook '(lambda () (dired-omit-mode 1)))

(define-key emacs-lisp-mode-map (kbd "M-l") 'eval-region)

;;(global-set-key (kbd "M-3") 'eshell)
;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.

(load "~/code/emacs.d/haskell-mode/haskell-site-file")
(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)

(setq auto-mode-alist (cons '("\\.m$" . octave-mode) auto-mode-alist))

(autoload 'wl "wl" "Wanderlust" t)
(autoload 'wl-other-frame "wl" "Wanderlust on new frame." t)
(autoload 'wl-draft "wl-draft" "Write draft with Wanderlust." t)
(autoload 'wl-user-agent-compose "wl-draft" "Compose with Wanderlust." t)

(setq
 wl-message-ignored-field-list '("^.*:")
 wl-message-visible-field-list
      '("^\\(To\\|Cc\\):"
        "^Subject:"
        "^\\(From\\|Reply-To\\):"
        "^Organization:"
        "^X-Attribution:"
        "^\\(Posted\\|Date\\):"
        ))

;;use wanderlust as standard mail program
(if (boundp 'mail-user-agent)
    (setq mail-user-agent 'wl-user-agent))
(if (fboundp 'define-mail-user-agent)
    (define-mail-user-agent
      'wl-user-agent
      'wl-user-agent-compose
      'wl-draft-send
      'wl-draft-kill
      'mail-send-hook))

;; gnutls fix
(setq gnutls-min-prime-bits 1024)
(global-set-key (kbd "C-x m") 'wl-draft)

;; (add-to-list 'load-path "~/code/emacs.d/anything-config/")
;; (require 'anything-config)

;; Not that this does not work at the moment
;; wanderlust address fetching
;; (setq bbdb-file "~/code/emacs.d/bbdb")           ;; keep ~/ clean; set before loading
;; (require 'bbdb) 
;; (bbdb-initialize)
;; (setq 
;;     bbdb-offer-save 1                        ;; 1 means save-without-asking
    
;;     bbdb-use-pop-up t                        ;; allow popups for addresses
;;     bbdb-electric-p t                        ;; be disposable with SPC
;;     bbdb-popup-target-lines  1               ;; very small
    
;;     bbdb-dwim-net-address-allow-redundancy t ;; always use full name
;;     bbdb-quiet-about-name-mismatches 2       ;; show name-mismatches 2 secs

;;     bbdb-always-add-address t                ;; add new addresses to existing...
;;                                              ;; ...contacts automatically
;;     bbdb-canonicalize-redundant-nets-p t     ;; x@foo.bar.cx => x@bar.cx

;;     bbdb-completion-type nil                 ;; complete on anything

;;     bbdb-complete-name-allow-cycling t       ;; cycle through matches
;;                                              ;; this only works partially

;;     bbbd-message-caching-enabled t           ;; be fast
;;     bbdb-use-alternate-names t               ;; use AKA


;;     bbdb-elided-display t                    ;; single-line addresses

;;     ;; auto-create addresses from mail
;;     bbdb/mail-auto-create-p 'bbdb-ignore-some-messages-hook   
;;     bbdb-ignore-some-messages-alist ;; don't ask about fake addresses
;;     ;; NOTE: there can be only one entry per header (such as To, From)
;;     ;; http://flex.ee.uec.ac.jp/texi/bbdb/bbdb_11.html

;;     '(( "From" . "no.?reply\\|DAEMON\\|daemon\\|facebookmail\\|twitter")))



(add-to-list 'load-path "~/code/emacs.d/helm/")
(require 'helm-config)
(helm-mode 1)

;; helm speedup, stolen from sacha chua
(setq helm-idle-delay 0.0
      helm-input-idle-delay 0.01
      helm-quick-update t
      helm-ff-skip-boring-files t)

;;(global-set-key (kbd "M-o") 'helm-bookmarks)
;;n(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-r") 'helm-recentf)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-;") 'helm-at-point)

(add-to-list 'load-path "~/code/emacs.d/helm-c-yasnippet/")
(require 'helm-c-yasnippet)
(defun my-tex-hook ()
  (local-set-key (kbd "C-.") 'helm-c-yas-complete))
(add-hook 'TeX-mode-hook 'my-tex-hook)


;;(global-set-key (kbd "C-x C-f") 'helm-for-files)

;;smoother scrolling
(setq scroll-conservatively 100)
(setq scroll-margin 5)
(setq scroll-up-aggressively 0)
(setq scroll-down-aggressively 0)


(add-to-list 'load-path "~/.emacs.d/")
;;(require 'rainbow-delimiters)
;;(add-hook 'lisp-mode-hook 'rainbow-delimiters-mode 1)
;;(add-hook 'elisp-mode-hook 'rainbow-delimiters-mode 1)

;; autopair, I have replaced it with smartparens
;; (add-to-list 'load-path "~/code/emacs.d/autopair/")
;; (require 'autopair)

(add-to-list 'load-path "~/code/emacs.d/evil")
(require 'evil)
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)
(define-key evil-insert-state-map
  (read-kbd-macro evil-toggle-key) 'evil-emacs-state)
(define-key evil-emacs-state-map (kbd "M-h") 'evil-normal-state)
(define-key evil-normal-state-map (kbd "C-p") 'evil-scroll-up)
(define-key evil-normal-state-map (kbd "C-n") 'evil-scroll-down)
(define-key evil-normal-state-map (kbd "M-h") 'evil-emacs-state)
(evil-mode 1)
(define-key evil-normal-state-map (kbd "b") 'helm-buffers-list)
(define-key evil-insert-state-map (kbd "M-h") 'other-window)
;; Make movement keys work like they should
(define-key evil-normal-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
(define-key evil-motion-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
(define-key evil-motion-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
; Make horizontal movement cross lines                                    
(setq-default evil-cross-lines t)


;;lua mode
(add-to-list 'load-path "~/code/emacs.d/lua-mode/")
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

;;bookmarks-plus
(add-to-list 'load-path "~/code/emacs.d/bookmark-plus")
(require 'bookmark+)
(global-set-key (kbd "C-x r b") 'helm-bookmarks)

(add-hook 'diff-mode-hook
	  (lambda () (diff-auto-refine-mode 1)))

(setq dired-listing-switches "-alh") 

(define-key global-map (kbd "RET") 'newline-and-indent)

(add-to-list 'load-path "~/code/emacs.d/gimme-cat/gimme-cat.el")
(winner-mode 1)

(require 'ido)
;;(ido-mode 1)
;; erc
;; from emacs-fu: make sure to use wildcards for e.g. freenode as the actual server
;;                name can be be a bit different, which would screw up autoconnect
(setq erc-autojoin-channels-alist
  '((".*\\.freenode.net" "#debian" "#conkeror")
;;     (".*\\.gimp.org" "#unix" "#gtk+")
    ))

;; check channels
(erc-track-mode t)
(setq erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT" "MODE"
                                "324" "329" "332" "333" "353" "477"))
;; don't show any of this
(setq erc-hide-list '("JOIN" "PART" "QUIT" "NICK"))

;;stolen from emacs-fu
(defun mei-erc-start-or-switch ()
  "Connect to ERC, or switch to last active buffer"
  (interactive)
  (if (get-buffer "irc.freenode.net:6667") ;; ERC already active?

    (erc-track-switch-buffer 1) ;; yes: switch to last active
    (when (y-or-n-p "Start ERC? ") ;; no: maybe start ERC
      (erc :server "irc.freenode.net" :port 6667 :nick "veelium"))))

(add-hook 'after-init-hook 'session-initialize)

;; evil-powerline
(add-to-list 'load-path "~/code/emacs.d/powerline/")
(require 'powerline)
;;(powerline-center-evil-theme)

;; nyancat indicates position in buffer
(add-to-list 'load-path "~/code/emacs.d/nyan-mode/")
(require 'nyan-mode)

;; undo tree
(add-to-list 'load-path "~/code/emacs.d/undo-tree/")
(require 'undo-tree)
(global-undo-tree-mode)

;; guide key package
(require 'guide-key)
(setq guide-key/guide-key-sequence '("C-c" "C-c C-f" "C-x r"))
(setq guide-key/recursive-key-sequence-flag t)
(guide-key-mode 1)
(setq guide-key/idle-delay 0.4)

;; smart parens
(add-to-list 'load-path "~/code/emacs.d/smartparens/")
(require 'smartparens-config)
(smartparens-global-mode)

;; sudo edit
(defun sudo-edit (&optional arg)
  "Edit currently visited file as root.

With a prefix ARG prompt for a file to visit.
Will also prompt for a file to visit if current
buffer is not visiting a file."
  (interactive "P")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:"
                         (ido-read-file-name "Find file(as root): ")))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

(global-set-key (kbd "C-x 9") 'sudo-edit)


;;(require 'w3m-load)

;;(add-to-list 'load-path "~/code/emacs.d/isearch+.el")
;;(require 'isearch+) 

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-PDF-mode t)
 '(TeX-source-correlate-method (quote synctex))
 '(TeX-source-correlate-mode t)
 '(TeX-source-correlate-start-server t)
 '(auto-save-file-name-transforms (quote ((".*" "~/.emacs.d/autosaves/\\1" t))))
 '(backup-directory-alist (quote ((".*" . "~/.emacs.d/backups/"))))
 '(blink-cursor-mode nil)
 '(bmkp-auto-light-when-set (quote all-in-buffer))
 '(bmkp-last-as-first-bookmark-file "~/.emacs.d/bookmarks")
 '(c-default-style (quote ((c-mode . "") (java-mode . "java") (awk-mode . "awk") (other . "gnu"))))
 '(custom-safe-themes (quote ("71b172ea4aad108801421cc5251edb6c792f3adbaecfa1c52e94e3d99634dee7" default)))
 '(desktop-path (quote ("~/code/emacs.d/" "~")))
 '(dired-details-hidden-string "\"\"")
 '(elpy-rpc-backend "jedi")
 '(erc-modules (quote (autojoin button completion fill irccontrols list match menu move-to-prompt netsplit networks noncommands readonly ring stamp track)))
 '(erc-nick "veelium")
 '(evil-esc-delay 0)
 '(evil-toggle-key "C-z")
 '(haskell-tags-on-save t)
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 113 :width normal))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "navy" :weight bold)))))

(define-key dired-mode-map (kbd "e") 'dired-previous-line)
(define-key dired-mode-map (kbd "t") 'emms-play-dired)
(define-key dired-mode-map (kbd "h") 'dired-up-directory)
(define-key dired-mode-map (kbd "p") 'emms-add-dired)
(define-key dired-mode-map (kbd "C-.") 'change-dired-my)

;; system-notify: make a nice notification widget on the screen
;;(defun system-notify (title message)
;;  "invoke easy-notify with a title and shows a message"
;;  (interactive "")
;;  (start-process-shell-command "*Output*" nil
;;                               (concat "easy-notify -t \"" title "\" -m \"" message "\"")))
;; use system-notify with emms
;;(add-hook
;; 'emms-player-started-hook
;; '(lambda ()(system-notify
;;             "emms is now playing..."
;;             (emms-track-description (emms-playlist-current-selected-track)))))

(load-file "~/code/emacs.d/emacs-color-theme-solarized/color-theme-solarized.el")
;;(color-theme-solarized-light)
;;(load-theme 'zenburn)

;; so left clicks open the file in the same window in dired
(setq mouse-1-click-follows-link -450)
(setq slime-net-coding-system 'utf-8-unix)
(tool-bar-mode -1)
(setq frame-title-format
  '("" invocation-name ": "(:eval (if (buffer-file-name)
                (abbreviate-file-name (buffer-file-name))
                  "%b"))))

(global-set-key (kbd "M-o") 'helm-bookmarks)
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

(add-to-list 'load-path "~/code/emacs.d/auctex-11.87/")
(load "auctex.el" nil t t)
;;(load "preview-latex.el" nil t t)
;; New method introduced in AUCTeX 11.86:
(setq TeX-view-program-list '(("Okular" "okular %o")))
(setq TeX-view-program-selection '((output-pdf "Okular")))
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

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

(package-initialize)
;;(elpy-enable)
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(require 'magit)

;; (add-to-list 'load-path "~/code/emacs.d/auto-complete")
;; (require 'auto-complete-config)
;; (add-to-list 'ac-dictionary-directories "/home/veel/code/emacs.d/auto-complete/dict")
;; (ac-config-default)
;; (setq ac-use-menu-map t)
;; (ac-set-trigger-key "TAB")
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

(add-to-list 'load-path "~/code/emacs.d/rainbow-delimiters/")
(require 'rainbow-delimiters)
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)
(add-hook 'lisp-mode-hook 'rainbow-delimiters-mode)
;;(add-hook '-mode-hook 'rainbow-delimiters-mode)

;; mu4e
;;(load-file "~/code/emacs.d/mu4econf.el")
;;(setq mail-user-agent 'mu4e-user-agent)

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
(global-set-key (kbd "C-x C-r") 'helm-recentf)

;; (add-to-list 'load-path "~/code/emacs.d/strokes.el")

;; Android mode
;;(add-to-list 'load-path "~/code/emacs.d/android-mode")
;;(require 'android-mode)
;;(custom-set-variables '(android-mode-sdk-dir "~/code/builds/android-sdk-linux"))

;;Variables;; variables
(defalias 'yes-or-no-p 'y-or-n-p)
(setq blink-matching-paren nil)
(setq visible-bell nil)
(tool-bar-mode 0)
(setq-default indent-tabs-mode nil)
(global-hl-line-mode 1)
(blink-cursor-mode 0)
(mouse-wheel-mode t)
(global-linum-mode 1)
(setq inhibit-startup-message t)
;;(set-scroll-bar-mode nil)
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "/usr/bin/conkeror")

(setq dired-guess-shell-alist-user
      (list
       (list "\\.pdf$"    "okular")
;;       (list "\\.\\(rgb\|tiff\|tif\|xbm\|gif\|pgm\|ppm\|bmp\|tga\\)$"  "display")
       (list "\\.avi$" "mplayer")
       ))

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

;; (add-to-list 'load-path "~/code/emacs.d/anything-config/")
;; (require 'anything-config)

(add-to-list 'load-path "~/code/emacs.d/helm/")
(require 'helm-config)

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

(add-to-list 'load-path "~/code/emacs.d/autopair/")
(require 'autopair)

(add-to-list 'load-path "~/code/emacs.d/evil")
(require 'evil)
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)
(define-key evil-insert-state-map
  (read-kbd-macro evil-toggle-key) 'evil-emacs-state)
(define-key evil-emacs-state-map (kbd "M-h") 'evil-normal-state)
(define-key evil-normal-state-map (kbd "C-p") 'evil-scroll-up)
(define-key evil-normal-state-map (kbd "M-h") 'evil-emacs-state)
(evil-mode 1)

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

(define-key global-map (kbd "RET") 'newline-and-indent)

(add-to-list 'load-path "~/code/emacs.d/gimme-cat/gimme-cat.el")
(winner-mode 1)

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
 '(bmkp-auto-light-when-set (quote all-in-buffer))
 '(bmkp-last-as-first-bookmark-file "~/.emacs.d/bookmarks")
 '(c-default-style (quote ((c-mode . "") (java-mode . "java") (awk-mode . "awk") (other . "gnu"))))
 '(custom-safe-themes (quote ("71b172ea4aad108801421cc5251edb6c792f3adbaecfa1c52e94e3d99634dee7" default)))
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
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 100 :width normal))))
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

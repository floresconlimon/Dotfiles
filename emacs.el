(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;;(load-theme 'zenburn)
(add-to-list 'load-path "~/.emacs.d/slime/")  ; your SLIME directory
(setq inferior-lisp-program "/usr/local/bin/sbcl") ; your Lisp system
(require 'slime)
(slime-setup)
(slime-setup '(slime-repl))
(setq slime-net-coding-system 'utf-8-unix)
(tool-bar-mode -1)
(global-set-key (kbd "M-o") 'find-file)
(global-set-key (kbd "M-y") 'find-file-other-frame)

;;(add-to-list 'load-path "~/.emacs.d/bongo/")
;;(autoload 'bongo "bongo"
;;  "start bongo by switching to a Bongo buffer." t)

(setq package-archives '(("ELPA" . "http://tromey.com/elpa/") 
                           ("gnu" . "http://elpa.gnu.org/packages/")))

(add-to-list 'load-path "~/.emacs.d/eap/")
(setq eap-music-library
      "~/music" ;default value "~/Music"
      
      eap-playlist-library
      "~/music/my-playlists") ;default value "~/eap-playlist-library"

(require 'eap-autoloads) 

(add-to-list 'load-path "~/.emacs.d/egg/")
(require 'egg)

(defun mykeytranslates ()
  "key translates"
  (interactive)
  (progn
    (keyboard-translate ?\C-p ?\C-t) 
    (keyboard-translate ?\C-e ?\C-p) 
    (keyboard-translate ?\C-f ?\C-e) 
    (keyboard-translate ?\C-b ?\C-h) 
    (keyboard-translate ?\C-h ?\C-b) 
    (keyboard-translate ?\C-b ?\C-x) 
    (keyboard-translate ?\C-x ?\C-h) 
    (keyboard-translate ?\C-t ?\C-f) 
    (keyboard-translate ?\C-i ?\C-k) 
    (keyboard-translate ?\C-k ?\C-j)
    (load-theme 'zenburn)))

(add-to-list 'load-path "~/.emacs.d/auto-complete/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "/home/veel/.emacs.d/ac-dict")
(ac-config-default)

;;;orgmode
(setq load-path (cons "~/.emacs.d/org-mode/lisp" load-path))
(setq load-path (cons "~/.emacs.d/org-mode/contrib/lisp" load-path))
(require 'org-install)
;; The following lines are always needed.  Choose your own keys.
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
;;(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;;variables;; variables
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
      browse-url-generic-program "/usr/bin/firefox")

(global-set-key (kbd "M-3") 'eshell)


;;smoother scrolling
(setq scroll-conservatively 100)
(setq scroll-margin 5)
(setq scroll-up-aggressively 0)
(setq scroll-down-aggressively 0)


(add-to-list 'load-path "~/.emacs.d/")
(require 'rainbow-delimiters)

(add-hook 'lisp-mode-hook 'rainbow-delimiters-mode 1)
(add-hook 'elisp-mode-hook 'rainbow-delimiters-mode 1)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("cf4dda59b259ca9c6214a8e9acf84bf5909c6e59" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

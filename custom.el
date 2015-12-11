;;; This file contains some temporary code snippets, it will be loaded after
;;; various oh-my-emacs modules. When you just want to test some code snippets
;;; and don't want to bother with the huge ome.*org files, you can put things
;;; here.

;; For example, oh-my-emacs disables menu-bar-mode by default. If you want it
;; back, just put following code here.
(menu-bar-mode t)

;;; You email address
;;(setq user-mail-address "xiaohanyu1988@gmail.com")

;;; Calendar settings
;; you can use M-x sunrise-sunset to get the sun time
;;(setq calendar-latitude 39.9)
;;(setq calendar-longitude 116.3)
;;(setq calendar-location-name "Beijing, China")

;;; Time related settings
;; show time in 24hours format
(setq display-time-24hr-format t)
;; show time and date
(setq display-time-and-date t)
;; time change interval
(setq display-time-interval 10)
;; show time
(display-time-mode t)

;;; Some tiny tool functions
;; (defun replace-all-chinese-quote ()
;;   (interactive)
;;   (save-excursion
;;     (mark-whole-buffer)
;;     (replace-regexp  "”\\|“" "\"")
;;     (mark-whole-buffer)
;;     (replace-regexp "’\\|‘" "'")))

;; Comment function for GAS assembly language
;; (defun gas-comment-region (start end)
;;   "Comment region for AT&T syntax assembly language The default
;; comment-char for gas is ';', we need '#' instead"
;;   (interactive "r")
;;   (setq end (copy-marker end t))
;;   (save-excursion
;;     (goto-char start)
;;     (while (< (point) end)
;;       (beginning-of-line)
;;       (insert "# ")
;;       (next-line))
;;     (goto-char end)))

;; (defun gas-uncomment-region (start end)
;;   "Uncomment region for AT&T syntax assembly language the
;; inversion of gas-comment-region"
;;   (interactive "r")
;;   (setq end (copy-marker end t))
;;   (save-excursion
;;     (goto-char start)
;;     (while (< (point) end)
;;       (beginning-of-line)
;;       (if (equal (char-after) ?#)
;;           (delete-char 1))
;;       (next-line))
;;     (goto-char end)))

(defun cl-struct-define (name docstring parent type named slots children-sym
                              tag print-auto)
  (cl-assert (or type (equal '(cl-tag-slot) (car slots))))
  (cl-assert (or type (not named)))
  (if (boundp children-sym)
      (add-to-list children-sym tag)
    (set children-sym (list tag)))
  (let* ((parent-class parent))
    (while parent-class
      (add-to-list (intern (format "cl-struct-%s-tags" parent-class)) tag)
      (setq parent-class (get parent-class 'cl-struct-include))))
  ;; If the cl-generic support, we need to be able to check
  ;; if a vector is a cl-struct object, without knowing its particular type.
  ;; So we use the (otherwise) unused function slots of the tag symbol
  ;; to put a special witness value, to make the check easy and reliable.
  (unless named (fset tag :quick-object-witness-check))
  (put name 'cl-struct-slots slots)
  (put name 'cl-struct-type (list type named))
  (if parent (put name 'cl-struct-include parent))
  (if print-auto (put name 'cl-struct-print print-auto))
  (if docstring (put name 'structure-documentation docstring)))

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
    ;; (keyboard-translate ?\C-z ?\C-h)
    ))

(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)
(define-key evil-insert-state-map
(read-kbd-macro evil-toggle-key) 'evil-emacs-state)
(define-key evil-emacs-state-map (kbd "M-h") 'evil-normal-state)
(define-key evil-normal-state-map (kbd "C-p") 'evil-scroll-up)
(define-key evil-normal-state-map (kbd "C-n") 'evil-scroll-down)
(define-key evil-normal-state-map (kbd "M-h") 'evil-emacs-state)
(define-key evil-normal-state-map (kbd "b") 'helm-buffers-list)
(define-key evil-insert-state-map (kbd "M-h") 'other-window)

(global-set-key (kbd "<f5>")
                (lambda () (interactive) (find-file "~/code/org/daytoday.org")))

(setq org-agenda-files '("~/code/org"))

(define-key global-map (kbd "RET") 'newline-and-indent)

(mykeytranslates)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-engine (quote default))
 '(emms-player-list (quote (emms-player-mpv)))
 '(org-emphasis-alist (quote (("*" bold) ("/" italic) ("_" underline) ("=" org-verbatim verbatim) ("~" org-code verbatim) ("+" (:strike-through t))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

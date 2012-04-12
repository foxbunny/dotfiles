;; do not show welcome msg
(setq inhibit-startup-message t)

;; additional load paths
(add-to-list 'load-path "~/Emacs")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/color-theme")

;; slime up!
(require 'slime)
(add-hook 'lisp-mode-hook (lambda () (slime-mode t)))
(add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))
(setq inferior-lisp-program "clisp") 

;; load smart tabs
(require 'smart-tab)
(global-smart-tab-mode 1)

;; load color themes
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-hober)))
(color-theme-charcoal-black)

;; auto-load JS2 mode for JavaScript
(autoload 'js2-mode "js2" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

;; I hate tabs!
(setq-default indent-tabs-mode nil)

;; Tab completion function
(defun indent-or-expand (arg)
  ;; Either indent according to mode, 
  ;; or expand the word preceding
  (interactive "*P")
  (if (and
       (or (bobp) (= ?w (char-syntax (char-before))))
       (or (eobp) (not (= ?w (char-syntax (char-after))))))
      (dabbrev-expand arg)
    (indent-according-to-mode)))

;; Tab completion mapping
(defun tab-fix ()
  (local-set-key [tab] 'indent-or-expand))

(add-hook 'lisp-mode 'tab-fix)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(js2-auto-indent-p t)
 '(js2-auto-insert-catch-block t)
 '(js2-basic-offset 2)
 '(js2-bounce-indent-p t)
 '(js2-cleanup-whitespace t)
 '(js2-highlight-level 3)
 '(js2-indent-on-enter-key t)
 '(js2-mode-indent-ignore-first-tab t)
 '(js2-mode-indent-inhibit-undo nil)
 '(js2-mode-show-strict-warnings nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

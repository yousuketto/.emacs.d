;; Common
(global-linum-mode t)
(tool-bar-mode -1)
(menu-bar-mode -1)
(setq scroll-step 1)
(global-set-key "\C-h" 'delete-backward-char)
(require 'cl-lib)
(setq-default indent-tabs-mode nil)
(electric-indent-mode t)
(prefer-coding-system 'utf-8-unix)
(if (eq system-type 'windows-nt) (set-file-name-coding-system 'cp932))

;; backup file settings.
(setq make-backup-files t)
(setq backup-directory-alist
      (cons (cons "\\.*$" (expand-file-name "~/.emacs.d/backup"))
            backup-directory-alist))

;; rectangle (cua-mode) settings
(cua-mode t)
(setq cua-enable-cua-keys nil)

;; add melpa
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
;; (add-to-list 'package-archives
;;              '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(package-initialize)
;; install packages
(mapc
 'package-install
 (cl-remove-if
  'package-installed-p
  '(
    auto-complete
    yasnippet
    ;; languages
    markdown-mode
    yaml-mode
    coffee-mode
    scss-mode
    )))
;; load plugin-settings
(mapc 'load
      (cl-remove-if-not
       '(lambda(path) (package-installed-p (intern (file-name-base path))))
       (directory-files "~/.emacs.d/plugin-settings" 't "^[^#].*elc?$")))

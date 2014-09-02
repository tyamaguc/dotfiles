;; language
(set-language-environment 'Japanese)

;; encoding
(set-default-coding-systems 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; backup
(setq make-backup-files nil)
(setq auto-save-default nil)

;; config
(global-set-key "\C-h" 'delete-backward-char)
(set-face-background 'region "linen")
(show-paren-mode 1)
(menu-bar-mode -1)

;; load-path
(setq load-path (cons "~/.emacs.d/elisp" load-path))
(setq load-path (cons "~/.emacs.d/elpa" load-path))
(setq load-path (cons "~/.rbenv/versions/1.9.3-p545/bingems/rcodetools-0.8.5.0" load-path))

;; install-elisp
(require 'install-elisp)
(setq install-elisp-repository-directory "~/.emacs.d/elisp/")

;; auto-install
(require 'auto-install)
(setq auto-install-directory "~/.emacs.d/elisp")
(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)

;; package
(require 'package)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("ELPA" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives '("MELPA" . "http://melpa.milkbox.net/packages/"))
(setq package-user-dir(concat user-emacs-directory "elpa"))
(package-initialize)

;; auto-complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-1.4/dict")
(ac-config-default)
(global-auto-complete-mode t)
(setq ac-auto-start 4)
(setq ac-auto-show-menu 0.5)
(setq ac-use-comphist t)
(setq ac-use-menu-map t)
(setq ac-candidate-limit nil)
(set-face-background 'ac-candidate-face "linen")
(set-face-underline 'ac-candidate-face "linen")
(set-face-background 'ac-selection-face "linen")
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)
(define-key ac-completing-map (kbd "<tab>") 'nil)

;; ruby-mode
(setq ruby-deep-indent-paren-style nil)
(defadvice ruby-indent-line (after unindent-closing-paren activate)
  (let ((column (current-column))
        indent offset)
    (save-excursion
      (back-to-indentation)
      (let ((state (syntax-ppss)))
        (setq offset (- column (current-column)))
        (when (and (eq (char-after) ?\))
                   (not (zerop (car state))))
          (goto-char (cadr state))
          (setq indent (current-indentation)))))
    (when indent
      (indent-line-to indent)
      (when (> offset 0) (forward-char offset)))))

;; anything
(require 'anything)
(require 'anything-rcodetools)
(global-set-key (kbd "\C-x \C-b") 'anything)
;;(setq rct-get-all-methods-command "refe -l")
(define-key anything-map "\C-z" 'anything-execute-persistent-action)

;; anything-rurema
(require 'anything-myrurema)
(global-set-key (kbd "\C-x \C-@") 'anything-myrurema)

;; anything-rdefs
(require 'anything-rdefs)
(require 'rcodetools)
(add-hook 'ruby-mode-hook
  (lambda ()
    (define-key ruby-mode-map (kbd "C-x C-p") 'anything-rdefs)
    (define-key ruby-mode-map (kbd "C-c C-d") 'xmp)))

;; color-theme
(require 'color-theme)
(color-theme-initialize)
(color-theme-dark-laptop)

;; emacs-server
(require 'server)
(unless (server-running-p) (server-start))

;; magit
(global-set-key (kbd "C-x g") 'magit-status)

;; haml-mode
(require 'haml-mode)
(add-to-list 'auto-mode-alist '("\\.haml$" . haml-mode))

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

;; rinari
(setq rinari-tags-file-name "TAGS")
(add-to-list 'load-path "~/.emacs.d/elpa/rinari-2.10/")
(require 'rinari)

;; markdown-mode
(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; plantuml-mode
(autoload 'plantuml-mode "plantuml-mode" "PlantUML mode" t)
(add-to-list 'auto-mode-alist '("\\.uml\\'" . plantuml-mode))
(setq plantuml-jar-path "~/bin/plantuml.jar")

;; ag
(require 'ag)
(global-set-key (kbd "<f5>") 'ag-project-at-point)
(global-set-key (kbd "<f6>") 'ag-regexp-project-at-point)

;; wgrep-ag
(require 'wgrep-ag)
(autoload 'wgrep-ag-setup "wgrep-ag")
(add-hook 'ag-mode-hook 'wgrep-ag-setup)
(define-key ag-mode-map (kbd "r") 'wgrep-change-to-wgrep-mode)

;; smooth-scroll
(require 'smooth-scroll)
(smooth-scroll-mode t)

;; expand-region
(require 'expand-region)
(global-set-key (kbd "C-w") 'er/expand-region)
(global-set-key (kbd "M-w") 'er/contract-region)

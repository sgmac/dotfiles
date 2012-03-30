;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;  I copied some parts from other people, and I  
;;
;; Alvaro Bautista's configuration
;;  - https://github.com/alvarobp/dotfiles (Rake..)
;;
;; Karl Fogelmark (really nice emacs configuration)
;;  - Lusty for file and buffer browser.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;; Default mode
;;
(add-hook 'text-mode-hook
	  (function (lambda ()
		      (turn-on-auto-fill))))

;;
;;;; Ruby Mode
;;

(add-to-list 'load-path "~/.emacs.d/modes/ruby-mode")
(add-to-list 'auto-mode-alist '("\\.rb\\'" . ruby-mode))
(autoload 'ruby-mode "ruby-mode" "Major mode for Ruby" t)



;; Rake files are ruby, too, as are gemspecs, rackup files, and gemfiles.
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Guardfile$" . ruby-mode))
(add-hook 'ruby-mode-hook (lambda () (local-set-key "\r" 'newline-and-indent)))

;; IRB inside Emacs
(require 'inf-ruby)

;; Ruby electric
(require 'ruby-electric)
;(ruby-eletric-mode t)


;;
;;;; Plugins
;;

(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas/global-mode 1)


;; Multiterm
(add-to-list 'load-path "~/.emacs.d/plugins/multiterm")
(require 'multi-term)
(setq multi-term-program "/bin/bash")


;; Navigation
(add-to-list 'load-path "~/.emacs.d/plugins/nav")
(require 'nav)


;; Lusty
(add-to-list 'load-path "~/.emacs.d/plugins/lusty")


(when (require 'lusty-explorer nil 'noerror) ;;Only read if package available
  ;; override the normal file-opening, buffer switching
  (global-set-key (kbd "C-x C-f") 'lusty-file-explorer)
  (global-set-key (kbd "C-x b")   'lusty-buffer-explorer))
;(require 'lusty-explorer)


(add-to-list 'load-path "~/.emacs.d/plugins/colortheme")
(add-to-list 'load-path "~/.emacs.d/plugins/colortheme/color-theme.el")
(add-to-list 'load-path "~/.emacs.d/plugins/colortheme/themes")
(require 'color-theme)
(color-theme-initialize)
(color-theme-subdued)


(require 'ido)
(ido-mode t)


;; wanderlust
(autoload 'wl "wl" "Wanderlust" t)
(autoload 'wl-other-frame "wl" "Wanderlust on new frame." t)
(autoload 'wl-draft "wl-draft" "Write draft with Wanderlust." t)


(provide 'modes)


;;
;;;; Default mode
;;
(add-hook 'text-mode-hook
	  (function (lambda ()
		      (turn-on-auto-fill))))



;;
;;;; Plugins
;;

;(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet")
;(require 'yasnippet) ;; not yasnippet-bundle
;(yas/initialize)
;(yas/load-directory "~/.emacs.d/plugins/yasnippet/snippets")

  

;; MULTITERM
;(add-to-list 'load-path "~/.emacs.d/plugins/multiterm")
;(require 'multi-term)
;(setq multi-term-program "/bin/bash")

;; ANYTHING

;(add-to-list 'load-path "~/.emacs.d/plugins/anything")
;(require 'anything-config)
;(require 'anything-show-completion)

;; NAVIGATION

;(add-to-list 'load-path "~/.emacs.d/emacs-nav")
;(require 'nav)


;; LUSTY

;(add-to-list 'load-path "~/.emacs.d/plugins/lusty")
;(require 'lusty-explorer)




(setq load-path (append load-path (list
				   "~/.el"
				   )))

(setq default-frame-alist 
      '((cursor-color . "yellow")
	(background-color . "black")
	(foreground-color . "white"))
)




(require 'ido)
(ido-mode t)


;; wanderlust
(autoload 'wl "wl" "Wanderlust" t)
(autoload 'wl-other-frame "wl" "Wanderlust on new frame." t)
(autoload 'wl-draft "wl-draft" "Write draft with Wanderlust." t)


(provide 'modes)
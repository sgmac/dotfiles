(add-to-list 'load-path "~/.emacs.d")



(require  'modes)
(require  'theme)
(require  'bindings)
(require  'defuns)
(require  'custom)
(provide 'init)



;;
;;;; Custom variables
;;



(custom-set-variables
 '(display-time-24hr-format t)
 '(frame-title-format (quote ("%b" (buffer-file-name ": %f"))) t)
 '(inhibit-startup-screen t)
 '(make-backup-files nil)
 '(tool-bar-mode nil)
 '(transient-mark-mode t)
 '(x-select-enable-clipboard t))

;;
;;;; Custom faces
;;

(custom-set-faces
 )

(line-number-mode 't)
(column-number-mode 't)
(display-time)

(setq frame-title-format '("%b" (buffer-file-name ":%f" )))



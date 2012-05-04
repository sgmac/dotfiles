;:
;;;; My keymaps
;:

(global-set-key "\C-c\C-k" 'myemacs-conf)
(global-set-key "\C-c s" 'ansi-term)
(global-set-key "\C-c\C-v" 'eval-buffer)
(global-set-key (kbd "<f2>") 'open-localhost)
(global-set-key (kbd "<f3>") 'xen)
(global-set-key (kbd "<f4>") 'nav)
(global-set-key (kbd "<f6>") 'yas/reload-all)
(global-set-key (kbd "<f7>") 'compile)
(global-set-key (kbd "<f9>") 'gnus) 
(global-set-key (kbd "M-/") 'hippie-expand) 


(provide 'bindings)
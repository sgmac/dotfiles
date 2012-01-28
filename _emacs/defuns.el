;;
;;;; My own fucntions
;;


(defun open-localhost ()
      (interactive)
      (ansi-term "bash" "localhost"))

(defun myemacs-conf() 
  "Opening my emacs file."
  (interactive)
  (find-file "~/.emacs")
)

(defun remote (new-buffer-name cmd &rest switches)
  (setq term-ansi-buffer-name (concat "*" new-buffer-name "*"))
  (setq term-ansi-buffer-name (generate-new-buffer-name term-ansi-buffer-name))
  (setq term-ansi-buffer-name (apply 'make-term term-ansi-buffer-name cmd nil switches))
  (set-buffer term-ansi-buffer-name)
  (term-mode)
  (term-char-mode)
  (term-set-escape-char ?\C-x)
  (switch-to-buffer term-ansi-buffer-name))

(defun xen() 
  "Connecting xen server"
  (interactive)
  (remote "window_name"  "ssh" "user@remote.com"))



(provide 'defuns)

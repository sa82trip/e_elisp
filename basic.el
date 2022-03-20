;;; Package --- Summary:
;;; Commentary:
;;https://github.com/chrisdone/elisp-guide
;;https://github.com/abo-abo/lispy#installation-instructions
;; Code:

(current-buffer)

(with-current-buffer "config")

(switch-to-buffer "init.el")
(defvar gil-variable "gilhihi" "Documentation.")

(message "hello %s" gil-variable)

;; region에 대해서 알 수 있는 함수
(defun print-upper-region ()
  "Demo to print the uppercased version of the active region."
  (interactive)
  (when (region-active-p)
    (message "%S" (let ((string (buffer-substring (region-beginning)
                                                  (region-end))))
                    (with-temp-buffer ;;temp buffer를 열어서 넣는다
                      (insert string)
                      (upcase-region (point-min) ;; upper case로 바꾼다
                                     (point-max))
                      (buffer-substring-no-properties (point-min) ;; 다시 이걸 변수에 넣는 작업
                                                      (point-max)))))))

    
(message (save-excursion (beginning-of-line) (looking-at "X")))

(buffer-substring 100 130)
(buffer-substring-no-properties 100 130)
(buffer-string)
(looking-at "l")
		 
(with-temp-buffer (insert "Hello!!")
		  (upcase-region (point-min)(point-max))
		  (message (buffer-substring (point-min)(point-max))))


(defun foo ()
  "Some function which is interactive."
  (interactive)
  (message "funciotn foo"))

(defun bar ()
  "Documentation."
  (interactive)
  (message "gil %s" "hello"))

(bar)

(define-key emacs-lisp-mode-map (kbd "C-c C-f") 'foo)

;; how to define major mode
(define-derived-mode hypertext-mode
   text-mode "Hypertext"
   "Major mode for hypertext.
 \\{hypertext-mode-map}"
   (setq case-fold-search nil))

(define-key hypertext-mode-map
   [down-mouse-3] 'do-hyper-link)


;; how to define minor mode
(defvar elisp-guide-mode-map (make-sparse-keymap))
(define-minor-mode elisp-guide-mode "A simple minor mode example."
  :lighter " sa82trip"
  :keymap elisp-guide-mode-map
  (if (bound-and-true-p elisp-guide-mode)
      (message "Elisp guide activated!")
    (message "Bye!")))
(define-key elisp-guide-mode-map (kbd "C-c C-a") 'elisp-guide-go)
  
  (defun my-indent-region (beg end)
    (interactive "r")
    (let ((marker (make-marker)))
      (set-marker marker (region-end))
      (goto-char (region-beginning))
      (while (< (point) marker)
	(funcall indent-line-function)
	(forward-line 1))))

(s-reverse "ab xyz")

(defun delete-line ()
  (interactive)
  (let ((beg (point)))
    (forward-line 1)
    (delete-region beg (point)))
  )
(defun delete-line2 ()
  (interactive)
  (delete-region (point)
		 (save-excursion
		   (forward-line 1)
		   (forward-char -1)
		   (point)))
  )
(defun buffer/insert-filename()
  "Insert file name of current buffer at current point."
  (interactive)
  (insert (buffer-file-name (current-buffer))))

(info "(elisp) Top")
(info "(elisp)")
(info "(eintr)")
(info "(elisp) Hooks")

(defvar (ddd-aaa (buffer-list))
(defvar gg 0)
(expand-file-name "..")
(mkdir "dummy")
(directory-files ".")
(make-frame)

(length (split-string (getenv "PATH") ":"))

(dolist (e (split-string  (getenv "PATH") ":")) (message (format "%s\n" e)))
exec-path
(getenv "HOME")
(dolist (e process-list) (message (format "%s\n" e)))
(process-list)
(process-send-eof "ielm")
(provide 'basic))
(run-with-timer 5 nil
   (lambda () (message-box "Hello World Emacs")))
(run-with-timer 5 4
   (lambda () (message-box "Hello World Emacs")))
(defun cofee-wait ()
  (interactive)

  (let ((minutes 3))

    (run-with-timer (* 60 minutes)  nil
     (lambda () (message-box "Coffee done"))
     )

    (message "Waiting for the cofee")
    ))

(defun url-at-point ()
  "Document."
  (interactive)
  (browse-url (thing-at-point 'url)))

(defun open-file-at-point ()
  "Document."
  (interactive)
  (find-file (thing-at-point 'filename)))

(provide 'basic)
;;; basic.el

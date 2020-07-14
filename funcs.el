(when (configuration-layer/package-usedp 'mozc)
  (defun hatsusato/enable-mozc-mode ()
    "Enable mozc-mode."
    (interactive)
    (mozc-mode 1))
  (defun hatsusato/disable-mozc-mode ()
    "Disable mozc-mode."
    (interactive)
    (mozc-mode 0))
  (defun hatsusato/toggle-mozc-mode ()
    "Disable mozc-mode."
    (interactive)
    (mozc-mode))
  )

(defun hatsusato/make-plain-fontspec (name)
  (let* ((fontset-name (concat "fontset-" name))
         (speclen 13)
         (specvec (make-vector speclen nil)))
    (aset specvec 0 name)
    (aset specvec (1- speclen) fontset-name)
    (x-compose-font-name specvec)
    ))
(defun hatsusato/register-fontset (name fontsize)
  (let* ((fontset-name (concat "fontset-" name))
         (plain-fontspec (hatsusato/make-plain-fontspec name))
         (mono-font "Ubuntu Mono")
         (mono-fontspec (font-spec :family mono-font :size fontsize))
         (noto-font "Noto Sans CJK JP")
         (noto-fontspec (font-spec :family noto-font)))
    (create-fontset-from-fontset-spec plain-fontspec)
    (set-fontset-font fontset-name 'ascii mono-fontspec nil 'append)
    (set-fontset-font fontset-name 'unicode mono-fontspec nil 'append)
    (set-fontset-font fontset-name 'unicode noto-fontspec nil 'append)
    (add-to-list 'default-frame-alist (cons 'font fontset-name))
    ))
(defconst hatsusato/font-size 16)
(defconst hatsusato/ascii-font "Ubuntu Mono")
(defconst hatsusato/unicode-font "Noto Sans Mono CJK JP")
(defun hatsusato/setup-font (frame)
  (when (display-graphic-p frame)
    (let ((frame-font (frame-parameter frame 'font))
          (ascii (font-spec :family hatsusato/ascii-font :size hatsusato/font-size))
          (unicode (font-spec :family hatsusato/unicode-font)))
      (set-fontset-font frame-font 'unicode ascii nil)
      (set-fontset-font frame-font 'unicode unicode nil 'append)
      (remove-hook 'after-make-frame-functions #'hatsusato/setup-font)
      )))
(defun hatsusato/user-config ()
  (if (display-graphic-p)
      (hatsusato/setup-font (selected-frame))
    (add-hook 'after-make-frame-functions #'hatsusato/setup-font))
  (use-package tex
    :config
    (add-to-list 'TeX-command-list '("Make" "make" TeX-run-command nil t))
    )
  (custom-set-variables
   '(custom-file spacemacs--custom-file)
   '(projectile-indexing-method 'hybrid)
   '(sh-basic-offset 2)
   '(show-trailing-whitespace t)
   '(vc-follow-symlinks t)
   '(web-mode-markup-indent-offset 2)
   ))
(defun hatsusato/message-tail (format &rest args)
  (let ((window (get-buffer-window "*Messages*")))
    (if window
        (with-current-buffer (window-buffer window)
          (set-window-point window (point-max))))))
(advice-add #'dotspacemacs/user-config :after #'hatsusato/user-config)
(advice-add #'message :after #'hatsusato/message-tail)

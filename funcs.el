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
    (set-fontset-font fontset-name 'unicode mono-fontspec nil 'append)
    (set-fontset-font fontset-name 'unicode noto-fontspec nil 'append)
    (add-to-list 'default-frame-alist (cons 'font fontset-name))
    ))
(defun dotspacemacs/user-config ()
  (hatsusato/register-fontset (user-login-name) 16)
  (custom-set-variables
   '(custom-file spacemacs--custom-file)
   '(show-trailing-whitespace t)
   '(vc-follow-symlinks t)
   '(web-mode-markup-indent-offset 2)
   ))

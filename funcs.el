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
(defun hatsusato/setup-font (frame)
  (when (display-graphic-p frame)
    (let ((frame-font (frame-parameter frame 'font))
          (ascii (font-spec :family hatsusato/ascii-font :size hatsusato/font-size))
          (unicode (font-spec :family hatsusato/unicode-font)))
      (set-fontset-font frame-font 'unicode ascii nil)
      (set-fontset-font frame-font 'unicode unicode nil 'append)
      (remove-hook 'after-make-frame-functions #'hatsusato/setup-font))))
(defun hatsusato/message-tail (format &rest args)
  (let ((window (get-buffer-window "*Messages*")))
    (if window
        (with-current-buffer (window-buffer window)
          (set-window-point window (point-max))))))
(defun hatsusato/user-config ()
  (custom-set-variables
   '(custom-file spacemacs--custom-file)
   '(lsp-enable-file-watchers nil)
   '(projectile-indexing-method 'hybrid)
   '(sh-basic-offset 2)
   '(show-trailing-whitespace t)
   '(vc-follow-symlinks t)
   '(web-mode-markup-indent-offset 2)
   )
  (use-package tex
    :defer t
    :config
    (add-to-list 'TeX-command-list '("Make" "make" TeX-run-command nil t))
    )
  (if (display-graphic-p)
      (hatsusato/setup-font (selected-frame))
    (add-hook 'after-make-frame-functions #'hatsusato/setup-font)))

(advice-add #'dotspacemacs/user-config :after #'hatsusato/user-config)
(advice-add #'message :after #'hatsusato/message-tail)

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

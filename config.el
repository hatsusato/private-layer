(defconst hatsusato/font-size 16)
(defconst hatsusato/ascii-font "Ubuntu Mono")
(defconst hatsusato/unicode-font "Noto Sans Mono CJK JP")

(let* ((file ".config.el")
       (dir (if load-file-name (file-name-directory load-file-name)))
       (path (concat dir file)))
  (if (file-readable-p path)
      (load-file path)))

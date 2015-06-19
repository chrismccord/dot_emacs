;; Grateful thanks are given to Brian Marick (@marick) for helping me
;; write these. I got the original idea while reading through
;; http://xahlee.org/emacs/elisp_idioms.html, but couldn't work out
;; the elisp regexes. Brian Marick (@marick) stepped in and helped. He
;; took my tortured and broken camelcase-region and turned it into
;; something that actually worked. I then created
;; camelcase-word-or-region. I then wrote the snakecase versions but I
;; see now that all I did was copy the camelcase defuns over and,
;; meaning to go back and finish them Real Soon Now, forgot all about
;; them. I've had a quick look (2011-02-27) but elisp regexes are
;; still pretty slippery to me, so I have decided to err on the side
;; of "Showing This To Jim Weirich" (beacuse he expressed interest in
;; the camelcase defun) and have just marked the offending code and
;; left it unfixed.
;;
;; Help me, Obi-Wan Weirichobi, you're my only hope!
;; ----------------------------------------------------------------------
;; camelcase-region Given a region of text in snake_case format,
;; changes it to camelCase.

(provide 'change-case)

(defun camelcase-region (start end)
  "Changes region from snake_case to camelCase"
  (interactive "r")
  (save-restriction (narrow-to-region start end)
                    (goto-char (point-min))
                    (while (re-search-forward "_\\(.\\)" nil t)
                      (replace-match (upcase (match-string 1))))))

;; ----------------------------------------------------------------------
;; cadged largely from http://xahlee.org/emacs/elisp_idioms.html:
;;
(defun camelcase ()
  "Changes word or region from snake_case to camelCase"
  (interactive)
  (let (pos1 pos2 bds)
    (if (and transient-mark-mode mark-active)
        (setq pos1 (region-beginning) pos2 (region-end))
      (progn
        (setq bds (bounds-of-thing-at-point 'symbol))
        (setq pos1 (car bds) pos2 (cdr bds))))
    (camelcase-region pos1 pos2)))

;; ----------------------------------------------------------------------
;; snakecase-region
;; Given a region of text in camelCase format, changes it to snake_case.
;;
;; BUG: This is actually just a repeat of camelcase-region!
(defun snakecase-region (start end)
  "Changes region from camelCase to snake_case"
  (interactive "r")
  (save-restriction
    (let ((case-fold-search nil))
      (narrow-to-region start end)
      (goto-char (point-min))
      (while (re-search-forward "\\([a-z]\\)\\([A-Z]\\)" nil t)
        (message (match-string 1))
        (replace-match (concat (match-string 1) "_" (downcase (match-string 2))))
        (goto-char (point-min))))))

;; ----------------------------------------------------------------------
;; Given a region of text in camelCase format, changes it to snake_case.
(defun snakecase ()
  "Changes word or region from camelCase to snake_case"
  (interactive)
  (let (pos1 pos2 bds)
    (if (and transient-mark-mode mark-active)
        (setq pos1 (region-beginning) pos2 (region-end))
      (progn
        (setq bds (bounds-of-thing-at-point 'symbol))
        (setq pos1 (car bds) pos2 (cdr bds))))
    (snakecase-region pos1 pos2)))

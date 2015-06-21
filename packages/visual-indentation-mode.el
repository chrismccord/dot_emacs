;;; visual-indentation-mode.el --- minor mode for visualizing indentation

;; This is free and unencumbered software released into the public domain.

;; Author: Christopher Wellons <mosquitopsu@gmail.com>
;; Version: 1.0

;;; Commentary:

;; This does not operate properly with tabs. Tabs are for losers
;; anyway. :-) Since this is only a proof of concept I don't plan on
;; fixing this.

;; Indentation size can be adjusted by `visual-indentation-width'. I'd
;; like to detect this automatically from the mode (2 for Lisp, 4 for
;; Java, c-basic-offset, etc.) but that problem turns out to be highly
;; non-trivial.

;; The idea came from example code this video:
;;   http://www.infoq.com/presentations/Bootstrapping-Clojure

;;; Code:

(defgroup visual-indentation-mode nil
  "Group for visual-indentation-mode."
  :group 'applications)

(defcustom visual-indentation-width 2
  "Width of indentation -- different than tab-width."
  :group 'visual-indentation-mode
  :type  'integer)

(defface visual-indentation-light-face
  '((((background light)) (:background "#AFAFAF"))
    (((background dark))  (:background "#4F4F4F")))
  "Face for highlighting odd indents."
  :group 'visual-indentation-mode)

(defface visual-indentation-dark-face
  '((((background light)) (:background "#DFDFDF"))
    (((background dark))  (:background "#101010")))
  "Face for highlighting even indents."
  :group 'visual-indentation-mode)

(defun visual-indentation-choose-color (pos)
  "Determine the color for the given buffer position."
  (let ((col (save-excursion (goto-char pos) (current-column))))
    (if (= 0 (mod (/ col visual-indentation-width) 2))
        'visual-indentation-light-face
      'visual-indentation-dark-face)))

(defun visual-indentation-propertize (pos)
  "Color the indentation at POS."
  (with-silent-modifications
    (add-text-properties pos (1+ pos)
                         `(font-lock-face ,(visual-indentation-choose-color pos)
                                          rear-nonsticky t))))

(defun visual-indentation-propertize-region (start end)
  "Color all indentation in the region."
  (save-excursion
    (goto-char start)
    (while (< (point) end)
      (dotimes (i (- (current-indentation) (current-column)))
        (visual-indentation-propertize (+ i (point))))
      (forward-line))))

(defun visual-indentation-unpropertize-region (start end)
  "Remove all indentation coloring from the region."
  (remove-text-properties start end '(font-lock-face nil rear-nonsticky nil)))

;;;###autoload
(define-minor-mode visual-indentation-mode
  "Visualize indentation in the current buffer."
  :lighter "" ; should be obvious enough already
  (if (not visual-indentation-mode)
      (progn
        (jit-lock-unregister 'visual-indentation-propertize-region)
        (visual-indentation-unpropertize-region (point-min) (point-max)))
    (jit-lock-register 'visual-indentation-propertize-region)
    (make-local-variable 'visual-indentation-width)))

(provide 'visual-indentation-mode)

;;; visual-indentation-mode.el ends here

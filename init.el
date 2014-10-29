(require 'package)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("43608d670be741650e9a0f3740d901758073865ddf44cc07c13a0b1abed64545" "da9274e90c88cc562bacdb62893c931842e6fe12ba3e96458a77227d8b648f3a" "b4f9de380b04f8918ed0110f27f0e62950481c464671786faa79ccda7b28dcf2" "340cb4e6bcfff384fc1b6e2768bdb14401dcf003300b8c1e466fa7a2fad2c205" "4dc9626a816366c9f6c82201189e92e34059c9ebb1c27ce240f9a2580a20625c" "79950c6859bb324a674caf674422934c40ffb140dd375eba921dd68171acbe03" "e20eabf94fa0d8c05cd029943d7904b2e10846d03aa2e195a68f1304c4f4c279" "a33d44e062ef5e869579c242c41a9084010c50098d352836f55d50a5c25bd27f" "cfe4fd691dc8468ae6b5c8f8235c658fffa13c2343b5863849582e70a7f3dfe1" "f313fa585099ff575ba7b17542ad1f39bd3e446496f5609b7535910298e14a2d" "df622fb08ae055f3f39794f8abdcb51814f473d17390ec3d7ea94e9020223c84" "82a96ca029311bdde09f1dbbf7fd7e380a06cea8d9b4033e23641ea073c3cc26" "d209c4d0a2600f065e6b64738d80066d70a1d27991b280ea47ac553a43fc97ab" "41f0780399bafd5d9ebb1f9b050a230cfc4ee6302e7af60a707f58eac7b47abf" "0e76fc51f5abf2348bec90373236d80367644963f32b6e1831e2e03684406970" "34448527e1c2ef2f4dbd165ea647de37a60c58855f49f045338132b1249bc1a5" "f511fb4faa19d328b31b4bfc490cdb8c12331f86dd8aa79f49808c11f9345035" "5aaff946a730b997de53c23dfb8860d9af99906d7af48def6c932283126eb3a2" "020e4d086806fac7925ee566d2cb7fe0214731f5174a45dd047e93f6183fd70e" "cdba230959e9bedef7d6d2d6d92c60373bd15025fabe8185b5590d42749c0cf0" "f3836ba4c3e82dce6b14dcf98db05f9f2cab8b64ca3e55a3aa90115d76d6cff6" "7a6dcece3364b84a8cb53ceee51cbbabe13bbdee16949dff0b602e4a96c271e6" "5852f267628b6bb4a59f8d66731d2d11b1f1a97ac1972aa5e8c390de02cea0d1" "5dabd2fc2df4ba0e4d611774e7bb44878b1ef0b2333ae7023be33374dbcd637c" "72668129ec7556fa5a966587b9a9ccb5696b4bf3045d830d8aa315a2853c594f" "bb07a0fbfc539c391ea60eae63081a1fad78ab3c5e1b7b08413c3e95991f4376" "ebbd78180892888499bbd425bc4d24a78e7840990b9b04bd059793a8c90dd696" "bd374697d0efdce502611af3fe2fcdfad5f128590ffa32ff1a22c0d0341f397e" "d5418eb105d5e9913cc0c8b810de44100bc796e8256f4bc6349695b1eb3974b9" "c8bc8c64d3512d651269230bdec0ea56fda873f3ef0ac841d112dfd76db1a381" "40e152bc65f466f5efcd879f1084b41c1a90fd0803040f0a159a578748bddb00" "d07d0063ee930bffab9732cd33479aa8fc3b40b53e5f9ea8b5fe3d192c7de6d8" "29f5424be38f59e723bd27f1d268f3518bcc76c8443c5e7266d5f3a12d610142" "5e7a31adf6943f948b085f853571a99f3178b86f29d0adf28957cfd2145661e4" "5cd5bb0caa4f3c479ea3e32d41503333a80fe0a5d9581ea907fbf60855480e95" "11d56835769f15464fac96fea509e040233993bbd992b71e60b1cab140a6418a" "42ac06835f95bc0a734c21c61aeca4286ddd881793364b4e9bc2e7bb8b6cf848" "5c674d297206a2494eff9bf650a2ffbb8261d5a2ee77563b8a6530525fec5b6d" default)))
 '(dabbrev-abbrev-skip-leading-regexp ":")
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("elpa" . "http://tromey.com/elpa/")
     ("melpa" . "http://melpa.milkbox.net/packages/")
     ("marmalade" . "http://marmalade-repo.org/packages/"))))
 '(projectile-project-root-files
   (quote
    ("rebar.config" "project.clj" "SConstruct" "pom.xml" "build.sbt" "build.gradle" "Gemfile" "requirements.txt" "package.json" "gulpfile.js" "Gruntfile.js" "bower.json" "composer.json" "Cargo.toml" "mix.exs" "README.md"))))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(setq make-backup-files nil)
(menu-bar-mode -1)

(smex-initialize)
; (ido-hacks 1)

(projectile-mode t)

(setq ido-decorations (quote ("\n↪ "     "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))


(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)


;; Parens handling
;; Show and create matching parens automatically
(show-paren-mode t)
(smartparens-global-mode t)
(show-smartparens-global-mode nil)
;; Do not highlight paren area
(setq sp-highlight-pair-overlay nil)
(setq sp-highlight-wrap-overlay nil)
(setq sp-highlight-wrap-tag-overlay nil)
;; Do not use default slight delay
(setq show-paren-delay 0)

;; Autocomplete
;; (require 'auto-complete-config)
;; (ac-config-default)
;; (setq ac-ignore-case nil)
;; (add-to-list 'ac-modes 'enh-ruby-mode)
;; (add-to-list 'ac-modes 'web-mode)
;; (add-to-list 'ac-modes 'elixir-mode)
;; (auto-complete-mode t)
;; ;; Do not autocomplete on RET
;; (define-key ac-completing-map [return] nil)
;; (define-key ac-completing-map "\r" nil)
;; ;; autocomplete within strings
;; (setq ac-disable-faces nil)
;; (custom-set-variables
;;   '(ac-etags-requires 1))

;; (eval-after-load "etags"
;;   '(progn
;;       (ac-etags-setup)))

;; (add-hook 'c-mode-common-hook 'ac-etags-ac-setup)
;; (add-hook 'enh-ruby-mode-hook 'ac-etags-ac-setup)
;; (add-hook 'elixir-mode-hook 'ac-etags-ac-setup)

;;==============================================================================
;; Autocomplete with company-mode
;;==============================================================================
(global-company-mode t)
(setq company-tooltip-limit 12)                      ; bigger popup window
(setq company-idle-delay .1)                         ; decrease delay before autocompletion popup shows
(setq company-echo-delay 0)                          ; remove annoying blinking
(setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing
(setq company-dabbrev-downcase nil)                  ; Do not convert to lowercase
(setq company-selection-wrap-around t)               ; continue from top when reaching bottom
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-inf-ruby))
;; Hack to trigger candidate list on first TAB, then cycle through candiates with TAB
(defvar tip-showing nil)
(eval-after-load 'company
  '(progn
     (define-key company-active-map (kbd "TAB")  (lambda ()
       (interactive)
       (company-complete-common)
       (if tip-showing
         (company-select-next))
     ))
     (define-key company-active-map [tab] 'company-select-next)))

(defun company-pseudo-tooltip-on-explicit-action (command)
  "`company-pseudo-tooltip-frontend', but only on an explicit action."
  (when (company-explicit-action-p)
    (setq tip-showing t)
    (company-pseudo-tooltip-frontend command)))

(defun company-echo-metadata-on-explicit-action-frontend (command)
  "`company-mode' front-end showing the documentation in the echo area."
  (pcase command
    (`post-command (when (company-explicit-action-p)
                     (company-echo-show-when-idle 'company-fetch-metadata)))
    (`hide
      (company-echo-hide)
      (setq tip-showing nil)
     )))

(setq company-frontends '(company-pseudo-tooltip-on-explicit-action company-echo-metadata-on-explicit-action-frontend company-preview-if-just-one-frontend))
;; End TAB cycle hack


;; =============================================================================
;; Evil
;; =============================================================================
(require 'evil)
(evil-mode 1)
; (setq evil-default-cursor t)
(progn (setq evil-default-state 'normal)
       (setq evil-auto-indent t)
       (setq evil-shift-width 2)
       (setq evil-search-wrap t)
       (setq evil-find-skip-newlines t)
       (setq evil-move-cursor-back nil)
       (setq evil-mode-line-format 'before)
       (setq evil-esc-delay 0.001)
       (setq evil-cross-lines t))

(setq evil-overriding-maps nil)
(setq evil-intercept-maps nil)

(define-key evil-normal-state-map (kbd "RET") 'save-buffer)

;; Don't wait for any other keys after escape is pressed.
(setq evil-esc-delay 0)

;; Make HJKL keys work in special buffers
(evil-add-hjkl-bindings magit-branch-manager-mode-map 'emacs
  "K" 'magit-discard-item
  "L" 'magit-key-mode-popup-logging)
(evil-add-hjkl-bindings magit-status-mode-map 'emacs
  "K" 'magit-discard-item
  "l" 'magit-key-mode-popup-logging
  "h" 'magit-toggle-diff-refine-hunk)
(evil-add-hjkl-bindings magit-log-mode-map 'emacs)
(evil-add-hjkl-bindings magit-commit-mode-map 'emacs)
(evil-add-hjkl-bindings occur-mode 'emacs)

(setq evil-want-C-i-jump t)
(setq evil-want-C-u-scroll t)

(global-evil-leader-mode)
(evil-leader/set-leader ",")
(evil-leader/set-key
  "." 'find-tag
  "t" 'projectile-find-file
  "b" 'ido-switch-buffer
  "cc" 'evilnc-comment-or-uncomment-lines
  ; "f" 'helm-projectile
  ; "a" 'projectile-ack
  ; "bl" 'buffer-menu
  ; "bk" 'ido-kill-buffer
  "," 'switch-to-previous-buffer
  ; "b." 'next-buffer
  ; "c"  'flash-crosshairs
  "rr" 'rinari-launch
  "rc" 'rinari-find-controller
  "rm" 'rinari-find-model
  "rh" 'rinari-find-helper
  "rt" 'rinari-find-test
  "rs" 'rinari-find-rspec
  ; "gg" 'git-gutter+:toggle
  ; "gd" 'git-gutter+:popup-diff
  ; "gp" 'git-gutter+:previous-hunk
  ; "gn" 'git-gutter+:next-hunk
  ; "gr" 'git-gutter+:revert-hunk
  "gb" 'mo-git-blame-current
  "gl" 'magit-log
  "gs" 'magit-status
  "w"  'kill-buffer
  "nn" 'neotree-toggle
  "nf" 'neotree-find
  "gk" 'windmove-up
  "gj" 'windmove-down
  "gl" 'windmove-right
  "gh" 'windmove-left
  "vs" 'split-window-right
  "hs" 'split-window-below
  "x" 'smex)

;; =============================================================================
;; Evil Packages
;; =============================================================================
(global-evil-surround-mode 1)

(require 'evil-visualstar)

(defun fix-underscore-word ()
  (modify-syntax-entry ?_ "w"))

(defun buffer-exists (bufname)   (not (eq nil (get-buffer bufname))))
(defun switch-to-previous-buffer ()
  "Switch to previously open buffer.
Repeated invocations toggle between the two most recently open buffers."
  (interactive)
  ;; Don't switch back to the ibuffer!!!
  (if (buffer-exists "*Ibuffer*")  (kill-buffer "*Ibuffer*"))
  (switch-to-buffer (other-buffer (current-buffer) 1)))

;; Make ";" behave like ":" in normal mode
(define-key evil-normal-state-map (kbd ";") 'evil-ex)
(define-key evil-visual-state-map (kbd ";") 'evil-ex)
(define-key evil-motion-state-map (kbd ";") 'evil-ex)

;; Yank whole buffer
(define-key evil-normal-state-map (kbd "gy") (kbd "gg v G y"))

;(setq key-chord-two-keys-delay 0.3)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(key-chord-mode 1)

(define-key evil-normal-state-map "gh" 'windmove-left)
(define-key evil-normal-state-map "gj" 'windmove-down)
(define-key evil-normal-state-map "gk" 'windmove-up)
(define-key evil-normal-state-map "gl" 'windmove-right)
 
(add-hook 'neotree-mode-hook
 (lambda ()
   (define-key evil-normal-state-local-map (kbd "TAB") 'neotree-enter)
   (define-key evil-normal-state-local-map (kbd "SPC") 'neotree-enter)
   (define-key evil-normal-state-local-map (kbd "q") 'neotree-hide)
   (define-key evil-normal-state-local-map (kbd "RET") 'neotree-enter)
	 (define-key evil-normal-state-local-map (kbd "ma") 'neotree-create-node)
	 (define-key evil-normal-state-local-map (kbd "md") 'neotree-delete-node)
	 (define-key evil-normal-state-local-map (kbd "r") 'neotree-refresh)
	 (define-key evil-normal-state-local-map (kbd "mm") 'neotree-rename-node)
))

;; UI
(global-linum-mode t)
(defun linum-format-func (line)
  (let ((w (length (number-to-string (count-lines (point-min) (point-max))))))
     (propertize (format (format "%%%dd " w) line) 'face 'linum)))

(setq linum-format 'linum-format-func)
;; use customized linum-format: add a addition space after the line number                                                                      

;; Remember the cursor position of files when reopening them
(setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)
(require 'saveplace)

;; show the column number in the status bar
(column-number-mode t)

;; Powerline
(require 'powerline)
(powerline-vim-theme)

;; Highlight cursor line
(global-hl-line-mode t)
(set-face-background hl-line-face "gray10")

;; Make lines longer than 80 highlighted
(setq whitespace-line-column 80) ;; limit line length
(setq whitespace-style '(face lines-tail))
(global-whitespace-mode t)

(add-hook 'prog-mode-hook 'whitespace-mode)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; Git Gutter
;;(global-git-gutter+-mode 1)
;; If you enable global minor mode
(require 'git-gutter)
(global-git-gutter-mode t)

;; If you would like to use git-gutter.el and linum-mode
(git-gutter:linum-setup)

(require 'smooth-scrolling)
(setq smooth-scroll-margin 3)

; Auto-indent with the Return key
(define-key global-map (kbd "RET") 'newline-and-indent)

;; Fix cursor
(defun my-send-string-to-terminal (string)
   (unless (display-graphic-p) (send-string-to-terminal string)))

(defun my-evil-terminal-cursor-change ()
   (when (string= (getenv "TERM_PROGRAM") "iTerm.app")
        (add-hook 'evil-insert-state-entry-hook (lambda () (my-send-string-to-terminal "\e]50;CursorShape=1\x7")))
           (add-hook 'evil-insert-state-exit-hook  (lambda () (my-send-string-to-terminal "\e]50;CursorShape=0\x7"))))
     (when (and (getenv "TMUX") (string= (getenv "TERM_PROGRAM") "iTerm.app"))
          (add-hook 'evil-insert-state-entry-hook (lambda () (my-send-string-to-terminal "\ePtmux;\e\e]50;CursorShape=1\x7\e\\")))
              (add-hook 'evil-insert-state-exit-hook  (lambda () (my-send-string-to-terminal "\ePtmux;\e\e]50;CursorShape=0\x7\e\\")))))

  (add-hook 'after-make-frame-functions (lambda (frame) (my-evil-terminal-cursor-change)))
  (my-evil-terminal-cursor-change)


(defun change-major-mode-hook () (modify-syntax-entry ?_ "w"))

; (defun evil-move-point-by-word (dir)
;   "Used internally by evil
;  
; A pure-vim emulation of move-word runs slow, but emacs forward-word
; does not recognize underscores as word boundaries. This method calls
; Emacs native forward-word, and then repeats if it detects it stopped
; on an underscore."
;   (let ((success (forward-word dir))
;         (fn (if (= 1 dir) 'looking-at 'looking-back)))
;  
;     (if (and success (funcall fn "_"))
;         (evil-move-point-by-word dir)
;       success)))
;  
; (defun evil-forward-word (&optional count)
;   "Move by words.
; Moves point COUNT words forward or (- COUNT) words backward if
; COUNT is negative. This function is the same as `forward-word'
; but returns the number of words by which point could *not* be
; moved."
;   (setq count (or count 1))
;   (let* ((dir (if (>= count 0) +1 -1))
;          (count (abs count)))
;     (while (and (> count 0)
;                 (evil-move-point-by-word dir))
;       (setq count (1- count)))
;     count))
;  
; (evil-define-union-move evil-move-word (count)
;   "Move by words."
;   (evil-move-chars "^ \t\r\n[:word:]_" count)
;   (let ((word-separating-categories evil-cjk-word-separating-categories)
;         (word-combining-categories evil-cjk-word-combining-categories))
;     (evil-forward-word count))
;   (evil-move-empty-lines count))



;; =============================================================================
;; Custom Packages
;; =============================================================================

(load "~/.emacs.d/packages/ujelly-theme/ujelly-theme.el")
(load-theme 'ujelly)

(add-to-list 'load-path "~/.emacs.d/packages/pbcopy/")
(require 'pbcopy)
(turn-on-pbcopy)

(add-to-list 'load-path "~/.emacs.d/packages/longlines/")
(require 'longlines)

(add-to-list 'load-path "~/.emacs.d/packages/emacs-elixir/")
(require 'elixir-mode)
(add-to-list 'elixir-mode-hook
  (defun auto-activate-ruby-end-mode-for-elixir-mode ()
    (set (make-variable-buffer-local 'ruby-end-expand-keywords-before-re)
      "\\(?:^\\|\\s-+\\)\\(?:do\\)")
    (set (make-variable-buffer-local 'ruby-end-check-statement-modifiers) nil)
    (ruby-end-mode +1)))

;; Use M-w to copy Emacs buffer selection; and Cmd-V to paste outside of Emacs.
;; Use Cmd-C to copy selection from OSX; and C-y to paste in Emacs

; (defun copy-from-osx ()
;     (shell-command-to-string "pbpaste"))
; 
; (defun paste-to-osx (text &optional push)
;     (let ((process-connection-type nil))
;           (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
; 	          (process-send-string proc text)
; 		        (process-send-eof proc))))
; 
; (setq interprogram-cut-function 'paste-to-osx)
; (setq interprogram-paste-function 'copy-from-osx)


 ;;; esc quits
;; (define-key evil-normal-state-map (kbd "ESC") 'keyboard-quit)
;; (define-key evil-visual-state-map (kbd "ESC") 'keyboard-quit)
;; (define-key minibuffer-local-map (kbd "ESC") 'minibuffer-keyboard-quit)
;; (define-key minibuffer-local-ns-map (kbd "ESC") 'minibuffer-keyboard-quit)
;; (define-key minibuffer-local-completion-map (kbd "ESC") 'minibuffer-keyboard-quit)
;; (define-key minibuffer-local-must-match-map (kbd "ESC") 'minibuffer-keyboard-quit)
;; (define-key minibuffer-local-isearch-map (kbd "ESC") 'minibuffer-keyboard-quit)

;; Enable mouse support
(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)
  (global-set-key [mouse-4] '(lambda ()
                              (interactive)
                              (scroll-down 1)))
  (global-set-key [mouse-5] '(lambda ()
                              (interactive)
                              (scroll-up 1)))
  (defun track-mouse (e))
  (setq mouse-sel-mode t)
)

(defun author-mode ()
  (interactive)
  (linum-mode)
  (writeroom-mode)
  (longlines-mode)
  (flyspell-mode)
  )

;; I want underscores as part of word in all modes 
(modify-syntax-entry (string-to-char "_") "w" (standard-syntax-table))
(modify-syntax-entry (string-to-char "_") "w" text-mode-syntax-table)
(modify-syntax-entry (string-to-char "_") "w" lisp-mode-syntax-table)
(modify-syntax-entry (string-to-char "_") "w" emacs-lisp-mode-syntax-table)
(require 'enh-ruby-mode)
(modify-syntax-entry (string-to-char "_") "w" enh-ruby-mode-syntax-table)
(modify-syntax-entry (string-to-char "_") "w" elixir-mode-syntax-table)


;; Space indentation
(add-hook 'enh-ruby-mode-hook (lambda () (setq evil-shift-width 2)))
(add-hook 'ruby-mode-hook (lambda () (setq evil-shift-width 2)))
(add-hook 'elixir-mode-hook (lambda () (setq evil-shift-width 2)))


(defun my-evil-prepare-word-search (forward symbol)
  "Prepare word search, but do not move yet."
  (interactive (list (prefix-numeric-value current-prefix-arg)
                     evil-symbol-word-search))
  (let ((string (car-safe regexp-search-ring))
        (move (if forward #'forward-char #'backward-char))
        (end (if forward #'eobp #'bobp)))
    (setq isearch-forward forward)
    (setq string (evil-find-thing forward (if symbol 'symbol 'word)))
    (cond
     ((null string)
      (error "No word under point"))
     (t
      (setq string
            (format (if symbol "\\_<%s\\_>" "\\<%s\\>")
                    (regexp-quote string)))))
    (evil-push-search-history string forward)
    (my-evil-search string forward t)))

(defun my-evil-search (string forward &optional regexp-p start)
  "Highlight STRING matches.
If FORWARD is nil, search backward, otherwise forward.
If REGEXP-P is non-nil, STRING is taken to be a regular expression.
START is the position to search from; if unspecified, it is
one more than the current position."
  (when (and (stringp string)
             (not (string= string "")))
    (let* ((orig (point))
           (start (or start
                      (if forward
                          (min (point-max) (1+ orig))
                        orig)))
           (isearch-regexp regexp-p)
           (isearch-forward forward)
           (case-fold-search
            (unless (and search-upper-case
                         (not (isearch-no-upper-case-p string nil)))
              case-fold-search)))
      ;; no text properties, thank you very much
      (set-text-properties 0 (length string) nil string)
      (setq isearch-string string)
      (isearch-update-ring string regexp-p)
      ;; handle opening and closing of invisible area
      (cond
       ((boundp 'isearch-filter-predicates)
        (dolist (pred isearch-filter-predicates)
          (funcall pred (match-beginning 0) (match-end 0))))
       ((boundp 'isearch-filter-predicate)
        (funcall isearch-filter-predicate (match-beginning 0) (match-end 0))))
      (evil-flash-search-pattern string t))))

(define-key evil-motion-state-map "*" 'my-evil-prepare-word-search)
(define-key evil-motion-state-map (kbd "*") 'my-evil-prepare-word-search)

(use-package org)
(use-package pdf-tools)
(use-package
 org-modern
 :config
 (setq
  ;; Edit settings
  org-auto-align-tags nil
  org-tags-column 0
  org-catch-invisible-edits 'show-and-error
  org-special-ctrl-a/e t
  org-insert-heading-respect-content t

  ;; Org styling, hide markup etc.
  org-hide-emphasis-markers t
  org-pretty-entities t
  org-ellipsis "…"

  ;; Agenda styling
  org-agenda-tags-column 0
  org-agenda-block-separator ?─
  org-agenda-time-grid
  '((daily today require-timed)
    (800 1000 1200 1400 1600 1800 2000)
    " ┄┄┄┄┄ "
    "┄┄┄┄┄┄┄┄┄┄┄┄┄┄┄")
  org-agenda-current-time-string "⭠ now ─────────────────────────────────────────────────"))

(setq
 org-startup-indented t
 org-pretty-entities t
 org-hide-emphasis-markers t
 org-startup-with-inline-images t
 org-image-actual-width '(300))

(font-lock-add-keywords
 'org-mode
 '(("^ *\\([-]\\) " (0 (prog1 ()))
    (compose-region (match-beginning 1) (match-end 1) "•"))))


(use-package company-posframe :config (company-posframe-mode 1))

(use-package
 mixed-pitch
 :hook (text-mode . mixed-pitch-mode)
 :config
 (set-face-attribute 'default nil
                     :font "JetBrainsMono Nerd Font"
                     :height 170)
 (set-face-attribute 'fixed-pitch nil
                     :font "JetBrainsMono Nerd Font"))

(custom-theme-set-faces 'user
                        '(org-block ((t (:inherit fixed-pitch))))
                        '(org-code
                          ((t (:inherit (shadow fixed-pitch)))))
                        '(org-document-info
                          ((t (:foreground "dark orange"))))
                        '(org-document-info-keyword
                          ((t (:inherit (shadow fixed-pitch)))))
                        '(org-indent
                          ((t (:inherit (org-hide fixed-pitch)))))
                        '(org-link
                          ((t
                            (:foreground "royal blue" :underline t))))
                        '(org-meta-line
                          ((t
                            (:inherit
                             (font-lock-comment-face fixed-pitch)))))
                        '(org-property-value
                          ((t (:inherit fixed-pitch))) t)
                        '(org-special-keyword
                          ((t
                            (:inherit
                             (font-lock-comment-face fixed-pitch)))))
                        '(org-table
                          ((t
                            (:inherit
                             fixed-pitch
                             :foreground "#83a598"))))
                        '(org-tag
                          ((t
                            (:inherit
                             (shadow fixed-pitch)
                             :weight bold
                             :height 0.8))))
                        '(org-verbatim
                          ((t (:inherit (shadow fixed-pitch))))))

(use-package evil-org)
(evil-org-mode)

(use-package smartparens)
(smartparens-global-mode)

(setq org-latex-default-packages-alist
      '(("" "graphicx" t)
        ("" "grffile" t)
        ("" "longtable" nil)
        ("" "wrapfig" nil)
        ("" "rotating" nil)
        ("normalem" "ulem" t)
        ("" "amsmath" t)
        ("" "textcomp" t)
        ("" "amssymb" t)
        ("" "capt-of" nil)
        ("" "hyperref" nil)))
(use-package org-appear
  :hook (org-mode-hook . org-modern-mode))
(org-appear-mode)
(add-hook 'org-mode-hook 'variable-pitch-mode)

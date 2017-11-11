;; The small snippet of code I wrote for starting the talk. The original idea
;; was performed using several .el files by Magnar Sveen at WebRebels.

(defun gul-start-presentation()
  (interactive)
  (org-next-visible-heading -1)
  (org-narrow-to-element))

(defun gul-next-slide()
  (interactive)
  (widen)
  (org-next-visible-heading 1)
  (org-narrow-to-subtree))

(defun gul-previous-slide()
  (interactive)
  (widen)
  (org-next-visible-heading -1)
  (org-narrow-to-element))

(defun gul-exit-presentation()
  (interactive)
  (widen))

;; TODO: find saner keybindings
(global-set-key (kbd "C-c n") 'gul-next-slide)
(global-set-key (kbd "C-c j") 'gul-previous-slide)
(global-set-key (kbd "C-c s") 'gul-start-presentation)
(global-set-key (kbd "C-c e") 'gul-exit-presentation)

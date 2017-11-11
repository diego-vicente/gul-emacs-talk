;; The small snippet of code I wrote for starting the talk. The original idea
;; was performed using several .el files by Magnar Sveen at WebRebels.

(defun gul-get-heading-start (offset)

  (org-next-visible-heading offset)
  (point))

(defun gul-narrow-to-slide()
  (let ((end-slide (gul-get-heading-start 1))
		(start-slide (gul-get-heading-start -1)))
  (narrow-to-region start-slide end-slide)))

(defun gul-move-slide(offset)
  (interactive)
  (widen)
  (org-next-visible-heading offset)
  (gul-narrow-to-slide))

(defun gul-next-slide()
  (interactive)
  (gul-move-slide 1))

(defun gul-previous-slide()
  (interactive)
  (gul-move-slide -1))

(defun gul-exit-presentation()
  (interactive)
  (widen))

;; TODO: find saner keybindings
(global-set-key (kbd "C-c n") 'gul-next-slide)
(global-set-key (kbd "C-c j") 'gul-previous-slide)
(global-set-key (kbd "C-c s") 'gul-start-presentation)
(global-set-key (kbd "C-c e") 'gul-exit-presentation)

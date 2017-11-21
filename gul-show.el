;; Author: Diego Vicente <mail@diego.codes>
;; Version: 0.1

;; The small snippet of code I wrote for starting the talk. The original idea
;; was performed using several .el files by Magnar Sveen at WebRebels. To
;; include the key-bindings defined at the end of the file, evaluate this
;; buffer.

(defun gul-get-heading-start (offset)
  "Get the position of an org heading."
  (org-next-visible-heading offset)
  (point))

(defun gul-narrow-to-slide()
  "Narrow the buffer to a certain slide."
  (let ((end-slide (gul-get-heading-start 1))
		(start-slide (gul-get-heading-start -1)))
  (narrow-to-region start-slide end-slide)))

(defun gul-move-slide(offset)
  "Move the narrowed slide depending on offset."
  (widen)
  (org-next-visible-heading offset)
  (gul-narrow-to-slide))

(defun gul-next-slide()
  "Move to next slide."
  (interactive)
  (gul-move-slide 1))

(defun gul-previous-slide()
  "Move to previous slide."
  (interactive)
  (gul-move-slide -1))

(global-set-key (kbd "C-<right>") 'gul-next-slide)
(global-set-key (kbd "C-<left>") 'gul-previous-slide)

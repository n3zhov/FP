;4.13

; Returns string copy
(defun copy-string (str)
        (let* ((n (length str))
        (res (make-sequence 'string n :initial-element #\.)))
        (loop for i from 0 to (- n 1)
                        do (setf (aref res i) (aref str i)))
        res))

(defun whitespace-char-p (char)
  (member char '(#\Space #\Tab #\Newline)))

(defun word-list (stringArg)
  (let* ((str (copy-string stringArg)))
  ;; Разбить строки на слова, разделённые знаками whitespace
  ;; A la (split-seq-if #'whitespace-char-p string)
  (loop with len = (length str)
        for left = 0 then (1+ right)
        for right = (or (position-if #'whitespace-char-p str
                                     :start left)
                        len)
        unless (= right left)	; из всех слов исключить первый символ
          collect (subseq str (+ left 1) right)
        while (< right len))))

(defun trim-first-char (stringArg)
  (let* (
          (words (word-list stringArg))
          (res (make-sequence 'string 0)))
  (loop for i from 0 to (- (length words) 2)
        do (if (< 0 (length(elt words i))) 
                (setq res (concatenate 'string res (elt words i) (string #\Space)))))
  (if (< 0 (length words)) 
      (setq res (concatenate 'string res (elt words (- (length words) 1)))))
  res
  ))
; 1.29

(defun funcHelper (y1 y2 y3 n res)
  (if (= n res)
        (values y1 y2 y3)
        (funcHelper (* y1 (+ y2 2) (+ y3 3)) y1 y2 (+ n 1) res)))

(defun func (n)
  (if (< n 3)
        1
        (multiple-value-bind (y1 y2 y3) (funcHelper 1 1 1 3 n)
         (* y1 (+ y2 2) (+ y3 3)))))
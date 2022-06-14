; 3.20

; Returns matrix copy
(defun copy-matrix (a)
        (let* ((n (array-dimension a 0)) (m (array-dimension a 1))
        (res (make-array (list n m) :initial-element 0.0)))
        (loop for i from 0 to (- n 1)
                do (loop for j from 0 to (- m 1)
                        do (setf (aref res i j) (aref a i j))))
        res))

(defun swap-matrix (matr)
        (let* (
        (m1 (array-dimension matr 0))
        (m2 (array-dimension matr 1))
        (a (copy-matrix matr)))
        (if (= (mod m1 2) 1) 
                (- m1 1))
        (loop for i from 0 to (- (/ m1 2) 1)
                do(loop for j from 0 to (- m2 1)
                        do (rotatef (aref a i j) (aref a (- (- m1 1) i) j))))
        a))

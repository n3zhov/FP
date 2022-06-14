;2.15

(defun count-real (num x)
  (cond ((null x) 0)
        ((atom x) (if (= x num) 1 0))
        (t (+ (count-real num (first x))
              (count-real num (rest x))))))

#|
(defun binary-list (n &optional acc)
  (cond ((zerop n) (or acc (list 0)))
        ((plusp n)
         (binary-list (ash n -1) (cons (logand 1 n) acc)))
        (t (error "~S: non-negative argument required, got ~s" 'binary-list n))))

(defun list-to-string (lst)
    (format nil "~{~A~}" lst))
	
(defun checkreverse (n)
	(setq f (equal n (reverse n))))
	
(print (binary-list 300))
(setq result (list-to-string (binary-list 300)))
(print result)
(checkreverse result)
(print f) |#

(defun int-to-list (int)
  (assert (>= int 0) nil "Argument must be non-negative")
  (if (= int 0) (list 0)
      (loop with result = nil
         while (> int 0) do
           (multiple-value-bind (divisor remainder)
               (floor int 10)
             (push remainder result)
             (setf int divisor))
         finally (return result))))
		 
(setq result (int-to-list 300))
(print result)
(print (last result))

(defun add-1 (list)
  (mapcar #'1+ list))
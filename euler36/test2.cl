 (print (mapcar #'+ '(1 2 3) '(4 5 6)))
 (print (map 'list #' (lambda (x) (+ x 1)) '(1 2 3 4)))
 
 (print (map 'list #' (lambda (x) (+ x 1)) '(1 2 3 4)))
 
 (print (mapcar (lambda (x) (* x 2)) '(1 2) ))
 
 (print (remove-if (lambda (x) (> x 2)) '(1 3 4)))
 
 (print (remove-if (lambda (x) (EQUAL  0 (MOD x 2))) '(1 2 3 4 5)))
 
 #|
 
 (defun binary-list (n &optional acc)
  (cond ((zerop n) (or acc (list 0)))
        ((plusp n)
         (binary-list (ash n -1) (cons (logand 1 n) acc)))
        (t (error "~S: non-negative argument required, got ~s" 'binary-list n))))
		
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
		
(setq testliste (binary-list 300))

(setq result (int-to-list 300))
(print result)
(print (last result))
|#
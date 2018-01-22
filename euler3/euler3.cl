; https://www.geeksforgeeks.org/print-all-prime-factors-of-a-given-number/
(defun prob3 (n) 
    (setq primes (make-array 5 :fill-pointer 0 :adjustable t))
   
    (loop while(= 0 (mod n 2)) do 
	    (vector-push 2 primes)  
	     (setq n (/ n 2))
	)
	
	(setq i 3)
	
	(loop while(< i (sqrt n)) do 
	    (loop while(= 0 (mod n i)) do
		     (vector-push i primes) 
	          (setq n (/ n i)) 
			  )
        (setq i (+ i 2))			  
	)
	
	(if (> n 2)
        (vector-push n primes) )
  )	

(setq n 600851475143)
;(setq n 13195)
(prob3 n)
(print (reduce #'max primes) )

;(print sum) 

#| 
However, even a vector with a fill pointer isn't completely resizable. 
The vector *x* can hold at most five elements. To make an arbitrarily 
resizable vector, you need to pass MAKE-ARRAY another keyword argument: 
:adjustable.

(make-array 5 :fill-pointer 0 :adjustable t) ==> #()

add element to end of list (vector-push 1 a)
|#
(defun prob1 (n) 
   (setq sum 0)
   (setq a 0)
   (loop     
   (when (= (MOD a 3) 0) (setq sum (+ sum a)))
   (when (= (MOD a 5) 0) (setq sum (+ sum a)))
   (setq a (+ a 1))   
   (when (= a n) (return sum))  
    )
)	

(prob1 1000)
(print sum) 


(defun fib(n)
 
  (cond
    
    ((eq n 1) 0)
    ((eq n 2) 1)
    ((+ (fib (- n 1)) (fib (- n 2))))))


(defun prob2 (n) 
   (setq sum 0)
   (setq fibnumber 0)
   (setq i 1)
   (loop while(< fibnumber n) do  
   
   (setq fibnumber (fib i) )
   
   (when (= (MOD fibnumber 2) 0) (setq sum (+ sum fibnumber)))
   
   (setq i (+ i 1))   
     
    )
   
)	

(setq end 4000000)
(prob2 end)
(print sum) 



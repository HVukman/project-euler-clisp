;
#|
 Double-base palindromes
Problem 36

The decimal number, 585 = 10010010012 (binary), is palindromic in both bases.

Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.

(Please note that the palindromic number, in either base, may not include leading zeros.)


; int to binary return list
; Plan

1. Liste von 1 bis 100000
2. aussortieren wenn letze Ziffer null ist
3. dann neue Liste mit Binärdarstellungen
4. wenn beide Palindrom sind -> addieren auf Summe
5. Summe print

|#

;;converts binary list to decimal
(defun bin-list-to-dec (lst)
  (if (bin-list-p lst)
    (reduce (lambda (x y) (+ (* x 2) y)) lst)
    nil))
	

;;checks if the list's elements are only 0's and 1's
(defun bin-list-p (lst)
  (if (and (listp lst) (not (null lst)))
    (every #'(lambda (x) (or (zerop x) (onep x) )) lst)
    nil))
	
;; checks if the argument is 1
(defun onep (x)
  (= x 1))
	
; makes int n to binary list (1 0 0 0) f.e.
(defun binary-list (n &optional acc)
  (cond ((zerop n) (or acc (list 0)))
        ((plusp n)
         (binary-list (ash n -1) (cons (logand 1 n) acc)))
        (t (error "~S: non-negative argument required, got ~s" 'binary-list n))))

	
; check for palindrome
(defun checkreverse (n)
	(setq f (equal n (reverse n))))
	
; Integer number to list	
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
	
; Range function from 1 to 100000	
; (range ende :min 1 :step 1)
(defun range (max &key (min 0) (step 1))
   (loop for n from min below max by step
      collect n))

; ENDPOINT
(setq ende (EXPT 10 6))

; 1. Liste von 1 bis 100000
(setq liste_dezimal (range ende :min 1 :step 1))
; (print liste)

;2. Aussortieren
; wenn durch 10 teilbar
(setq liste_dezimal (remove-if (lambda (x) (EQUAL  0 (MOD x 10))) liste_dezimal))

; wenn palindrom 
(setq liste_dezimal (remove-if  ( lambda (x) (EQUAL NIL (checkreverse (int-to-list x)))) liste_dezimal))

;3. dann neue Liste mit Binärdarstellungen
(setq liste_binaer (map 'list #' (lambda (x) (binary-list x)) liste_dezimal))

; check for palindrom binaer
(setq liste_binaer (remove-if  ( lambda (x) (EQUAL '(0) (LAST x) )) liste_binaer))
(setq liste_binaer (remove-if  ( lambda (x) (EQUAL NIL (checkreverse  x) )) liste_binaer))

; convert back to decimals
; converts binary list to decimal
(setq liste_dezimal (map 'list #' (lambda (x) (bin-list-to-dec x)) liste_binaer))

;4. wenn beide Palindrom sind -> addieren auf Summe
(setq summe (reduce '+ liste_dezimal))
(print summe)


  
 


#lang racket

;;; Student Name: Annabel Consilvio
;;;
;;; Check one:
;;; [ ] I completed this assignment without assistance or external resources.
;;; [ ] I completed this assignment with assistance from ___
;;;     and/or using these external resources: ___

;;; 1.  Create a calculator that takes one argument: a list that represents an expression.



(define (get-nth lst num)
	;if n=0 returnt the first of list
	(if (= num 0) (first lst)
		;else return the n-1th element of the list
		(get-nth (rest lst) (- num 1))
	)
)

(define (calculate x)
	(if (number? x)
		x
		(if (eq? (first x) 'ADD)
	  		(+ (calculate (get-nth x 1)) (calculate (get-nth x 2)))
	  		(if (eq? (first x) 'SUB)
	  			(- (calculate (get-nth x 1)) (calculate (get-nth x 2)))
				(if (eq? (first x) 'MUL)
	  				(* (calculate (get-nth x 1)) (calculate (get-nth x 2)))
	  		  		(if (eq? (first x) 'DIV)
	  				(/ (calculate (get-nth x 1)) (calculate (get-nth x 2)))
	  					(if (eq? (first x) 'GT)
	  						(> (calculate (get-nth x 1)) (calculate (get-nth x 2)))
	  						(if (eq? (first x) 'LT)
	  						(< (calculate (get-nth x 1)) (calculate (get-nth x 2)))
	  							(if (eq? (first x) 'GE)
	  							(>= (calculate (get-nth x 1)) (calculate (get-nth x 2)))
	  								(if (eq? (first x) 'LE)
	  								(<= (calculate (get-nth x 1)) (calculate (get-nth x 2)))
	  									(if (eq? (first x) 'EQ)
	  									(= (calculate (get-nth x 1)) (calculate (get-nth x 2)))
	  										(if (eq? (first x) 'NEQ)
	  										(not (= (calculate (get-nth x 1)) (calculate (get-nth x 2))))
		  										(if (eq? (first x) 'ANND)
		  										(and (calculate (get-nth x 1)) (calculate (get-nth x 2)))
			  										(if (eq? (first x) 'ORR)
			  										(or (calculate (get-nth x 1)) (calculate (get-nth x 2)))
				  										(if (eq? (first x) 'NOTT)
				  										(not (calculate (get-nth x 1)))
				  										'YO
				  										)
				  									)
			  									)
	  		  								)
	  		  							)
	  		  						)
	  		  					)
	  		  				)
	  		  			)	
	  		  		)
	  			) 
		  	)
		)
	)
)

(calculate '(ADD 3 4)) ;; --> 7
(calculate '(SUB 4 2)) ;; --> 2
(calculate '(MUL 4 4)) ;; --> 16
(calculate '(DIV 4 4)) ;; --> 1

;;; 2. Expand the calculator's operation to allow for arguments that are themselves well-formed arithmetic expressions.

(calculate '(ADD 3 (MUL 4 5))) ;; --> 23   ;; what is the equivalent construction using list?
(calculate '(SUB (ADD 3 4) (MUL 5 6))) ;; --> -23

;;; 3. Add comparators returning booleans (*e.g.*, greater than, less than, …).
;; Note that each of these takes numeric arguments (or expressions that evaluate to produce numeric values),
;; but returns a boolean.  We suggest operators `GT`, `LT`, `GE`, `LE`, `EQ`, `NEQ`.

	(calculate '(GT (ADD 3 4) (MUL 5 6))) ;; --> #f
	(calculate '(LE (ADD 3 (MUL 4 5)) (SUB 0 (SUB (ADD 3 4) (MUL 5 6))))) ;; --> #t

;;; 4. Add boolean operations ANND, ORR, NOTT

(calculate '(ANND (GT (ADD 3 4) (MUL 5 6)) (LE (ADD 3 (MUL 4 5)) (SUB 0 (SUB (ADD 3 4) (MUL 5 6)))))) ;; --> #f
(calculate '(ORR (GT (ADD 3 4) (MUL 5 6)) (LE (ADD 3 (MUL 4 5)) (SUB 0 (SUB (ADD 3 4) (MUL 5 6)))))) ;; --> #T
(calculate '(NOTT (GT (ADD 3 4) (MUL 5 6)))) ;; --> #t

;;; 5. Add IPH

; (calculate '(IPH (GT (ADD 3 4) 7) (ADD 1 2) (ADD 1 3))) ;; -> 4

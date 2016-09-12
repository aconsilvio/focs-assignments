#lang racket

(define (fact n)
  (if (= n 0) 1 (* (fact (- n 1)) n)))

(define (fact2 n)  ;;tail implementation
	(fact2-helper n 1))

(define (fact2-helper num accu)
	(if (= num 0) 
		accu
		(fact2-helper (- num 1) (* accu num))
	)
)

(display (fact 3)) (newline) ;; -> 6
(display (fact2 3)) (newline) ;; -> 6

(define (my-filter op lst)
	(if (empty? lst)
		lst
		(let ([filt-rest (my-filter op (rest lst))])
			(if (op (first lst))
				(cons (first lst) filt-rest)
				filt-rest
			)
		)
	)
)

(display (my-filter even? '(12 3 4 5 6 17 23 12))) (newline)

(define (my-map op lst)
	(if (empty? lst)
		lst
		(let ([filt-rest (my-map op (rest lst))])
				(cons (op (first lst)) filt-rest)
		)
	)
)

(define (double x)
	(* 2 x))

(display (my-map double '(2 3 4 5) ))

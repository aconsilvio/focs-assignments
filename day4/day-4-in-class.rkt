;;;;;;;;;;
;;; Day 4 in class work

#lang racket


;;counting length of list
(define (list-length lst)
	(list-helper lst 0)
)

(define (list-helper lst accu)
	(if (empty? lst)
		accu
		(list-helper (rest lst) (+ accu 1))
	)
)

(display (list-length '()))(newline)
(display (list-length '(1 2 (3))))(newline)



;;counting number of evens in a lst
(define (count-evens lst)
	(evens-helper lst 0)
)


(define (evens-helper lst accu)
	(if (empty? lst)
		accu
		(if (even? (first lst))
			(evens-helper (rest lst) (+ accu 1))
			(evens-helper (rest lst) accu)
		)
	)
)

(display (count-evens '()))(newline)
(display (count-evens '(1 2 3)))(newline)
(display (count-evens '(1 2 3 5 4 2)))(newline)

(define (list-square lst)
	(if (empty? lst)
		
	)
)

(define (square-helper lst accu)
	(if (empty? lst)
		accu
		(square-helper (rest lst) ())
	)
)

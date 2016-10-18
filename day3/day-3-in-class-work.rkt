;;;;;;;;;;
;;; Day 3 in class work

#lang racket

;;0. Factorial
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


;; 1. my filter
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


;;2. my map
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

(display (my-map double '(2 3 4 5) ))(newline)


;;;;;;;;;;;
;; 3.  While we're reimplementing built-ins, implement my-append (just like built in append)
;;     It takes two lists and returns a list containing all of the elements of the originals, in order.
;;     Note that it is purely functional, i.e., it doesn't MODIFY either of the lists that it is passed.

;; (append '(1 2 3) '(4 5 6)) --> '(1 2 3 4 5 6)

;; You might want to draw out the box and pointer structures for the original two lists
;; as well as for the new list.  Confirm with a member of the instructional staff....

; (define (my-append lst1 lst2)  ;; we tried this way but the list came out backward so we tried it without an accumulator
; 	(append-helper lst1 lst2 '()))

; (define (append-helper l1 l2 accu)
; 	(if (empty? l1)
; 		(if (empty? l2)
; 			accu
; 			(append-helper l1 (rest l2) (cons (first l2) accu))
; 		)
; 		(append-helper (rest l1) l2 (cons (first l1) accu))
; 	)
; )

(define (my-append l1 l2)
	(if (empty? l1)
		(if (empty? l2)
			'()
			(cons (first l2) (my-append l1 (rest l2)))
			)
		(cons (first l1) (my-append (rest l1) l2))
	)
)
(display (my-append '(1 2 3) '(4 5 6))) (newline);; --> '(1 2 3 4 5 6)


;;;;;;;;;;;
;; 4.  zip takes two lists, and returns a list of elements of size two, until one of the lists runs out.


;; Implement `zip`.
(define (my-zip l1 l2)
	(if (or (empty? l1) (empty? l2))
		'()
		(cons (cons (first l1) (cons (first l2) '())) (my-zip (rest l1) (rest l2)))
	)
)


(my-zip '(1 2 3) '(4 5 6)) ;; --> '((1 4) (2 5) (3 6))
(my-zip '(1 2 3) '(a b c d e f g)) ;; --> '((1 a) (2 b) (3 c))


;;;;;;;;;;;;
;; 5.  Last built-in (for now):  (my-)reverse.
;;     Takes a list, returns a new list with the elements reversed.

(define (my-reverse lst)
	(if (empty? lst)
		lst
		(my-append (my-reverse (rest lst)) (list (first lst)))
	)
)


(my-reverse '(1 2 3)) ;;--> '(3 2 1)



;;;;;;;;;;;;
;; More puzzles:
;;
;;  - (count elt lst) returns the number of times that elt appears in lst
;;  - (remove-dups lst) returns a new list that contains the elements of lst but without repeats
;;       (remove-dups '(1 2 3 1 4 5 2 4 6)) --> '(1 2 3 4 5 6)
;;  - reverse reverses a list, but doesn't reverse sublists in a tree.  (Try it and see.)
;;    Write deep-reverse, which reverses all sublists as well.
;;  - Which of these can you implement using tail recursion?

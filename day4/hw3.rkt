#lang racket

;;; Student Name: Annabel Consilvio
;;; Check one:
;;; [ ] I completed this assignment without assistance or external resources.
;;; [x] I completed this assignment with Bill and David (we worked in parallel, and helped each other debug)
;;;     and/or using these external resources racket documentation

;;;;;;;;;;;
;; 1. assq

;; `assq` is a function that takes a key and an association list.
;;
;; It returns the corresponding key/value pair from the list
;; (*i.e.*, the pair whose key is *eq?* to the one it is given).
;;
;; If the key is not found in the list, `assq` returns `#f`.
(define operator-list
  (list (list 'ADD +)
        (list 'SUB -)
        (list 'MUL *)
        (list 'DIV /)
        (list 'GT >)
        (list 'LT <)
        (list 'GE >=)
        (list 'LE <=)
        (list 'EQ =)
        (list 'NEQ (lambda (x y) (not (= x y))))
        (list 'ANND (lambda (x y) (and x y)))
        (list 'ORR (lambda (x y) (or x y)))
        (list 'NOTT not)))


(define (assq key lst)
	(if (empty? lst)
		#f
		(if (eq? (first (first lst)) key)
			(first lst)
			(assq key (rest lst))
		)
	)
)

(display (assq 3 '((5 6) (1 2) (3 4) (6 7))))(newline)
;;;;;;;;;;;
;; 2. lookup-list

;; Add the ability to look up symbols to your evaluator.
;;
;; Add the `lookup-list` argument to your hw2 evaluator (or ours, from the solution set).
;; `(evaluate 'foo lookup-list)` should return whatever `'foo` is associated with in `lookup-list`.


; (display (lookup-list 3 '((5 6) (1 2) (3 4) (6 7))))(newline)
(define (evaluate key lst)
	(if (empty? lst)
		#f
		(if (eq? (first (first lst)) key)
			(second (first lst))
			(evaluate key (rest lst))
		)
	)
)

(evaluate 'SUB operator-list)

(define (calculate x lookup-list)
	(if (number? x)
		x
		((evaluate (first x) operator-list) (second x) (third x))
	)
)

(calculate '(LT 5 4) operator-list)
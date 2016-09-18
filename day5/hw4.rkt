#lang racket

;;; Student Name: Frankly Olin [change to your name]
;;;
;;; Check one:
;;; [ ] I completed this assignment without assistance or external resources.
;;; [ ] I completed this assignment with assistance from ___
;;;     and/or using these external resources: ___

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
        (list 'NOTT not)
  	)
)


(define (run-repl)
  (display "welcome to my repl.  type some scheme-ish")
  (repl operator-list))

(define (repl env)
  (display "> ")
  (display env)
  (display (calculate (read) env))
  (newline)
  (repl env)
)


(define (evaluate key lst)
	(if (empty? lst)
		#f
		(if (eq? (first (first lst)) key)
			(second (first lst))
			(evaluate key (rest lst))
		)
	)
)

(define (define? lst)
	(if (list? lst)
		(if (eq? (first lst) 'DEFINE)
			#t
			#f)
		#f
	)
)

(define (calculate x env)		
	(if (define? x)
		(repl (append env (list (list (second x) (third x)))))
		(if (number? x)
			x
			(if (symbol? x)
				(evaluate x env)
				((evaluate (first x) env) (calculate (second x) env) (calculate (third x) env))
			)
		)
	)
)

(run-repl)
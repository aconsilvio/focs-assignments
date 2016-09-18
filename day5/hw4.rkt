#lang racket

;;; Student Name: Annabel Consilvio
;;; Check one:
;;; [ ] I completed this assignment without assistance or external resources.
;;; [x] I completed this assignment with assistance from David and Sophie.

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
  ; (display env)
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

(define (lookup? lst word)
	(if (list? lst)
		(if (eq? (first lst) word)
			#t
			#f)
		#f
	)
)

; (define (apply-lam )

; )

(define (calculate x env)		
	(if (lookup? x 'DEFINE)
		(repl (append env (list (list (second x) (third x)))))
		(if (lookup? x 'LAMBDA)
			(list 'lambda (rest x) env)
			(if (number? x)
				x
				(if (symbol? x)
					(evaluate x env)
					((evaluate (first x) env) (calculate (second x) env) (calculate (third x) env))
				)
			)
		)
	)
)

(define (my-zip l1 l2)
	(if (or (empty? l1) (empty? l2))
		'()
		(cons (cons (first l1) (cons (first l2) '())) (my-zip (rest l1) (rest l2)))
	)
)


(run-repl)
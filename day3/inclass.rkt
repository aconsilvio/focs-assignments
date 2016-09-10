#lang racket


(define (tree-add1 tree)
	(if (empty? tree) tree 
		(if (number? (first tree)) 
			(cons (+ (first tree) 1) (tree-add1 (rest tree)))
		(cons (tree-add1 (first tree)) (tree-add1 (rest tree)))
		)
	)
)


(display (tree-add1 '(3 (1 4)))) (newline) ;; 


(define (tree-helper tree curr_depth)
	(if (number? tree) curr_depth
		(if (empty? tree) curr_depth 
			(let ([n1 (tree-helper (first tree) (+ curr_depth 1))])
				(let ([n2 (tree-helper (rest tree) curr_depth)])
					(max n1 n2)
				)
			)
		)
	)
)

(define (tree-max-depth tree)
	(tree-helper tree 0))


(display (tree-max-depth '(3 (1 (4 1 (43 33))) (5 (9 2))))) (newline) ;; 

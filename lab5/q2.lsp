(println "Lab 5: task 2")
; Вставляет тире после каждого слога
(define (inserter lst lst2)
	(cond
		((null? lst) 0)
		((null? (rest lst)) (cons (first lst)) )
		((member (first lst) lst2)
			(cons (first lst) (cons '- (inserter (rest lst) lst2)))
		)
		(true (cons (first lst) (inserter (rest lst) lst2) ))
))

; Пробегает по всем словам и выполняет вставку тире.
(define (separator lst)
	(map '(lambda (a)
		(map '(lambda (word)
			(if (null? word) 0
				(read-expr (join (map string
					(inserter (map read-expr (explode (string word)))
						'(у е ы а о э я и ю ё))
				)))
			)) a
		)) lst
))

(print (separator '( (абракадабра) (слово))))
(exit 0)

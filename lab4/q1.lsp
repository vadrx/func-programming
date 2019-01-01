(print "Lab 4: task 1")
; Вычисление факториала методом нисходящей рекурсии
; LAMBDA
(defun fact_lam(num)
((lambda (n)
	(if (= n 0) 1 
		(* n (fact_lam (- n 1))))
	)
	num
))
; LET
(defun fact_let(num)
(let ((n num))
	(if (= n 0) 1
		(* n (fact_let (- n 1)))
	)
))
(print (fact_lam 4))
(print (fact_let 4))

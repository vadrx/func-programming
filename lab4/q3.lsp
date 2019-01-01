(print "Lab 4: task 3")
(defun sum_lam (lst)
((lambda (lst)
	(if (null lst) 0
		(if (atom (car lst))
			(if (numberp (car lst))
				(+ (car lst)(sum_lam (cdr lst)))
				(+ 0 (sum_lam (cdr lst))))
			(+ (sum_lam (car lst)) (sum_lam (cdr lst)))
		))
	) lst
))


(defun sum_let (lst_)
(let ((lst lst_))
	(if (null lst) 0
		(if (atom (car lst))
			(if (numberp (car lst))
				(+ (car lst)(sum_let (cdr lst)))
				(+ 0 (sum_let (cdr lst))))
			(+ (sum_let (car lst)) (sum_let (cdr lst)))
		))
	) 
)
(print (sum_lam '(1 ((2 3) 4) 5 6)))
(print (sum_let '(1 ((2 3) 4) 5 6)))

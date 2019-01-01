(defun sum_ (list)
  (if (null list) 0
    ; Если 1-ый элемент списка целое
    (if (numberp(car list))
      ; True
      (+ (car list) (sum_ (cdr list)))
      ; False
      (+ (sum_(car list)) (sum_(cdr list)))
    )
  )
)
(print (sum_ '(1 ((2 3) 4) 5 6)))
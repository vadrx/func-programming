(defun f3(a b c d e)
  (if( = (mod(max(abs a)(abs b)(abs c)(abs d)(abs e)) 1) 0)
  ; True
    (if( = (mod(min(abs a)(abs b)(abs c)(abs d)(abs e)) 1) 0)
      ; True (Формируем список из макс. и мин. чисел)
      (list (max(abs a)(abs b)(abs c)(abs d)(abs e))
            (min(abs a)(abs b)(abs c)(abs d)(abs e))
      )
      ; False (Находим среднее арифметическое)
      ( / (+ (max(abs a)(abs b)(abs c)(abs d)(abs e))
          (min(abs a)(abs b)(abs c)(abs d)(abs e))) 2
      )
    )
    ; False (Находим среднее арифметическое)
    ( / (+ (max(abs a)(abs b)(abs c)(abs d)(abs e))
        (min(abs a)(abs b)(abs c)(abs d)(abs e))) 2
    )
  )
)
(print (f3 3 1 4 8 5))
(print (f3 2 0.4 4 9 6))
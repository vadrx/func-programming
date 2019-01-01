(println "Lab 5: task 4")
; Проверяет,а не встречалось ли это слово до этого в списке - lst1 и lst2 списки
; pos - позиция искомого слова, curr - позиция рассматриваемого сейчас слова
(define (uno lst1 lst2 pos curr)
	(cond
		((= curr pos) 0)
		((= lst1 (first lst2)) 1)
		(true (uno lst1 (rest lst2) pos (+ curr 1)))
))

; Считает количество использований слов в тексте,
; lst1 и lst2 списки, ctr - количество исп-й
(define (do lst1 lst2 ctr)
	(cond
		((null? lst2)(cons lst1 ctr))
		((= lst1 (first lst2))(do lst1 (rest lst2) (+ ctr 1)))
		(true (do lst1 (rest lst2) ctr))
))

; Если слово не встречалось - смотрим количество использований.
; Иначе берем следующее слово
(define (tres lst1 lst2 ctr)
	(cond
		((null? lst1)'())
		((= (uno (first lst1) lst2 ctr 0) 0)
			(cons (do (first lst1) (rest lst1) 1) (tres (rest lst1) lst2 (+ ctr 1))))
		(true (tres (rest lst1) lst2 (+ ctr 1)))
))

; Стартер
(define (quatro lst)
  (tres lst lst 0)
)
(println (quatro '(быть или не быть)))
(exit 0)

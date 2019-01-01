(print "Lab 3: task 4")
; Считывание количества подсписков в списке
(defun count_(list)
(if (null list) 0
    (if (atom (car list))
        (+ 0 (count_ (cdr list)))
        (+ 1 (count_ (cdr list)))))
)
; «Погружение» во вложенный список
(defun into_(list level)
(if (null list) '()
    (if (atom (car list))
        (append (into_ (cdr list) level))
        (append (walk_ (car list) (+ 1 level)) (into_ (cdr list) level))))
)
; Обход списка
(defun walk_ (list level)
  (if (null list) '()
    (if (not (= (count_ list) 0))
        (cons (list (count_ list) level) (into_ list level))))
)
(print (walk_ '((8 2) (1 (2 (5 0)) (3 1)) 9 (2 5) 1) 1))

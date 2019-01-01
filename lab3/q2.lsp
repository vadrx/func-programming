(print "Lab 3: task 2")
; Поиск максимального элемента в списке
(defun max_ (lst max_obj)
  (if (null lst) max_obj
    (if (> (car lst) max_obj )
      (max_ (cdr lst) (car lst))
        (max_ (cdr lst) max_obj)))
)
; Сравнение элементов и замена их местами
(defun swap_ (lst obj)
  (if (null lst) nil
    (if (equal (car lst) obj)
      (cdr lst)
        (cons (car lst) (swap_ (cdr lst) obj) )))
)
; Сортировка
(defun sort_ (lst)
  (if (null lst) nil
      (cons (max_ lst (car lst)) (sort_ (swap_ lst (max_ lst (car lst))))))
)
(print (sort_ '(12 8 14 6 4 9 1 8 13 5 11 3 18 3 10 9)))

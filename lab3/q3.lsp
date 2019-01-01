(print "Lab 3: task 3")
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
; Объединение двух списков
; и вставка отсортированных элементов в конец нового списка
(defun append_ (lst1 lst2)
(if (and (null lst1)(null lst2)) nil
   (if (null lst1) lst2
       (if (null lst2) lst1
            (if (>= (car lst1)(car lst2))
               (sort_ (cons (car lst1)(append_ (cdr lst1) lst2)))
               (sort_ (cons (car lst2)(append_ lst1 (cdr lst2))))))))
)
(print (append_ '(12 8 14 6 4 9 1 8) '(13 5 11 3 18 3 10 9)))
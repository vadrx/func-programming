(print "Lab 3: task 1")
; Возвращает длину списка.
(defun length_ (List)
  (if (null List) 0
    ( + 1 (length_ (cdr List)) )
  )
)
; Проверка на четность элемента Х.
(defun even_ (X)
  (if ( = 0 (mod X 2)) T nil)
)
; Определяет значение шага по формуле Седжвика для конкретного Х
(defun inc_ (X)
  (if (even_ X)
    (+ 1 ( - ( * 9 (expt 2 X))( * 9 (expt 2 ( / X 2)))))
    (+ 1 ( - ( * 8 (expt 2 X))( * 6 (expt 2 ( / ( + X 1) 2)))))
  )
)
; Возвращает количество шагов сортировки для заданного размера массива.
(defun increment_ (X sz)
  (if (> (* 3 (inc_ X)) sz) '()
  (append (increment_ (+ X 1) sz) (cons (inc_ X) nil)))
)
; Возвращает список первых cnt элементов.
(defun fst_elems_(lst cnt)
  (if ( > cnt (length_ lst)) nil)
  (if ( = cnt 1) (cons (car lst) nil)
    (append (cons (car lst) nil) (fst_elems_(cdr lst)(- cnt 1)))
  )
)
; Возвращает список, полученный после отсечения первых cnt элементов
(defun last_elems_ (lst cnt)
  (if ( > cnt (length_ lst)) nil )
  (if ( = cnt 1) (cdr lst)
    (last_elems_ (cdr lst) (- cnt 1))
  )
)
; Функция, которая сравнивает и, если требуется,
; меняет местами первый и cnt-ый элементы
(defun compare_ (lst cnt)
     (if ( = cnt 1) nil )
     (if ( < cnt (length_ lst)) nil)
     (if  ( <= (car (fst_elems_ lst ( - cnt 1)))
                (car (last_elems_ lst ( - cnt 1))))
        lst (append
              (append (cons (car (last_elems_ lst ( - cnt 1))) nil)
	                           (cdr (fst_elems_ lst ( - cnt 1))))
	            (append (cons (car (fst_elems_ lst ( - cnt 1))) nil)
	                           (cdr (last_elems_ lst ( - cnt 1))) )
            )
  )
)
; Функция, которая делает один проход по массиву, сравнивая элементы,
; отстающие друг от друга на cnt элементов
(defun pass_lst_ (lst cnt)
     (if ( > cnt (length_ lst)) lst
      (append (cons (car (compare_ lst cnt)) nil)
	       (pass_lst_ (cdr (compare_ lst cnt)) cnt) )
    )
)
; Проходит по массиву пока не отсортирует его для указанного расcтояния
(defun pass_sort_ (Passed_lst lst cnt)
     (if (EQUAL lst Passed_lst) lst
      (pass_sort_ (pass_lst_ Passed_lst cnt) Passed_lst cnt ))
)
; Извлекет шаги сортировки из списка шагов сортировки
(defun init_sort_ (lst Step_lst)
  (if (null (cdr Step_lst))
    (pass_sort_ (pass_lst_ lst( + 1 (car Step_lst))) lst ( + 1 (car Step_lst)))

    (init_sort_ (pass_sort_ (pass_lst_ lst ( + 1 (car Step_lst)))
          lst ( + 1 (car Step_lst))) (cdr Step_lst))
  )
)
; Главная функция для сортировки методом Шелла
(defun sort_ (lst)
 (if (null lst) nil
  (init_sort_ lst (increment_ 0 (length_ lst)) ))
)
(print (sort_ '(12 8 14 6 4 9 1 8 13 5 11 3 18 3 10 9)))
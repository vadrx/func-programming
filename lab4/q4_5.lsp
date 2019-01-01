(defun interp(lst)
(cond
    ((eq '+  (car lst)) (sum (cdr lst)))
    ((eq '*  (car lst)) (ymn (cdr lst)))
    ((eq '-  (car lst)) (vuch (cdr lst))) 
    ((eq '/  (car lst)) (del (cdr lst)))
    ((eq 'car   (car lst))  (car_ (cdr lst))) 
    ((eq 'cdr   (car lst))  (cdr_ (cdr lst)))
    ((eq 'cons  (car lst))  (obed (cdr lst)))
    ((eq 'asin  (car lst))  (arcsin (car (cdr lst)))) 
    (lst)
))

(defun car_(lst)
    (car (interp (car lst)))
)

(defun cdr_(lst)
    (cdr (interp (car lst)))
)

(defun obed(lst)
    (cons (interp (car lst)) (interp (cadr lst)))
)

(defun sum(lst)
 (if (null lst) 0
     (let ((x (car lst)) (y (cdr lst)))
            (if (atom x) 
               (+ x (sum y)) 
                    (+ (interp x) (sum y)))))
)

(defun vuch(lst)
  (if (null lst) 0
      (let ((x (car lst)) (y (cdr lst)))
             (if (atom x) 
              (- x (vuch y))
                   (- (interp x) (vuch y)))))
)

(defun ymn(lst)
  (if (null lst) 1
       (let ((x (car lst)) (y (cdr lst)))
              (if (atom x) 
               (* x (ymn y)) 
                    (* (interp x) (ymn y)))))
)

(defun del(lst)
  (if  (null lst) 1
        (let ((x (car lst)) (y (cdr lst)))
                (if (atom x) 
               (/ x (del y))
                    (/ (interp x) (del y)))))
)

(defun arcsin(x)
    (asin x)
)

(print (interp '( cons(car(cdr (e r t w))) (cons (cdr (g h 6)) nil))))
(print (interp '( cons(car(cdr (e r t w))) (cons (cdr (g h 6)) (asin 1)))))

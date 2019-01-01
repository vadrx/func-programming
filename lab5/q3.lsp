(println "Lab 5: task 3")
; Получение первого слога в слове
(define (slog1 word lst)
	(cond
		((null? word) '())
		((member (first word) lst) (cons (first word)))
		(true (cons (first word) (slog1 (rest word) lst) ))
))

; Получение остатка от слова
(define (slog2 word lst)
	(cond
		((null? word) '())
		((member (first word) lst) (rest word))
		(true (slog2 (rest word) lst))
))

; Собирает 2 слова по исходному слову и ключевому
(define (builder word key)
	(let(
		(w (map read-expr (explode (string word))) )
		(k (map read-expr (explode (string key ))) )
		(lst '(у е ы а о э я и ю ё)) )
		(cons
			(read-expr(join (map string (append (slog1 k lst) (slog2 w lst) ) )))
			(read-expr(join (map string (append (slog1 w lst) (slog2 k lst) ) ))))
))

; Собирает “предложение”
(define (translator lst key)
	(if lst
		(append
			(builder (first lst) key)
			(translator (rest lst) key))
))

; Собирает текст
(define (task lst key)
  (map '(lambda (a) (translator a key)) lst
))

(println (task '((привет слово) ) 'сплетня))
(exit 0)
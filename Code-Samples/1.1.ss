#lang racket

; 1.1.2
;Простые имена для описания сложных операций
(define circumference (* 2 pi radius))

;1.1.4 
;Примеры не из учебника!
(define x 2)
(define y 2)
(define (square x) (* x x))
(define (sum-of-square x y) (+ (square x)(square y)))
(sum-of-square 3 2)
;Ответ - 13, не смотря на 9 и 10 строки!

(define (square x) (* x x))
(define (sum-of-square x y) (define x 2) (define y 2) (+ (square x)(square y)))
(sum-of-square 3 2)
;Ответ - 8, не смотря на аргументы 3 и 2 в начале!

(define (square x) (* x x))
(define (sum-of-square x y) (+ (square x)(square y)) (- (square x)(square y)))
(sum-of-square 3 2)
;Ответ - 5, т.к. в ответ идет значение последнего выражения в теле процедуры

;1.1.6
;Примеры не из учебника!
;Названия определяемых процедур не могут повторяться, не смотря на разное количество аргументов!
(define (^ x) (* x x))
(define (^ x y) (* x y))
;Такие определения вызовут ошибку!

(define (proc x)
  (cond ((> x 0) 1)
        ((< x 0) 0)))
(proc 0)
;Процедура вернет #<void>!

;1.1.7
;Поиск квадратного корня методом последовательных приближений.
;Интересен порядок объявления процедур!
(define (abs x)
  (if (> x 0)
      x
      (- x)))
(define (square x)
  (* x x))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))
(define (improve guess x)
  (average guess (/ x guess)))
(define (average x y)
  (/ (+ x y) 2))
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
  (sqrt-iter 1.0 x))
         
         ;output
(sqrt 0) ;0.03125
(sqrt 1) ;1.0
(sqrt 9) ;3.00009155413138
(sqrt (+ 100 37)) ;11.704699917758145
(sqrt (+ (sqrt 2)(sqrt 3))) ;1.7739279023207892
(square (sqrt 1000)) ;1000.000369924366

;1.1.8
;Внутренние определения и блочная структура
(define (abs x)
  (if (> x 0)
      x
      (- x)))
(define (square x)
  (* x x))
;sqrt-iter, average, improve, good-enough? - подпроцедуры локальны в теле процедуры sqrt
(define (sqrt x)
  (define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.001))
  (define (average x y)
    (/ (+ x y) 2))
  (define (improve guess x)
    (average guess (/ x guess)))
  (define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)))
  (sqrt-iter 1.0 x))
;"x" свободная переменная для внутренних подпроцедур sqrt, её не обязательно явно передавать в каждую подпроцедуру
;но её нужно явно передать в процедуру average, поскольку improve передает не "x", а выражение с ним
(define (sqrt x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  (define (average x y)
    (/ (+ x y) 2))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))
  (sqrt-iter 1.0))
;Альтернативный вариант - все расчеты выполняются в теле процедур average, а не передаються частично в её, как раньше.
(define (sqrt x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  (define (average y)
    (/ (+ (/ x y) y) 2))
  (define (improve guess)
    (average guess))
  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))
  (sqrt-iter 1.0))
;в таком случае одна из процедур теряет смысл, объединим их
(define (sqrt x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess)
    (/ (+ (/ x guess) guess) 2))
  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))
  (sqrt-iter 1.0))

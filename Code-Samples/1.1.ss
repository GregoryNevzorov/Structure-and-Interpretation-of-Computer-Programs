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

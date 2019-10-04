#lang racket

; Рекурсивное определение
(define (function n)
  (cond ((< n 3) n)
        (else (+ (function (- n 1))
                 (function (- n 2))
                 (function (- n 3))))))

(function 5) ; 11

; Итеративное определение
(define (function n)
  (function-iter n 0 1 2 n))

(define (function-iter n x y z answer)
  (if (< n 3)
    answer
    (function-iter (- n 1) y z (+ x y z) (+ x y z))))

(function 5) ; 11

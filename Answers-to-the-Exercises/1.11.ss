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
  (function-iter 2 1 0 n))

(define (function-iter x y z n)
  (if (< n 3)
    (if (= x 2) n x)
    (function-iter (+ x y z) x y (- n 1))))

(function 5) ; 11

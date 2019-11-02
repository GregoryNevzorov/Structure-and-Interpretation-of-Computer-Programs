#lang racket

(define (square x)
  (* x x))

(define (even? x)
  (= (remainder x 2) 0)) ; remainder - возвращает остаток от целочисленного деления.


(define (fast-expt-iter b n)
  (define (iter b n a)
    (cond ((= n 0) a)
          ((even? n) (iter (square b) (/ n 2) a))
          ((= 1 1) (iter b (- n 1) (* b a)))))
  (iter b n 1))

(fast-expt-iter 9 4) ;6561

;Итеративный процесс. (Хвостовая рекурсия.)
;Ускорение на чётных показателях степени. (1) - по памяти; (log2(n)) - по шагам.

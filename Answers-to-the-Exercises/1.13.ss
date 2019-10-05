#lang racket

; Возведение "x" в степень "y".
(define (** x y)
  (define (iter number input counter)
    (cond ((= counter 0) 1)
          ((= counter 1) number)
          (else (iter (* number input) input (- counter 1)))))
    (iter x x y))

(define (fib n)
  (/ (- (** (/ (+ 1 (sqrt 5)) 2) n)(** (/ (- 1 (sqrt 5)) 2) n))(sqrt 5)))

(fib 10) ; 55.00000000000001

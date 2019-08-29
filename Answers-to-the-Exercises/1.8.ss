#lang racket

(define (^ x)
  (* x x))

(define (abs x)
  (if (> x 0)
      x
      (- x)))

(define (cube-root x)
  
(define (cube-iter guess x)
  (cond ((= x 0) x)
        ((good-enough? guess x) guess)
        (else (cube-iter (improve guess x) x))))
  
(define (improve guess x)
  (/ (+ (/ x (^ guess)) (* guess 2)) 3))

(define (good-enough? guess x)
  (< (abs (- guess (improve guess x))) 0.0001))
  
(cube-iter 1.0 x))


(cube-root 2) ; Ответ: 1.259933493449977

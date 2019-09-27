#lang racket

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

(A 1 10) ; A(1 10) = 1024
(A 2 4)  ; A(2 4) = 65536
(A 3 3)  ; A(3 3) = 65536

(define (f n) (A 0 n)) ;f(n) = n*2.
(f 100) ; f(100) = 200

(define (g n) (A 1 n)) ;g(n) = 2^n
(g 4)  ; g(4) = 16
(g 10) ; g(10) = 1024

(define (h n) (A 2 n)) ;h(n) = ?
(h 0) ;h(0) = 0
(h 1) ;h(1) = 2
(h 2) ;h(2) = 4
(h 3) ;h(3) = 16
(h 4) ;h(4) = 65536

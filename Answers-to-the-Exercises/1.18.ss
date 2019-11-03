#lang racket

(define (double x)
  (* x 2))

(define (halve x)
  (/ x 2))

(define (even? x)
  (if (= (remainder x 2) 0)
      #t
      #f))

; A x B x N.
(define (main a b)
  (define (fast a b n)
    (cond ((or (= b 0) (= a 0)) n)
          ((even? b) (fast (double a) (halve b) n))
          (else (fast a (- b 1) (+ n a)))))
  (fast a b 0))

(main 999 999) ; 998 001‬.

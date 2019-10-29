#lang racket

(define (cube x) (* x x x))

(define (p x) (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))

(sine 12.15) ; func(p) - 5 calls

; memory = log3(a) + inaccuracy.
; steps = log3(a) + inaccuracy.

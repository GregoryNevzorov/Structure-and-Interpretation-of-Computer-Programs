#lang racket
;lib
(define (<= x y)
  (if (not (> x y)) #t #f))

(define (proc_1.3 x y z)
  (define (sum_of_squares a b)
    (+ (* a a)(* b b)))
  (cond ((and (<= x y)(<= x z)) (sum_of_squares y z))
        ((and (<= y x)(<= y z)) (sum_of_squares x z))
        (else (sum_of_squares x y))))

(proc_1.3 3 4 5) ; 41
(proc_1.3 4 2 3) ; 25
(proc_1.3 3 4 2) ; 25
(proc_1.3 5 4 3) ; 41
(proc_1.3 4 4 5) ; 41
(proc_1.3 4 4 4) ; 32
(proc_1.3 4 0 2) ; 20
(proc_1.3 1 1 1) ; 2
(proc_1.3 0 0 0) ; 0

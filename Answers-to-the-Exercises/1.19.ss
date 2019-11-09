#lang racket
;Получение n-ого числа Фибоначчи за логарифмическое число шагов.
(define (** x)
  (* x x))

(define (fib n)
  (fib-iter 1 0 0 1 n))

(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (** p) (** q))  ; вычислить p'
                   (+ (* 2 p q) (** q))  ; вычислить q'
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))
;b(2pq + q^2) + a(2pq + q^2) + a(p^2 + q^2)
;a(2pq + q^2) + b(p^2 + q^2)
(fib 0) ;0
(fib 1) ;1
(fib 2) ;1
(fib 3) ;2
(fib 4) ;3
(fib 5) ;5
(fib 6) ;8
(fib 7) ;13
(fib 8) ;21
(fib 9) ;34
(fib 10);55

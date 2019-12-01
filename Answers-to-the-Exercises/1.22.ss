#lang racket

;define "old" proc. runtime. 
(define (runtime) (current-milliseconds))

(define (square x)
  (* x x))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))
      (display "")))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (prime? x)
  (if (= (find-divisor x 2) x)
  #t
  #f))

(define (divides? a b)
  (= (remainder b a) 0))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (search-for-primes min max)
  (search min max min))

(define (search min max counter)
  (timed-prime-test counter)
  (if (> counter max)
      (display "")
      (search min max (+ counter 1))))

(search-for-primes 1000 1050)

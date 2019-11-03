#lang racket

; f (b) - по памяти; (b) - по шагам.
(define (f a b)
  (if (= b 0)
      0
      (+ a (f a (- b 1)))))

(f 4 7) ; 28.

;double func.
(define (double x)
  (* x 2))

;halve func.
(define (halve x)
      (/ x 2))

(define (even? x)
  (if (= (remainder x 2) 0)
      #t
      #f))

;fast f (log2(b)) - по памяти; (log2(b)) - по шагам.
(define (fast a b)
  (cond ((= b 0) 0)
        ((even? b) (double (fast a (halve b))))
        (else (+ a (fast a (- b 1))))))

(fast 4 7) ; 28.

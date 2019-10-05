#lang racket

;Нахождения элемента треугольника Паскаля
; n - вертикаль, m - горизонталь. (n, m >= 0 and m <= n)
(define (pascals-triangle n m)
  (cond ((= m 0) 1)
        ((= m n) 1)
        (else (+ (pascals-triangle (- n 1)(- m 1)) (pascals-triangle (- n 1) m)))))

(pascals-triangle 4 2) ; 6

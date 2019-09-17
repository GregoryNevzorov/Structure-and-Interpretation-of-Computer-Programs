#lang racket
; 1.2.1
;Вычисление факториала.
;Рекурсивный процесс, рекурсивная процедура:
(define (factorialR n)
  (if (= n 1)
      1
      (* n (factorialR (- n 1)))))

(factorialR 6) ; 720
;Итеративный процесс, рекурсивная процедура:
;(Хвостовая рекурсия)
(define (factorialI n)
  (fact-iter 1 1 n))
(define (fact-iter product counter max-count)
  (if (> counter max-count)
      product
      (fact-iter (* counter product)
                 (+ counter 1)
                 max-count)))

(factorialI 6) ; 720
;Итеративный процесс, рекурсивная процедура:
;Блочная структура
(define (factorialB n)
  (define (fact-iter product counter max-count)
    (if (> counter max-count)
        product
        (fact-iter (* counter product)
                   (+ counter 1)
                   max-count)))
(fact-iter 1 1 n))

(factorialB 6) ; 720

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

;Числа Фибоначчи
;Рекурсивное определение, вызывающее древовидную рекурсию (Крайне не эффективное!)
(define (fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (fib (- n 1))
                 (fib (- n 2))))))

(fib 10) ; 55

;Итеративное определение
(define (fib2 n)
  (fib-iter 1 0 n))

(define (fib-iter a b count)
  (if (= count 0)
      b
      (fib-iter (+ a b) a (- count 1))))

(fib2 15) ; 610

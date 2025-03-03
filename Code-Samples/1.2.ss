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
;Блочная структура.
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
;Рекурсивное определение, вызывающее древовидную рекурсию. (Крайне не эффективное!)
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

; Рекурсивный алгоритм подсчета количества способов размена какой-либо суммы денег.
; Количество_способов(amount, kinds-of-coins) = Количество_способов(amount, kinds-of-coins - 1) + Количество_способов(amount - d, kinds-of-coins),
; где d - номинал монет первого типа.
; Количество_способов(amount, 0) = 0
; Количество_способов(< 0, kinds-of-coins) = 0
; Количество_способов(0, kinds-of-coins) = 1
(define (count-change amount)
  (cc amount 5)) ; amount - некая сумма денег.

(define (cc amount kinds-of-coins) ; kinds-of-coins - количество типов монет.
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount
                     (- kinds-of-coins 1))
                 (cc (- amount
                        (first-denomination kinds-of-coins))
                     kinds-of-coins)))))

(define (first-denomination kinds-of-coins) ; -- номинал монет.
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

(count-change 100) ; 292 способа.

;Вычисление b ^ n.
;Рекурсия. (n) - памяти; (n) - шагов.
(define (exptR b n)
  (if (= n 0)
      1
      (* b (exptR b (- n 1)))))
;Итерация. (1) - памяти; (n) - шагов.
(define (exptI b n)
  (expt-iter b n 1))

  (define (expt-iter b counter product)
    (if (= counter 0)
        product
        (expt-iter b
                   (- counter 1)
                   (* b product))))
;Ускорение на чётных показателях степени. (log2(n)) - памяти; (log2(n)) - шагов.
(define (square x)
  (* x x))

(define (even? x)
  (= (remainder x 2) 0))

(define (exptF b n)
  (cond ((= n 0) 1)
        ((even? n) (square (exptF b (/ n 2))))
        (else (* b (exptF b (- n 1))))))

(exptR 3 3) ;27
(exptI 3 3) ;27
(exptF 3 3) ;27

(exptR 2 1) ;2
(exptI 2 1) ;2
(exptF 2 1) ;2

;НОД Евклид
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))
(gcd 16 28) ; 4
(gcd 28 16) ; 4
;Если a < b, происходит "непроизвольный" обмен элементов.

;Проверка числа на простоту "в лоб"
(define (square x)
  (* x x))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(prime? 3) ; #t
(prime? 16); #f
(prime? 23); #t

;Тест Ферма.
(define (square x)
  (* x x))

(define (even? x)
  (if (= (remainder x 2) 0)
      #t
      #f))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
         (else
          (remainder (* base (expmod base (- exp 1) m))
                     m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(fast-prime? 59 10); #t
(fast-prime? 15 10); #f

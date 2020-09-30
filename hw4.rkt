
#lang racket

(provide (all-defined-out)) ;; so we can put tests in a second file

;; put your code below

;1
(define (sequence low high stride)
  (if (> low high)
      null
      (cons low (sequence (+ low stride) high stride))))

;2
(define (string-append-map xs suffix)
  (map (lambda(x) (string-append x suffix)) xs))

;3
(define (list-nth-mod xs n)
  (cond [(< n 0) (error "list-nth-mod: negative number")]
        [(empty? xs) (error "list-nth-mod: empty list")]
        [#t
         (car (list-tail xs (remainder n (length xs))))]))

;4
(define (stream-for-n-steps s n)
  (if (= n 0)
      null
      (cons (car (s)) (stream-for-n-steps (cdr (s)) (- n 1)))))
      
    
(define ones (lambda() (cons 1 ones)))

(define nats
  (letrec ([f (lambda (x) (cons x (lambda () (f (+ x 1)))))])
    (lambda () (f 1))))

 
;5
 
(define funny-number-stream
  (letrec ([f (lambda (x) (cons x (lambda ()
                                    (if (= (remainder (+ (abs x) 1) 5) 0)
                                        (f (* -1 (+ x 1)))
                                        (f (+ (abs x) 1))))))])
                                    
    (lambda () (f 1))))


;6
(define dan-then-dog
    (letrec ([f (lambda (x) (cons x (lambda ()
                                    (if (string=? x "dan.jpg")
                                        (f "dog.jpg")
                                        (f "dan.jpg")))))])
                                     
    (lambda () (f "dan.jpg")))) 

;7
(define (stream-add-zero s)
  (letrec ([f (lambda (x) (cons 0
                                (lambda() s)))])
    (lambda () (f stream-add-zero))))

(define (stream-add-zero2 s)
  (lambda (x) (cons 0 (cons (s)
                            (lambda() (stream-add-zero2 (s)))))))

    






  



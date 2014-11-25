;;; Math functions written in Scheme
;;; Author: Jing Guo
;;; Email: dev.guoj@gmail.com
;;; Blog: guo.org

(define deriv
  (lambda (f)
    (lambda (x)
      (/ (- (f (+ x 1e-5)) (f x)) ; tolerance is 1e-5
	 1e-5))))

;; Examples:
;; f(x) = x^3
;; f'(5) => ((deriv (lambda (x) (* x x x))) 5)

(define sec-deriv
  (lambda (f)
    (lambda (x)
      ((deriv (deriv f)) x))))

;; Examples:
;; f(x) = x^3
;; f''(5) => ((sec-deriv (lambda (x) (* x x x))) 5)

(define linearization
  (lambda (f)
    (lambda (a h)
      (+ (f a) (* ((deriv f) a) h)))))

;; Examples:
;; f(a + h) ~= f(a) + f'(a)h
;; while number "a" has to be sqrted by a integer
;; (sqrt 60) => ((linearization (lambda (x) (sqrt x))) 64 -4)

(define newton-method
  (lambda (f)
    (lambda (x) ; x is the initial guess
      (- x (/ (f x) ((deriv f) x))))))

(define repeated-newton-method
  (lambda (f)
    (lambda (init)
      (letrec ((tolerance (lambda (v1 v2)
			    (< (abs (- v1 v2)) 1e-12)))
	       (eval-newton-method ((newton-method f) init)))
	(if (tolerance init eval-newton-method)
	    init ; if v1 basically equals v2 then stop
	    ((repeated-newton-method f) eval-newton-method))))))

;; Examples:
;; (sqrt 4) => ((newton-method (lambda (x) (- (* x x) 4))) 1)
;; and repeat setting the value of x
;; or a more convenient way:
;; (sqrt 4) => (repeated-newton-method (lambda (x) (- (* x x) 4)) 1 10)

;;; SEC-DERIV-TEST, MAX-OR-MIN todo

;;; ITER-COUNTER function needs constructing

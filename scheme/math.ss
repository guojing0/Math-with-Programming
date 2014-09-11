;;; Math functions written in Scheme
;;; Author: Jing Guo
;;; Email: dev.guoj@gmail.com
;;; Blog: guo.org

;; compute the derivative of f(x)
(define deriv
  (lambda (f)
    (lambda (x)
      (/ (- (f (+ x 1e-5)) (f x)) ; tolerance is 1e-5
	 1e-5))))

; Examples:
; f(x) = x^3
; f'(5) => ((deriv (lambda (x) (* x x x))) 5)
; f''(5) => ((deriv (deriv (lambda (x) (* x x x)))) 5)

(define newton-method
  (lambda (f)
    (lambda (x) ; x is the initial guess
      (- x (/ (f x) ((deriv f) x))))))

(define repeated-newton-method
  (lambda (f init)
    (letrec ((tolerance (lambda (v1 v2)
			  (< (abs (- v1 v2)) 1e-12))))
      (if (tolerance init ((newton-method f) init))
	  init ; if v1 basically equals v2 then stop
	  (repeated-newton-method f
				  ((newton-method f) init))))))

; Examples:
; (sqrt 4) => ((newton-method (lambda (x) (- (* x x) 4))) 1)
; and repeat setting the value of x
; or a more convenient way:
; (sqrt 4) => (repeated-newton-method (lambda (x) (- (* x x) 4)) 1 10)
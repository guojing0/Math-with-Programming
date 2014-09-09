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

;; NEWTON-METHOD needs reconstructing
(define newton-method
  (lambda (f)
    (lambda (x) ; x is the initial guess
      (- x (/ (f x) ((deriv f) x))))))

; Examples:
; (sqrt 2) => ((newton-method (lambda (x) (- (* x x) 2))) 1)
; and repeat setting the value of x
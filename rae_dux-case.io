;; Studio demo
;; ================
;;
;; Welcome to Studio, a GUI for the libfive CAD kernel.
;;
;; This file is written in Guile Scheme, but Studio supports both Scheme
;; and Python.  To change languages, use the Language menu.

;; Any top-level expression that evaluates to a
;; shape will be rendered as a mesh.  You can
;; control bounds and resolution using these special commands:
(set-quality! 2)
(set-resolution! 1)
(set-bounds! [-30 -30 -30] [200 200 200])


;; Shapes are defined in this pane, and rendered
;; on the right.  You can start with shapes from
;; the standard library, e.g.
(define keeb-box (rounded-box [0 0 0] [150 20 110] 0.3))
(define keeb keeb-box)

(define keebs (union keeb (move keeb [0 25 0])))
(define the-case (rounded-box [0 0 0] [190 55 130] 0.5))

(define magnet (cylinder 5.5 2.5))
(define (magnets h)
  (union (move magnet [10 13 h])
         (move magnet [10 42 h])
         (move magnet [180 13 h])
         (move magnet [180 42 h])))

(define (cut-top elem)
  (difference elem (box [-20 -20 90] [200 100 150])))

(define (cut-bot elem)
  (difference elem (box [-20 -20 -10] [200 100 90])))

(define (move-into keebs)
  (move keebs [20 5 10]))
  
(define lower (cut-top the-case))
(define lower-case (difference lower (move-into keebs)))
(define lower-case-magnets (difference lower-case (magnets 86)))

(define upper (cut-bot the-case))
(define upper-case (difference upper (move-into keebs)))
(define upper-case-magnets (difference upper-case (magnets 92)))

(define all (union upper-case-magnets (move lower-case-magnets [0 0 -20])))

;all

(define upper-print (move upper-case-magnets [0 0 -90]))
(define lower-print (move (reflect-z lower-case-magnets) [0 80 90]))
(define print (union upper-print lower-print))

print

;; Constructive solid geometry (CSG)
;; operations can be peformed using the libfive
;; standard library functions e.g. this difference
;; operation:
;(difference (box [-4 -1 -1] [-2 1 0]) (box [-3 -1 -0.5] [-2 0.5 0]))


;; Shapes can also be defined as arbitrary distance
;; fields, expressed as functions of x, y, z.
;; Here's the distance-field expression for a sphere:
#|(lambda-shape (x y z)
  (- (sqrt (+ (* x x) (* y y) (* z z))) 1))
|#

;; To see a full list of shapes in the standard library,
;; open the "Shape reference" from the help menu.

;; Additional examples can be found in the source
;; repository--locally or online:
;;
;;   <https://github.com/libfive/libfive/tree/master/studio/examples>

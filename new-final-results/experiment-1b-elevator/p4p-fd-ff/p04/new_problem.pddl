(define (problem el_4)
    (:domain elevator)
    (:objects f0 f1 f2 f3 f4 f5 f6 f7 p0 p1 p2 p3)
    (:init (above f0 f1) (above f0 f2) (above f0 f3) (above f0 f4) (above f0 f5) (above f0 f6) (above f0 f7) (above f1 f2) (above f1 f3) (above f1 f4) (above f1 f5) (above f1 f6) (above f1 f7) (above f2 f3) (above f2 f4) (above f2 f5) (above f2 f6) (above f2 f7) (above f3 f4) (above f3 f5) (above f3 f6) (above f3 f7) (above f4 f5) (above f4 f6) (above f4 f7) (above f5 f6) (above f5 f7) (above f6 f7) (destin p0 f1) (destin p1 f3) (destin p2 f5) (destin p3 f7) (lift-at f0) (origin p0 f0) (origin p1 f0) (origin p2 f0) (origin p3 f0))
    (:goal (val_Oserved_p0-and-Oserved_p1-and-Oserved_p2-and-Oserved_p3))
)
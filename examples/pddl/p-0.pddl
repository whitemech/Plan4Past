(define (problem blocks-4-0)
(:domain blocks)
(:objects d b a c - block)
(:init (clear c) (clear a) (on a b) (on c d) (ontable b) (ontable d) (handempty))
(:goal (and (on d c) (on c b) (on b a)))
)
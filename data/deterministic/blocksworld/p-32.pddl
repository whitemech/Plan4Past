(define (problem blocks-15-1)
(:domain blocks-domain)
(:objects j b k a d h e n c f l m i o g - block)
(:init (clear g) (clear o) (ontable i) (ontable m) (on g l) (on l f) (on f c)
 (on c n) (on n e) (on e h) (on h d) (on d a) (on a k) (on k b) (on b j)
 (on j i) (on o m) (emptyhand))
(:goal (and (on d g) (on g f) (on f k) (on k j) (on j e) (on e m) (on m a)
            (on a b) (on b c) (on c n) (on n o) (on o i) (on i l) (on l h)))
)
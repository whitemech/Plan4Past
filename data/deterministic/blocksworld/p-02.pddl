(define (problem BLOCKS-4-1)
(:domain blocks-domain)
(:objects A C D B )
(:INIT (CLEAR B) (ONTABLE D) (ON B C) (ON C A) (ON A D) (EMPTYHAND))
(:goal (AND (ON D C) (ON C A) (ON A B)))
)
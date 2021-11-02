(define (problem BLOCKS-4-0)
(:domain BLOCKS)
(:objects D B A C)

(:INIT  
        (CLEAR A) 
        (CLEAR B) 
        (CLEAR C) 
        (ON C D) 
        (ONTABLE A)
        (ONTABLE B) 
        (ONTABLE D) 
        (HANDEMPTY)

        ; initial assignment
        (not_onBA)
        (not_ontableC)
        (not_Y-ontableC)
        (not_onBA-and-Y-ontableC)
        (not_once-tt)

        ; the environment starts
        (act)
        (top)
        (not (goal))
)

(:goal (goal))
)
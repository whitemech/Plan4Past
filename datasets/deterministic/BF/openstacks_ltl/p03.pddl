; Compilation CPU-time: 0.000 seconds
(define (problem grounded-STRIPS-OS-SEQUENCEDSTRIPS-SMALL-6)
(:domain grounded-STRIPS-OPENSTACKS-SEQUENCEDSTRIPS)

(:objects noobjects)
(:init
(NOT-MADE-P1)
(NOT-MADE-P2)
(NOT-MADE-P3)
(NOT-MADE-P4)
(NOT-MADE-P5)
(WAITING-O5)
(WAITING-O4)
(WAITING-O3)
(WAITING-O2)
(WAITING-O1)
(STACKS-AVAIL-N0)
(MACHINE-AVAILABLE)
)


 (:goal (and 
(release (MADE-P4) (not (MADE-P5)))
(release (MADE-P3) (not (MADE-P4)))
(release (MADE-P2) (not (MADE-P3)))
(release (MADE-P1) (not (MADE-P2)))
(eventually (SHIPPED-O1))
(eventually (SHIPPED-O2))
(eventually (SHIPPED-O3))
(eventually (SHIPPED-O4))
(eventually (SHIPPED-O5)))) 

)
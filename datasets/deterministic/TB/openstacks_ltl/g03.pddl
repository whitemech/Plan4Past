; Compilation CPU-time: 0.000 seconds
(define (problem grounded-STRIPS-OS-SEQUENCEDSTRIPS-SMALL-4)
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
(eventually (SHIPPED-O1))
(eventually (SHIPPED-O2))
(eventually (SHIPPED-O3))
(until (not (STARTED-O1)) (STARTED-O2))
(until (not (STARTED-O2)) (STARTED-O3))))

)
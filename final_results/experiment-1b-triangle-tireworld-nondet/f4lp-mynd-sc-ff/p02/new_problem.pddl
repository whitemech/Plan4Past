(define (problem t-tw_2)
	(:domain triangle-tire)
	(:objects l1x1 - location l2x1 - location l1x2 - location)
	(:init (notflattire) (q1 l1x2 l2x1 l1x1) (road l1x1 l1x2) (road l1x1 l2x1) (road l1x2 l1x1) (road l1x2 l2x1) (road l2x1 l1x1) (road l2x1 l1x2) (sparein l1x1) (sparein l1x2) (sparein l2x1) (turnDomain) (vehicleat l1x1))
(:goal (and (q4 l1x2 l2x1 l1x1) (turnDomain)))
)
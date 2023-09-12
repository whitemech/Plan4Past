(define (domain robot_coffee)
  (:requirements :strips :non-deterministic)
 
  (:types office - room
	kitchen - room)
(:predicates (robot_at ?x - room)
	     (coffee_at ?x - room)
	     (connected ?x - room ?y - room)
	     (has_coffee)
             )

(:action move_to
  :parameters
   (?x - room
    ?y - room)
  :precondition
   (and
   (robot_at ?x) (connected ?x ?y))
  :effect
   (and
   (robot_at ?y) (not (robot_at ?x)))
)

(:action prepare_coffee
  :parameters
   (?x - kitchen)
  :precondition
   (and
   (robot_at ?x) (not (has_coffee)))
  :effect
   (has_coffee)
)

(:action put_coffee
  :parameters
   (?x - office)
  :precondition
   (and
   (robot_at ?x) (has_coffee))
  :effect
   (and (not (has_coffee))
   (oneof
    (and (coffee_at ?x))
    (and)
   ))
)


)

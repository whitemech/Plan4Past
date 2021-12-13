(define (domain triangle-tire)
  (:requirements :typing :strips :non-deterministic)
  (:types location)
  (:predicates (vehicleat ?loc - location)
	       (sparein ?loc - location)
	       (road ?from - location ?to - location)
	       (notflattire))
  (:action move-car
    :parameters (?from - location ?to - location)
    :precondition (and (vehicleat ?from) (road ?from ?to) (notflattire))
    :effect (and 
		 (oneof (and (vehicleat ?to) (not (vehicleat ?from)))
			(and (vehicleat ?to) (not (vehicleat ?from)) (not (notflattire))))))

  (:action changetire
    :parameters (?loc - location)
    :precondition (and (sparein ?loc) (vehicleat ?loc))
    :effect (and (not (sparein ?loc)) (notflattire))))


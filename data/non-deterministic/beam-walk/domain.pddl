;; Authors: Rune Jensen & Manuela Veloso
;; Modified: Rewritten as PDDL by Miquel Ramirez, April 2014

(define (domain beam-walk)
	(:requirements :typing :strips :non-deterministic)
	(:types location)
	(:predicates
		(up)
		(position ?p - location)
		(nextfwd ?p1 ?p2 - location)
		(nextbwd ?p1 ?p2 - location)
		(ladderat ?p - location)
	)

	;; Action to move while being on the beam
	(:action walk-on-beam
		:parameters ( ?from - location ?to - location )
		:precondition (and (up) (position ?from) (nextfwd ?from ?to))
		:effect (oneof
				(and (position ?to) (not (position ?from)))
				(and (not (up)) (position ?to) (not (position ?from)))
			)
	)

	(:action walk
		:parameters (?from - location ?to - location)
		:precondition (and (not (up)) (position ?from) (nextbwd ?from ?to))
		:effect (and (position ?to) (not (position ?from)))
	)

	(:action climb
		:parameters (?p - location)
		:precondition (and (not (up)) (position ?p) (ladderat ?p))
		:effect (and (up))
	)
)
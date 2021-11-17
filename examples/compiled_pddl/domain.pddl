;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 4 Op-blocks world
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (domain BLOCKS)
	(:requirements :strips :derived-predicates :conditional-effects)
	(:predicates 
		(on ?x ?y)
		(ontable ?x)
		(clear ?x)
		(handempty)
		(holding ?x)

		; alternation + check-goal
		(act)
		(goal)

		; prime predicates
		(p_onBA)
		(p_not_onBA)
		(p_ontableC)
		(p_not_ontableC)
		(p_Y-ontableC)
		(p_not_Y-ontableC)
		(p_onBA-and-Y-ontableC)
		(p_not_onBA-and-Y-ontableC)
		(p_once-tt)
		(p_not_once-tt)

		; non-prime predicates
		(top)
		(onBA)
		(not_onBA)
		(ontableC)
		(not_ontableC)
		(Y-ontableC)
		(not_Y-ontableC)
		(onBA-and-Y-ontableC)
		(not_onBA-and-Y-ontableC)
		(once-tt)
		(not_once-tt)
	)

	; (:derived (predicate) (condition))
	(:derived (p_once-tt) (top))
	(:derived (p_onBA) (onBA))
	(:derived (p_ontableC) (ontableC))
	(:derived (p_Y-ontableC) (and (ontableC) (once-tt)))
	(:derived (p_onBA-and-Y-ontableC) (and (p_onBA) (p_Y-ontableC)))

	(:derived (p_not_onBA) (not_onBA))
	(:derived (p_not_ontableC) (not_ontableC))
	(:derived (p_not_Y-ontableC) (not_Y-ontableC))
	(:derived (p_not_onBA-and-Y-ontableC) (not_onBA-and-Y-ontableC))

	(:action pick-up
		:parameters (?x)
		:precondition (and (clear ?x) (ontable ?x) (handempty) (act))
		:effect
		(and (not (ontable ?x))
		(not (clear ?x))
		(not (handempty))
		(holding ?x)
		(not (act))
		)
	)
	(:action put-down
		:parameters (?x)
		:precondition (and (holding ?x) (act))
		:effect
		(and (not (holding ?x))
		(clear ?x)
		(handempty)
		(ontable ?x)
		(not (act))
		)
	)
	(:action stack
		:parameters (?x ?y)
		:precondition (and (holding ?x) (clear ?y) (act))
		:effect
		(and (not (holding ?x))
		(not (clear ?y))
		(clear ?x)
		(handempty)
		(on ?x ?y)
		(not (act))
		)
	)
	(:action unstack
		:parameters (?x ?y)
		:precondition (and (on ?x ?y) (clear ?x) (handempty) (act))
		:effect
		(and (holding ?x)
		(clear ?y)
		(not (clear ?x))
		(not (handempty))
		(not (on ?x ?y))
		(not (act))
		)
	)

	(:action prog
		:parameters ()
		:precondition (and (not (act)) (not (goal)))
		:effect (and 
		(when (p_onBA) (onBA))
		(when (p_not_onBA) (not_onBA))
		(when (p_ontableC) (ontableC))
		(when (p_not_ontableC) (not_Y-ontableC))
		(when (p_Y-ontableC) (Y-ontableC))
		(when (p_not_Y-ontableC) (not_Y-ontableC))
		(when (p_onBA-and-Y-ontableC) (onBA-and-Y-ontableC))
		(when (p_not_onBA-and-Y-ontableC) (not_onBA-and-Y-ontableC)) 
		(when (p_once-tt) (once-tt))
		(when (p_not_once-tt) (not_once-tt))
		(act)
		)
	)
	(:action check
		:parameters ()
		:precondition (and 
		(not (act)) (once-tt)
		)
		:effect (and 
		(goal)
		)
	)
)
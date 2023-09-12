(define (domain blocks-world-domain)
  (:requirements :strips :equality :conditional-effects :non-deterministic)

  (:constants Table)

  (:predicates (on ?x ?y)
	       (clear ?x)
	       (block ?b)
	       )

  ;; Define step for placing one block on another.
  (:action puton
	     :parameters (?X ?Y ?Z)
	     :precondition (and (on ?X ?Z) (clear ?X) (clear ?Y)
				 (not (= ?Y ?Z)) (not (= ?X ?Z))
				 (not (= ?X ?Y)) (not (= ?X Table)))
	     :effect
	     		(oneof 
		     		(and (on ?X ?Y) (not (on ?X ?Z))
			   				(when (not (= ?Z Table)) (clear ?Z))
			   				(when (not (= ?Y Table)) (not (clear ?Y)))
			   		)
			   		(and (on ?X Table) 
			   				(when (not (= ?Z Table)) (and (not (on ?X ?Z)) (clear ?Z)))
;			   				(when (not (= ?Y Table)) (not (clear ?Y)))
			   		)
			   	)
		   )
	)

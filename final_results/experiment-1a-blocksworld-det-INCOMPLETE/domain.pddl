;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; 4 Op-blocks world
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (domain blocks-domain)
  (:requirements :strips)
  (:types block)
  (:predicates
	       (ontable ?x - block)
	       (on ?x ?y - block)
	       (clear ?x - block)
	       (emptyhand)
	       (holding ?x - block)
	       )

  (:action pick-up
	     :parameters (?x - block)
	     :precondition (and (clear ?x) (ontable ?x) (emptyhand))
	     :effect
	     (and (not (ontable ?x))
		   (not (clear ?x))
		   (not (emptyhand))
		   (holding ?x)))

  (:action put-down
	     :parameters (?x - block)
	     :precondition (holding ?x)
	     :effect
	     (and (not (holding ?x))
		   (clear ?x)
		   (emptyhand)
		   (ontable ?x)))
  (:action stack
	     :parameters (?x ?y - block)
	     :precondition (and (holding ?x) (clear ?y))
	     :effect
	     (and (not (holding ?x))
		   (not (clear ?y))
		   (clear ?x)
		   (emptyhand)
		   (on ?x ?y)))
  (:action unstack
	     :parameters (?x ?y - block)
	     :precondition (and (on ?x ?y) (clear ?x) (emptyhand))
	     :effect
	     (and (holding ?x)
		   (clear ?y)
		   (not (clear ?x))
		   (not (emptyhand))
		   (not (on ?x ?y)))))

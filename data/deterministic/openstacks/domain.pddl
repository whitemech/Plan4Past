; IPC5 Domain: Openstacks Propositional -- strips forced sequential version
; Author: Patrik Haslum
; The problem instances for this domain were taken from the problem
; collection of the 2005 Constraint Modelling Challenge, organized by
; Barbara Smith & Ian Gent (see http://www.dcs.st-and.ac.uk/~ipg/challenge/).

(define (domain openstacks-sequencedstrips)
  (:requirements :typing :adl)
  (:types order product count)
  (:predicates (includes ?o - order ?p - product)
	       (waiting ?o - order)
	       (started ?o - order)
	       (shipped ?o - order)
	       (made ?p - product)
	       (machineavailable)
	       (machineconfigured ?p - product)
	       (stacksavail ?s - count)
	       (nextcount ?s ?ns - count))

  (:action setup-machine
    :parameters (?p - product ?avail - count)
    :precondition (and (machineavailable)
		       (not (made ?p))
		       (stacksavail ?avail))
    :effect (and (not (machineavailable)) (machineconfigured ?p)))

  (:action make-product
    :parameters (?p - product ?avail - count)
    :precondition (and (machineconfigured ?p)
		       (forall (?o - order)
			       (imply (includes ?o ?p) (started ?o)))
		       (stacksavail ?avail))
    :effect (and (not (machineconfigured ?p))
		 (machineavailable)
		 (made ?p)))

  (:action start-order
    :parameters (?o - order ?avail ?new-avail - count)
    :precondition (and (waiting ?o)
		       (stacksavail ?avail)
		       (nextcount ?new-avail ?avail))
    :effect (and (not (waiting ?o))
		 (started ?o)
		 (not (stacksavail ?avail))
		 (stacksavail ?new-avail))
    )

  (:action ship-order
    :parameters (?o - order ?avail ?new-avail - count)
    :precondition (and (started ?o)
		       (forall (?p - product)
			       (imply (includes ?o ?p) (made ?p)))
		       (stacksavail ?avail)
		       (nextcount ?avail ?new-avail))
    :effect (and (not (started ?o))
		 (shipped ?o)
		 (not (stacksavail ?avail))
		 (stacksavail ?new-avail))
    )

  (:action open-new-stack
    :parameters (?open ?new-open - count)
    :precondition (and (stacksavail ?open)
		       (nextcount ?open ?new-open))
    :effect (and (not (stacksavail ?open))
		 (stacksavail ?new-open))
    )

  )

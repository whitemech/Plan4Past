
(define (problem os-sequencedstrips-small-5)
        (:domain openstacks-sequencedstrips)
        (:objects n0 n1 n2 n3 n4 n5 - count o1 o2 o3 o4 o5 - order p1 p2 p3 p4
         p5 - product)
        (:init (machineavailable) (nextcount n0 n1) (nextcount n1 n2)
         (nextcount n2 n3) (nextcount n3 n4) (nextcount n4 n5)
         (stacksavail n0) (waiting o1) (includes o1 p1) (includes o1 p2)
         (waiting o2) (includes o2 p3) (includes o2 p4) (waiting o3)
         (includes o3 p1) (includes o3 p5) (waiting o4) (includes o4 p2)
         (includes o4 p5) (waiting o5) (includes o5 p3) (includes o5 p4))
        (:goal
         (and (shipped o1)
              (shipped o2)
              (shipped o3)
              (shipped o4)
              (shipped o5))))

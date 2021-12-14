
(define (problem os-sequencedstrips-wbop_10_10-11)
        (:domain openstacks-sequencedstrips)
        (:objects n0 n1 n2 n3 n4 n5 n6 n7 n8 n9 n10 - count o1 o2 o3 o4 o5 o6
         o7 o8 o9 o10 - order p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 - product)
        (:init (machineavailable) (nextcount n0 n1) (nextcount n1 n2)
         (nextcount n2 n3) (nextcount n3 n4) (nextcount n4 n5)
         (nextcount n5 n6) (nextcount n6 n7) (nextcount n7 n8)
         (nextcount n8 n9) (nextcount n9 n10) (stacksavail n0) (waiting o1)
         (includes o1 p1) (includes o1 p6) (includes o1 p9) (waiting o2)
         (includes o2 p2) (includes o2 p8) (includes o2 p9) (waiting o3)
         (includes o3 p1) (includes o3 p2) (includes o3 p8) (waiting o4)
         (includes o4 p3) (includes o4 p4) (includes o4 p10) (waiting o5)
         (includes o5 p2) (includes o5 p5) (includes o5 p6) (waiting o6)
         (includes o6 p7) (includes o6 p8) (includes o6 p10) (waiting o7)
         (includes o7 p3) (includes o7 p4) (includes o7 p7) (waiting o8)
         (includes o8 p3) (includes o8 p5) (includes o8 p10) (waiting o9)
         (includes o9 p4) (includes o9 p7) (includes o9 p9) (waiting o10)
         (includes o10 p1) (includes o10 p5) (includes o10 p6))
        (:goal
         (and (shipped o1)
              (shipped o2)
              (shipped o3)
              (shipped o4)
              (shipped o5)
              (shipped o6)
              (shipped o7)
              (shipped o8)
              (shipped o9)
              (shipped o10))))

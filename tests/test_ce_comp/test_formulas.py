from plan4past.utility.shortcuts import *
from plan4past.utility.compilation_manager import *

a = Atomic('a')
b = Atomic('b')
c = Atomic('c')
d = Atomic('d')
e = Atomic('e')
f = Atomic('f')

phi1 = Or(Historically(a), Since(b, Historically(c)))
phi2 = Or(Historically(a), Since(b, Historically(a)))
phi3 = Or(Historically(And(a, b)), Since(b, Historically(And(b, a))))
phi4 = Or(Historically(And(a, b)), Before(Or(b, Since(c, d))))
phi6 = Once(And(a, Before(Once(And(b, Before(Once(c)))))))
phi8 = a
phi9 = Before(a)
phi11 = Once(a)
phi12 = Historically(a)
phi13 = Since(a, b)
phi15 = And(a, b)
phi16 = And(a, b)
phi17 = Not(a)
phi18 = And(Once(a), Since(b, Before(Historically(c))))
phi19 = Once(And(a, Before(Once(b))))
# phi20 = land(a, Y(start()))

FORMULAS = [phi1, phi2, phi3, phi4, phi6, phi8, phi9,
            phi11, phi12, phi13, phi15, phi16, phi17, phi18, phi19]
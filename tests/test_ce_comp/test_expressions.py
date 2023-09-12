from plan4past.utility.shortcuts import *

a = Atomic('a')
b = Atomic('b')
c = Atomic('c')
d = Atomic('d')
e = Atomic('e')
f = Atomic('f')

def test_is_temporal():
    
    assert not isTemporal(a)
    assert not isTemporal(Not(a))
    assert not isTemporal(Or(a, b))
    assert not isTemporal(And(a, b))
    assert not isTemporal(And(Or(a, b), Or(c, Not(d))))

    assert isTemporal(Historically(a))
    assert isTemporal(Once(a))
    assert isTemporal(Before(a))
    assert isTemporal(Since(a, b))

    assert isTemporal(And(a, Or(b, And(Historically(d), e))))
    assert isTemporal(Once(And(a, Or(b, c))))

if __name__ == '__main__':
    test_is_temporal()
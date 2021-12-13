begin_version
3.FOND
end_version
begin_metric
0
end_metric
11
begin_variable
var0
-1
2
Atom clear(b1)
NegatedAtom clear(b1)
end_variable
begin_variable
var1
-1
2
Atom clear(b2)
NegatedAtom clear(b2)
end_variable
begin_variable
var2
-1
2
Atom clear(b3)
NegatedAtom clear(b3)
end_variable
begin_variable
var3
-1
2
Atom clear(b4)
NegatedAtom clear(b4)
end_variable
begin_variable
var4
-1
2
Atom clear(b5)
NegatedAtom clear(b5)
end_variable
begin_variable
var5
-1
2
Atom emptyhand()
NegatedAtom emptyhand()
end_variable
begin_variable
var6
-1
7
Atom holding(b1)
Atom on(b1, b1)
Atom on(b1, b2)
Atom on(b1, b3)
Atom on(b1, b4)
Atom on(b1, b5)
Atom on-table(b1)
end_variable
begin_variable
var7
-1
7
Atom holding(b2)
Atom on(b2, b1)
Atom on(b2, b2)
Atom on(b2, b3)
Atom on(b2, b4)
Atom on(b2, b5)
Atom on-table(b2)
end_variable
begin_variable
var8
-1
7
Atom holding(b3)
Atom on(b3, b1)
Atom on(b3, b2)
Atom on(b3, b3)
Atom on(b3, b4)
Atom on(b3, b5)
Atom on-table(b3)
end_variable
begin_variable
var9
-1
7
Atom holding(b4)
Atom on(b4, b1)
Atom on(b4, b2)
Atom on(b4, b3)
Atom on(b4, b4)
Atom on(b4, b5)
Atom on-table(b4)
end_variable
begin_variable
var10
-1
7
Atom holding(b5)
Atom on(b5, b1)
Atom on(b5, b2)
Atom on(b5, b3)
Atom on(b5, b4)
Atom on(b5, b5)
Atom on-table(b5)
end_variable
6
begin_mutex_group
6
5 0
6 0
7 0
8 0
9 0
10 0
end_mutex_group
begin_mutex_group
7
6 0
6 1
6 2
6 3
6 4
6 5
6 6
end_mutex_group
begin_mutex_group
7
7 0
7 1
7 2
7 3
7 4
7 5
7 6
end_mutex_group
begin_mutex_group
7
8 0
8 1
8 2
8 3
8 4
8 5
8 6
end_mutex_group
begin_mutex_group
7
9 0
9 1
9 2
9 3
9 4
9 5
9 6
end_mutex_group
begin_mutex_group
7
10 0
10 1
10 2
10 3
10 4
10 5
10 6
end_mutex_group
begin_state
1
1
0
0
1
0
6
6
5
2
1
end_state
begin_goal
8
1 0
4 0
5 0
6 3
7 4
8 6
9 1
10 6
end_goal
280
begin_operator
pick-tower b1 b1 b1
2
5 0
6 1
2
0
3
0 0 -1 0
0 5 0 1
0 6 1 0
0
end_operator
begin_operator
pick-tower b1 b2 b1
3
5 0
6 2
7 1
2
0
3
0 0 -1 0
0 5 0 1
0 7 1 0
0
end_operator
begin_operator
pick-tower b1 b2 b2
3
5 0
6 2
7 2
2
0
3
0 1 -1 0
0 5 0 1
0 7 2 0
0
end_operator
begin_operator
pick-tower b1 b2 b3
3
5 0
6 2
7 3
2
0
3
0 2 -1 0
0 5 0 1
0 7 3 0
0
end_operator
begin_operator
pick-tower b1 b2 b4
3
5 0
6 2
7 4
2
0
3
0 3 -1 0
0 5 0 1
0 7 4 0
0
end_operator
begin_operator
pick-tower b1 b2 b5
3
5 0
6 2
7 5
2
0
3
0 4 -1 0
0 5 0 1
0 7 5 0
0
end_operator
begin_operator
pick-tower b1 b3 b1
3
5 0
6 3
8 1
2
0
3
0 0 -1 0
0 5 0 1
0 8 1 0
0
end_operator
begin_operator
pick-tower b1 b3 b2
3
5 0
6 3
8 2
2
0
3
0 1 -1 0
0 5 0 1
0 8 2 0
0
end_operator
begin_operator
pick-tower b1 b3 b3
3
5 0
6 3
8 3
2
0
3
0 2 -1 0
0 5 0 1
0 8 3 0
0
end_operator
begin_operator
pick-tower b1 b3 b4
3
5 0
6 3
8 4
2
0
3
0 3 -1 0
0 5 0 1
0 8 4 0
0
end_operator
begin_operator
pick-tower b1 b3 b5
3
5 0
6 3
8 5
2
0
3
0 4 -1 0
0 5 0 1
0 8 5 0
0
end_operator
begin_operator
pick-tower b1 b4 b1
3
5 0
6 4
9 1
2
0
3
0 0 -1 0
0 5 0 1
0 9 1 0
0
end_operator
begin_operator
pick-tower b1 b4 b2
3
5 0
6 4
9 2
2
0
3
0 1 -1 0
0 5 0 1
0 9 2 0
0
end_operator
begin_operator
pick-tower b1 b4 b3
3
5 0
6 4
9 3
2
0
3
0 2 -1 0
0 5 0 1
0 9 3 0
0
end_operator
begin_operator
pick-tower b1 b4 b4
3
5 0
6 4
9 4
2
0
3
0 3 -1 0
0 5 0 1
0 9 4 0
0
end_operator
begin_operator
pick-tower b1 b4 b5
3
5 0
6 4
9 5
2
0
3
0 4 -1 0
0 5 0 1
0 9 5 0
0
end_operator
begin_operator
pick-tower b1 b5 b1
3
5 0
6 5
10 1
2
0
3
0 0 -1 0
0 5 0 1
0 10 1 0
0
end_operator
begin_operator
pick-tower b1 b5 b2
3
5 0
6 5
10 2
2
0
3
0 1 -1 0
0 5 0 1
0 10 2 0
0
end_operator
begin_operator
pick-tower b1 b5 b3
3
5 0
6 5
10 3
2
0
3
0 2 -1 0
0 5 0 1
0 10 3 0
0
end_operator
begin_operator
pick-tower b1 b5 b4
3
5 0
6 5
10 4
2
0
3
0 3 -1 0
0 5 0 1
0 10 4 0
0
end_operator
begin_operator
pick-tower b1 b5 b5
3
5 0
6 5
10 5
2
0
3
0 4 -1 0
0 5 0 1
0 10 5 0
0
end_operator
begin_operator
pick-tower b2 b1 b1
3
5 0
6 1
7 1
2
0
3
0 0 -1 0
0 5 0 1
0 6 1 0
0
end_operator
begin_operator
pick-tower b2 b1 b2
3
5 0
6 2
7 1
2
0
3
0 1 -1 0
0 5 0 1
0 6 2 0
0
end_operator
begin_operator
pick-tower b2 b1 b3
3
5 0
6 3
7 1
2
0
3
0 2 -1 0
0 5 0 1
0 6 3 0
0
end_operator
begin_operator
pick-tower b2 b1 b4
3
5 0
6 4
7 1
2
0
3
0 3 -1 0
0 5 0 1
0 6 4 0
0
end_operator
begin_operator
pick-tower b2 b1 b5
3
5 0
6 5
7 1
2
0
3
0 4 -1 0
0 5 0 1
0 6 5 0
0
end_operator
begin_operator
pick-tower b2 b2 b2
2
5 0
7 2
2
0
3
0 1 -1 0
0 5 0 1
0 7 2 0
0
end_operator
begin_operator
pick-tower b2 b3 b1
3
5 0
7 3
8 1
2
0
3
0 0 -1 0
0 5 0 1
0 8 1 0
0
end_operator
begin_operator
pick-tower b2 b3 b2
3
5 0
7 3
8 2
2
0
3
0 1 -1 0
0 5 0 1
0 8 2 0
0
end_operator
begin_operator
pick-tower b2 b3 b3
3
5 0
7 3
8 3
2
0
3
0 2 -1 0
0 5 0 1
0 8 3 0
0
end_operator
begin_operator
pick-tower b2 b3 b4
3
5 0
7 3
8 4
2
0
3
0 3 -1 0
0 5 0 1
0 8 4 0
0
end_operator
begin_operator
pick-tower b2 b3 b5
3
5 0
7 3
8 5
2
0
3
0 4 -1 0
0 5 0 1
0 8 5 0
0
end_operator
begin_operator
pick-tower b2 b4 b1
3
5 0
7 4
9 1
2
0
3
0 0 -1 0
0 5 0 1
0 9 1 0
0
end_operator
begin_operator
pick-tower b2 b4 b2
3
5 0
7 4
9 2
2
0
3
0 1 -1 0
0 5 0 1
0 9 2 0
0
end_operator
begin_operator
pick-tower b2 b4 b3
3
5 0
7 4
9 3
2
0
3
0 2 -1 0
0 5 0 1
0 9 3 0
0
end_operator
begin_operator
pick-tower b2 b4 b4
3
5 0
7 4
9 4
2
0
3
0 3 -1 0
0 5 0 1
0 9 4 0
0
end_operator
begin_operator
pick-tower b2 b4 b5
3
5 0
7 4
9 5
2
0
3
0 4 -1 0
0 5 0 1
0 9 5 0
0
end_operator
begin_operator
pick-tower b2 b5 b1
3
5 0
7 5
10 1
2
0
3
0 0 -1 0
0 5 0 1
0 10 1 0
0
end_operator
begin_operator
pick-tower b2 b5 b2
3
5 0
7 5
10 2
2
0
3
0 1 -1 0
0 5 0 1
0 10 2 0
0
end_operator
begin_operator
pick-tower b2 b5 b3
3
5 0
7 5
10 3
2
0
3
0 2 -1 0
0 5 0 1
0 10 3 0
0
end_operator
begin_operator
pick-tower b2 b5 b4
3
5 0
7 5
10 4
2
0
3
0 3 -1 0
0 5 0 1
0 10 4 0
0
end_operator
begin_operator
pick-tower b2 b5 b5
3
5 0
7 5
10 5
2
0
3
0 4 -1 0
0 5 0 1
0 10 5 0
0
end_operator
begin_operator
pick-tower b3 b1 b1
3
5 0
6 1
8 1
2
0
3
0 0 -1 0
0 5 0 1
0 6 1 0
0
end_operator
begin_operator
pick-tower b3 b1 b2
3
5 0
6 2
8 1
2
0
3
0 1 -1 0
0 5 0 1
0 6 2 0
0
end_operator
begin_operator
pick-tower b3 b1 b3
3
5 0
6 3
8 1
2
0
3
0 2 -1 0
0 5 0 1
0 6 3 0
0
end_operator
begin_operator
pick-tower b3 b1 b4
3
5 0
6 4
8 1
2
0
3
0 3 -1 0
0 5 0 1
0 6 4 0
0
end_operator
begin_operator
pick-tower b3 b1 b5
3
5 0
6 5
8 1
2
0
3
0 4 -1 0
0 5 0 1
0 6 5 0
0
end_operator
begin_operator
pick-tower b3 b2 b1
3
5 0
7 1
8 2
2
0
3
0 0 -1 0
0 5 0 1
0 7 1 0
0
end_operator
begin_operator
pick-tower b3 b2 b2
3
5 0
7 2
8 2
2
0
3
0 1 -1 0
0 5 0 1
0 7 2 0
0
end_operator
begin_operator
pick-tower b3 b2 b3
3
5 0
7 3
8 2
2
0
3
0 2 -1 0
0 5 0 1
0 7 3 0
0
end_operator
begin_operator
pick-tower b3 b2 b4
3
5 0
7 4
8 2
2
0
3
0 3 -1 0
0 5 0 1
0 7 4 0
0
end_operator
begin_operator
pick-tower b3 b2 b5
3
5 0
7 5
8 2
2
0
3
0 4 -1 0
0 5 0 1
0 7 5 0
0
end_operator
begin_operator
pick-tower b3 b3 b3
2
5 0
8 3
2
0
3
0 2 -1 0
0 5 0 1
0 8 3 0
0
end_operator
begin_operator
pick-tower b3 b4 b1
3
5 0
8 4
9 1
2
0
3
0 0 -1 0
0 5 0 1
0 9 1 0
0
end_operator
begin_operator
pick-tower b3 b4 b2
3
5 0
8 4
9 2
2
0
3
0 1 -1 0
0 5 0 1
0 9 2 0
0
end_operator
begin_operator
pick-tower b3 b4 b3
3
5 0
8 4
9 3
2
0
3
0 2 -1 0
0 5 0 1
0 9 3 0
0
end_operator
begin_operator
pick-tower b3 b4 b4
3
5 0
8 4
9 4
2
0
3
0 3 -1 0
0 5 0 1
0 9 4 0
0
end_operator
begin_operator
pick-tower b3 b4 b5
3
5 0
8 4
9 5
2
0
3
0 4 -1 0
0 5 0 1
0 9 5 0
0
end_operator
begin_operator
pick-tower b3 b5 b1
3
5 0
8 5
10 1
2
0
3
0 0 -1 0
0 5 0 1
0 10 1 0
0
end_operator
begin_operator
pick-tower b3 b5 b2
3
5 0
8 5
10 2
2
0
3
0 1 -1 0
0 5 0 1
0 10 2 0
0
end_operator
begin_operator
pick-tower b3 b5 b3
3
5 0
8 5
10 3
2
0
3
0 2 -1 0
0 5 0 1
0 10 3 0
0
end_operator
begin_operator
pick-tower b3 b5 b4
3
5 0
8 5
10 4
2
0
3
0 3 -1 0
0 5 0 1
0 10 4 0
0
end_operator
begin_operator
pick-tower b3 b5 b5
3
5 0
8 5
10 5
2
0
3
0 4 -1 0
0 5 0 1
0 10 5 0
0
end_operator
begin_operator
pick-tower b4 b1 b1
3
5 0
6 1
9 1
2
0
3
0 0 -1 0
0 5 0 1
0 6 1 0
0
end_operator
begin_operator
pick-tower b4 b1 b2
3
5 0
6 2
9 1
2
0
3
0 1 -1 0
0 5 0 1
0 6 2 0
0
end_operator
begin_operator
pick-tower b4 b1 b3
3
5 0
6 3
9 1
2
0
3
0 2 -1 0
0 5 0 1
0 6 3 0
0
end_operator
begin_operator
pick-tower b4 b1 b4
3
5 0
6 4
9 1
2
0
3
0 3 -1 0
0 5 0 1
0 6 4 0
0
end_operator
begin_operator
pick-tower b4 b1 b5
3
5 0
6 5
9 1
2
0
3
0 4 -1 0
0 5 0 1
0 6 5 0
0
end_operator
begin_operator
pick-tower b4 b2 b1
3
5 0
7 1
9 2
2
0
3
0 0 -1 0
0 5 0 1
0 7 1 0
0
end_operator
begin_operator
pick-tower b4 b2 b2
3
5 0
7 2
9 2
2
0
3
0 1 -1 0
0 5 0 1
0 7 2 0
0
end_operator
begin_operator
pick-tower b4 b2 b3
3
5 0
7 3
9 2
2
0
3
0 2 -1 0
0 5 0 1
0 7 3 0
0
end_operator
begin_operator
pick-tower b4 b2 b4
3
5 0
7 4
9 2
2
0
3
0 3 -1 0
0 5 0 1
0 7 4 0
0
end_operator
begin_operator
pick-tower b4 b2 b5
3
5 0
7 5
9 2
2
0
3
0 4 -1 0
0 5 0 1
0 7 5 0
0
end_operator
begin_operator
pick-tower b4 b3 b1
3
5 0
8 1
9 3
2
0
3
0 0 -1 0
0 5 0 1
0 8 1 0
0
end_operator
begin_operator
pick-tower b4 b3 b2
3
5 0
8 2
9 3
2
0
3
0 1 -1 0
0 5 0 1
0 8 2 0
0
end_operator
begin_operator
pick-tower b4 b3 b3
3
5 0
8 3
9 3
2
0
3
0 2 -1 0
0 5 0 1
0 8 3 0
0
end_operator
begin_operator
pick-tower b4 b3 b4
3
5 0
8 4
9 3
2
0
3
0 3 -1 0
0 5 0 1
0 8 4 0
0
end_operator
begin_operator
pick-tower b4 b3 b5
3
5 0
8 5
9 3
2
0
3
0 4 -1 0
0 5 0 1
0 8 5 0
0
end_operator
begin_operator
pick-tower b4 b4 b4
2
5 0
9 4
2
0
3
0 3 -1 0
0 5 0 1
0 9 4 0
0
end_operator
begin_operator
pick-tower b4 b5 b1
3
5 0
9 5
10 1
2
0
3
0 0 -1 0
0 5 0 1
0 10 1 0
0
end_operator
begin_operator
pick-tower b4 b5 b2
3
5 0
9 5
10 2
2
0
3
0 1 -1 0
0 5 0 1
0 10 2 0
0
end_operator
begin_operator
pick-tower b4 b5 b3
3
5 0
9 5
10 3
2
0
3
0 2 -1 0
0 5 0 1
0 10 3 0
0
end_operator
begin_operator
pick-tower b4 b5 b4
3
5 0
9 5
10 4
2
0
3
0 3 -1 0
0 5 0 1
0 10 4 0
0
end_operator
begin_operator
pick-tower b4 b5 b5
3
5 0
9 5
10 5
2
0
3
0 4 -1 0
0 5 0 1
0 10 5 0
0
end_operator
begin_operator
pick-tower b5 b1 b1
3
5 0
6 1
10 1
2
0
3
0 0 -1 0
0 5 0 1
0 6 1 0
0
end_operator
begin_operator
pick-tower b5 b1 b2
3
5 0
6 2
10 1
2
0
3
0 1 -1 0
0 5 0 1
0 6 2 0
0
end_operator
begin_operator
pick-tower b5 b1 b3
3
5 0
6 3
10 1
2
0
3
0 2 -1 0
0 5 0 1
0 6 3 0
0
end_operator
begin_operator
pick-tower b5 b1 b4
3
5 0
6 4
10 1
2
0
3
0 3 -1 0
0 5 0 1
0 6 4 0
0
end_operator
begin_operator
pick-tower b5 b1 b5
3
5 0
6 5
10 1
2
0
3
0 4 -1 0
0 5 0 1
0 6 5 0
0
end_operator
begin_operator
pick-tower b5 b2 b1
3
5 0
7 1
10 2
2
0
3
0 0 -1 0
0 5 0 1
0 7 1 0
0
end_operator
begin_operator
pick-tower b5 b2 b2
3
5 0
7 2
10 2
2
0
3
0 1 -1 0
0 5 0 1
0 7 2 0
0
end_operator
begin_operator
pick-tower b5 b2 b3
3
5 0
7 3
10 2
2
0
3
0 2 -1 0
0 5 0 1
0 7 3 0
0
end_operator
begin_operator
pick-tower b5 b2 b4
3
5 0
7 4
10 2
2
0
3
0 3 -1 0
0 5 0 1
0 7 4 0
0
end_operator
begin_operator
pick-tower b5 b2 b5
3
5 0
7 5
10 2
2
0
3
0 4 -1 0
0 5 0 1
0 7 5 0
0
end_operator
begin_operator
pick-tower b5 b3 b1
3
5 0
8 1
10 3
2
0
3
0 0 -1 0
0 5 0 1
0 8 1 0
0
end_operator
begin_operator
pick-tower b5 b3 b2
3
5 0
8 2
10 3
2
0
3
0 1 -1 0
0 5 0 1
0 8 2 0
0
end_operator
begin_operator
pick-tower b5 b3 b3
3
5 0
8 3
10 3
2
0
3
0 2 -1 0
0 5 0 1
0 8 3 0
0
end_operator
begin_operator
pick-tower b5 b3 b4
3
5 0
8 4
10 3
2
0
3
0 3 -1 0
0 5 0 1
0 8 4 0
0
end_operator
begin_operator
pick-tower b5 b3 b5
3
5 0
8 5
10 3
2
0
3
0 4 -1 0
0 5 0 1
0 8 5 0
0
end_operator
begin_operator
pick-tower b5 b4 b1
3
5 0
9 1
10 4
2
0
3
0 0 -1 0
0 5 0 1
0 9 1 0
0
end_operator
begin_operator
pick-tower b5 b4 b2
3
5 0
9 2
10 4
2
0
3
0 1 -1 0
0 5 0 1
0 9 2 0
0
end_operator
begin_operator
pick-tower b5 b4 b3
3
5 0
9 3
10 4
2
0
3
0 2 -1 0
0 5 0 1
0 9 3 0
0
end_operator
begin_operator
pick-tower b5 b4 b4
3
5 0
9 4
10 4
2
0
3
0 3 -1 0
0 5 0 1
0 9 4 0
0
end_operator
begin_operator
pick-tower b5 b4 b5
3
5 0
9 5
10 4
2
0
3
0 4 -1 0
0 5 0 1
0 9 5 0
0
end_operator
begin_operator
pick-tower b5 b5 b5
2
5 0
10 5
2
0
3
0 4 -1 0
0 5 0 1
0 10 5 0
0
end_operator
begin_operator
pick-up b1 b2
3
0 0
5 0
6 2
2
4
0 0 0 1
0 1 -1 0
0 5 0 1
0 6 2 0
2
0 1 -1 0
0 6 2 6
0
end_operator
begin_operator
pick-up b1 b3
3
0 0
5 0
6 3
2
4
0 0 0 1
0 2 -1 0
0 5 0 1
0 6 3 0
2
0 2 -1 0
0 6 3 6
0
end_operator
begin_operator
pick-up b1 b4
3
0 0
5 0
6 4
2
4
0 0 0 1
0 3 -1 0
0 5 0 1
0 6 4 0
2
0 3 -1 0
0 6 4 6
0
end_operator
begin_operator
pick-up b1 b5
3
0 0
5 0
6 5
2
4
0 0 0 1
0 4 -1 0
0 5 0 1
0 6 5 0
2
0 4 -1 0
0 6 5 6
0
end_operator
begin_operator
pick-up b2 b1
3
1 0
5 0
7 1
2
4
0 0 -1 0
0 1 0 1
0 5 0 1
0 7 1 0
2
0 0 -1 0
0 7 1 6
0
end_operator
begin_operator
pick-up b2 b3
3
1 0
5 0
7 3
2
4
0 1 0 1
0 2 -1 0
0 5 0 1
0 7 3 0
2
0 2 -1 0
0 7 3 6
0
end_operator
begin_operator
pick-up b2 b4
3
1 0
5 0
7 4
2
4
0 1 0 1
0 3 -1 0
0 5 0 1
0 7 4 0
2
0 3 -1 0
0 7 4 6
0
end_operator
begin_operator
pick-up b2 b5
3
1 0
5 0
7 5
2
4
0 1 0 1
0 4 -1 0
0 5 0 1
0 7 5 0
2
0 4 -1 0
0 7 5 6
0
end_operator
begin_operator
pick-up b3 b1
3
2 0
5 0
8 1
2
4
0 0 -1 0
0 2 0 1
0 5 0 1
0 8 1 0
2
0 0 -1 0
0 8 1 6
0
end_operator
begin_operator
pick-up b3 b2
3
2 0
5 0
8 2
2
4
0 1 -1 0
0 2 0 1
0 5 0 1
0 8 2 0
2
0 1 -1 0
0 8 2 6
0
end_operator
begin_operator
pick-up b3 b4
3
2 0
5 0
8 4
2
4
0 2 0 1
0 3 -1 0
0 5 0 1
0 8 4 0
2
0 3 -1 0
0 8 4 6
0
end_operator
begin_operator
pick-up b3 b5
3
2 0
5 0
8 5
2
4
0 2 0 1
0 4 -1 0
0 5 0 1
0 8 5 0
2
0 4 -1 0
0 8 5 6
0
end_operator
begin_operator
pick-up b4 b1
3
3 0
5 0
9 1
2
4
0 0 -1 0
0 3 0 1
0 5 0 1
0 9 1 0
2
0 0 -1 0
0 9 1 6
0
end_operator
begin_operator
pick-up b4 b2
3
3 0
5 0
9 2
2
4
0 1 -1 0
0 3 0 1
0 5 0 1
0 9 2 0
2
0 1 -1 0
0 9 2 6
0
end_operator
begin_operator
pick-up b4 b3
3
3 0
5 0
9 3
2
4
0 2 -1 0
0 3 0 1
0 5 0 1
0 9 3 0
2
0 2 -1 0
0 9 3 6
0
end_operator
begin_operator
pick-up b4 b5
3
3 0
5 0
9 5
2
4
0 3 0 1
0 4 -1 0
0 5 0 1
0 9 5 0
2
0 4 -1 0
0 9 5 6
0
end_operator
begin_operator
pick-up b5 b1
3
4 0
5 0
10 1
2
4
0 0 -1 0
0 4 0 1
0 5 0 1
0 10 1 0
2
0 0 -1 0
0 10 1 6
0
end_operator
begin_operator
pick-up b5 b2
3
4 0
5 0
10 2
2
4
0 1 -1 0
0 4 0 1
0 5 0 1
0 10 2 0
2
0 1 -1 0
0 10 2 6
0
end_operator
begin_operator
pick-up b5 b3
3
4 0
5 0
10 3
2
4
0 2 -1 0
0 4 0 1
0 5 0 1
0 10 3 0
2
0 2 -1 0
0 10 3 6
0
end_operator
begin_operator
pick-up b5 b4
3
4 0
5 0
10 4
2
4
0 3 -1 0
0 4 0 1
0 5 0 1
0 10 4 0
2
0 3 -1 0
0 10 4 6
0
end_operator
begin_operator
pick-up-from-table b1
3
0 0
5 0
6 6
2
0
2
0 5 0 1
0 6 6 0
0
end_operator
begin_operator
pick-up-from-table b2
3
1 0
5 0
7 6
2
0
2
0 5 0 1
0 7 6 0
0
end_operator
begin_operator
pick-up-from-table b3
3
2 0
5 0
8 6
2
0
2
0 5 0 1
0 8 6 0
0
end_operator
begin_operator
pick-up-from-table b4
3
3 0
5 0
9 6
2
0
2
0 5 0 1
0 9 6 0
0
end_operator
begin_operator
pick-up-from-table b5
3
4 0
5 0
10 6
2
0
2
0 5 0 1
0 10 6 0
0
end_operator
begin_operator
put-down b1
1
6 0
1
3
0 0 -1 0
0 5 -1 0
0 6 0 6
0
end_operator
begin_operator
put-down b2
1
7 0
1
3
0 1 -1 0
0 5 -1 0
0 7 0 6
0
end_operator
begin_operator
put-down b3
1
8 0
1
3
0 2 -1 0
0 5 -1 0
0 8 0 6
0
end_operator
begin_operator
put-down b4
1
9 0
1
3
0 3 -1 0
0 5 -1 0
0 9 0 6
0
end_operator
begin_operator
put-down b5
1
10 0
1
3
0 4 -1 0
0 5 -1 0
0 10 0 6
0
end_operator
begin_operator
put-on-block b1 b1
2
0 0
6 0
2
2
0 5 -1 0
0 6 0 1
2
0 5 -1 0
0 6 0 6
0
end_operator
begin_operator
put-on-block b1 b2
2
1 0
6 0
2
4
0 0 -1 0
0 1 0 1
0 5 -1 0
0 6 0 2
3
0 0 -1 0
0 5 -1 0
0 6 0 6
0
end_operator
begin_operator
put-on-block b1 b3
2
2 0
6 0
2
4
0 0 -1 0
0 2 0 1
0 5 -1 0
0 6 0 3
3
0 0 -1 0
0 5 -1 0
0 6 0 6
0
end_operator
begin_operator
put-on-block b1 b4
2
3 0
6 0
2
4
0 0 -1 0
0 3 0 1
0 5 -1 0
0 6 0 4
3
0 0 -1 0
0 5 -1 0
0 6 0 6
0
end_operator
begin_operator
put-on-block b1 b5
2
4 0
6 0
2
4
0 0 -1 0
0 4 0 1
0 5 -1 0
0 6 0 5
3
0 0 -1 0
0 5 -1 0
0 6 0 6
0
end_operator
begin_operator
put-on-block b2 b1
2
0 0
7 0
2
4
0 0 0 1
0 1 -1 0
0 5 -1 0
0 7 0 1
3
0 1 -1 0
0 5 -1 0
0 7 0 6
0
end_operator
begin_operator
put-on-block b2 b2
2
1 0
7 0
2
2
0 5 -1 0
0 7 0 2
2
0 5 -1 0
0 7 0 6
0
end_operator
begin_operator
put-on-block b2 b3
2
2 0
7 0
2
4
0 1 -1 0
0 2 0 1
0 5 -1 0
0 7 0 3
3
0 1 -1 0
0 5 -1 0
0 7 0 6
0
end_operator
begin_operator
put-on-block b2 b4
2
3 0
7 0
2
4
0 1 -1 0
0 3 0 1
0 5 -1 0
0 7 0 4
3
0 1 -1 0
0 5 -1 0
0 7 0 6
0
end_operator
begin_operator
put-on-block b2 b5
2
4 0
7 0
2
4
0 1 -1 0
0 4 0 1
0 5 -1 0
0 7 0 5
3
0 1 -1 0
0 5 -1 0
0 7 0 6
0
end_operator
begin_operator
put-on-block b3 b1
2
0 0
8 0
2
4
0 0 0 1
0 2 -1 0
0 5 -1 0
0 8 0 1
3
0 2 -1 0
0 5 -1 0
0 8 0 6
0
end_operator
begin_operator
put-on-block b3 b2
2
1 0
8 0
2
4
0 1 0 1
0 2 -1 0
0 5 -1 0
0 8 0 2
3
0 2 -1 0
0 5 -1 0
0 8 0 6
0
end_operator
begin_operator
put-on-block b3 b3
2
2 0
8 0
2
2
0 5 -1 0
0 8 0 3
2
0 5 -1 0
0 8 0 6
0
end_operator
begin_operator
put-on-block b3 b4
2
3 0
8 0
2
4
0 2 -1 0
0 3 0 1
0 5 -1 0
0 8 0 4
3
0 2 -1 0
0 5 -1 0
0 8 0 6
0
end_operator
begin_operator
put-on-block b3 b5
2
4 0
8 0
2
4
0 2 -1 0
0 4 0 1
0 5 -1 0
0 8 0 5
3
0 2 -1 0
0 5 -1 0
0 8 0 6
0
end_operator
begin_operator
put-on-block b4 b1
2
0 0
9 0
2
4
0 0 0 1
0 3 -1 0
0 5 -1 0
0 9 0 1
3
0 3 -1 0
0 5 -1 0
0 9 0 6
0
end_operator
begin_operator
put-on-block b4 b2
2
1 0
9 0
2
4
0 1 0 1
0 3 -1 0
0 5 -1 0
0 9 0 2
3
0 3 -1 0
0 5 -1 0
0 9 0 6
0
end_operator
begin_operator
put-on-block b4 b3
2
2 0
9 0
2
4
0 2 0 1
0 3 -1 0
0 5 -1 0
0 9 0 3
3
0 3 -1 0
0 5 -1 0
0 9 0 6
0
end_operator
begin_operator
put-on-block b4 b4
2
3 0
9 0
2
2
0 5 -1 0
0 9 0 4
2
0 5 -1 0
0 9 0 6
0
end_operator
begin_operator
put-on-block b4 b5
2
4 0
9 0
2
4
0 3 -1 0
0 4 0 1
0 5 -1 0
0 9 0 5
3
0 3 -1 0
0 5 -1 0
0 9 0 6
0
end_operator
begin_operator
put-on-block b5 b1
2
0 0
10 0
2
4
0 0 0 1
0 4 -1 0
0 5 -1 0
0 10 0 1
3
0 4 -1 0
0 5 -1 0
0 10 0 6
0
end_operator
begin_operator
put-on-block b5 b2
2
1 0
10 0
2
4
0 1 0 1
0 4 -1 0
0 5 -1 0
0 10 0 2
3
0 4 -1 0
0 5 -1 0
0 10 0 6
0
end_operator
begin_operator
put-on-block b5 b3
2
2 0
10 0
2
4
0 2 0 1
0 4 -1 0
0 5 -1 0
0 10 0 3
3
0 4 -1 0
0 5 -1 0
0 10 0 6
0
end_operator
begin_operator
put-on-block b5 b4
2
3 0
10 0
2
4
0 3 0 1
0 4 -1 0
0 5 -1 0
0 10 0 4
3
0 4 -1 0
0 5 -1 0
0 10 0 6
0
end_operator
begin_operator
put-on-block b5 b5
2
4 0
10 0
2
2
0 5 -1 0
0 10 0 5
2
0 5 -1 0
0 10 0 6
0
end_operator
begin_operator
put-tower-down b1 b2
2
6 2
7 0
1
2
0 5 -1 0
0 7 0 6
0
end_operator
begin_operator
put-tower-down b1 b3
2
6 3
8 0
1
2
0 5 -1 0
0 8 0 6
0
end_operator
begin_operator
put-tower-down b1 b4
2
6 4
9 0
1
2
0 5 -1 0
0 9 0 6
0
end_operator
begin_operator
put-tower-down b1 b5
2
6 5
10 0
1
2
0 5 -1 0
0 10 0 6
0
end_operator
begin_operator
put-tower-down b2 b1
2
6 0
7 1
1
2
0 5 -1 0
0 6 0 6
0
end_operator
begin_operator
put-tower-down b2 b3
2
7 3
8 0
1
2
0 5 -1 0
0 8 0 6
0
end_operator
begin_operator
put-tower-down b2 b4
2
7 4
9 0
1
2
0 5 -1 0
0 9 0 6
0
end_operator
begin_operator
put-tower-down b2 b5
2
7 5
10 0
1
2
0 5 -1 0
0 10 0 6
0
end_operator
begin_operator
put-tower-down b3 b1
2
6 0
8 1
1
2
0 5 -1 0
0 6 0 6
0
end_operator
begin_operator
put-tower-down b3 b2
2
7 0
8 2
1
2
0 5 -1 0
0 7 0 6
0
end_operator
begin_operator
put-tower-down b3 b4
2
8 4
9 0
1
2
0 5 -1 0
0 9 0 6
0
end_operator
begin_operator
put-tower-down b3 b5
2
8 5
10 0
1
2
0 5 -1 0
0 10 0 6
0
end_operator
begin_operator
put-tower-down b4 b1
2
6 0
9 1
1
2
0 5 -1 0
0 6 0 6
0
end_operator
begin_operator
put-tower-down b4 b2
2
7 0
9 2
1
2
0 5 -1 0
0 7 0 6
0
end_operator
begin_operator
put-tower-down b4 b3
2
8 0
9 3
1
2
0 5 -1 0
0 8 0 6
0
end_operator
begin_operator
put-tower-down b4 b5
2
9 5
10 0
1
2
0 5 -1 0
0 10 0 6
0
end_operator
begin_operator
put-tower-down b5 b1
2
6 0
10 1
1
2
0 5 -1 0
0 6 0 6
0
end_operator
begin_operator
put-tower-down b5 b2
2
7 0
10 2
1
2
0 5 -1 0
0 7 0 6
0
end_operator
begin_operator
put-tower-down b5 b3
2
8 0
10 3
1
2
0 5 -1 0
0 8 0 6
0
end_operator
begin_operator
put-tower-down b5 b4
2
9 0
10 4
1
2
0 5 -1 0
0 9 0 6
0
end_operator
begin_operator
put-tower-on-block b1 b2 b1
3
0 0
6 2
7 0
2
3
0 0 0 1
0 5 -1 0
0 7 0 1
2
0 5 -1 0
0 7 0 6
0
end_operator
begin_operator
put-tower-on-block b1 b2 b2
3
1 0
6 2
7 0
2
3
0 1 0 1
0 5 -1 0
0 7 0 2
2
0 5 -1 0
0 7 0 6
0
end_operator
begin_operator
put-tower-on-block b1 b2 b3
3
2 0
6 2
7 0
2
3
0 2 0 1
0 5 -1 0
0 7 0 3
2
0 5 -1 0
0 7 0 6
0
end_operator
begin_operator
put-tower-on-block b1 b2 b4
3
3 0
6 2
7 0
2
3
0 3 0 1
0 5 -1 0
0 7 0 4
2
0 5 -1 0
0 7 0 6
0
end_operator
begin_operator
put-tower-on-block b1 b2 b5
3
4 0
6 2
7 0
2
3
0 4 0 1
0 5 -1 0
0 7 0 5
2
0 5 -1 0
0 7 0 6
0
end_operator
begin_operator
put-tower-on-block b1 b3 b1
3
0 0
6 3
8 0
2
3
0 0 0 1
0 5 -1 0
0 8 0 1
2
0 5 -1 0
0 8 0 6
0
end_operator
begin_operator
put-tower-on-block b1 b3 b2
3
1 0
6 3
8 0
2
3
0 1 0 1
0 5 -1 0
0 8 0 2
2
0 5 -1 0
0 8 0 6
0
end_operator
begin_operator
put-tower-on-block b1 b3 b3
3
2 0
6 3
8 0
2
3
0 2 0 1
0 5 -1 0
0 8 0 3
2
0 5 -1 0
0 8 0 6
0
end_operator
begin_operator
put-tower-on-block b1 b3 b4
3
3 0
6 3
8 0
2
3
0 3 0 1
0 5 -1 0
0 8 0 4
2
0 5 -1 0
0 8 0 6
0
end_operator
begin_operator
put-tower-on-block b1 b3 b5
3
4 0
6 3
8 0
2
3
0 4 0 1
0 5 -1 0
0 8 0 5
2
0 5 -1 0
0 8 0 6
0
end_operator
begin_operator
put-tower-on-block b1 b4 b1
3
0 0
6 4
9 0
2
3
0 0 0 1
0 5 -1 0
0 9 0 1
2
0 5 -1 0
0 9 0 6
0
end_operator
begin_operator
put-tower-on-block b1 b4 b2
3
1 0
6 4
9 0
2
3
0 1 0 1
0 5 -1 0
0 9 0 2
2
0 5 -1 0
0 9 0 6
0
end_operator
begin_operator
put-tower-on-block b1 b4 b3
3
2 0
6 4
9 0
2
3
0 2 0 1
0 5 -1 0
0 9 0 3
2
0 5 -1 0
0 9 0 6
0
end_operator
begin_operator
put-tower-on-block b1 b4 b4
3
3 0
6 4
9 0
2
3
0 3 0 1
0 5 -1 0
0 9 0 4
2
0 5 -1 0
0 9 0 6
0
end_operator
begin_operator
put-tower-on-block b1 b4 b5
3
4 0
6 4
9 0
2
3
0 4 0 1
0 5 -1 0
0 9 0 5
2
0 5 -1 0
0 9 0 6
0
end_operator
begin_operator
put-tower-on-block b1 b5 b1
3
0 0
6 5
10 0
2
3
0 0 0 1
0 5 -1 0
0 10 0 1
2
0 5 -1 0
0 10 0 6
0
end_operator
begin_operator
put-tower-on-block b1 b5 b2
3
1 0
6 5
10 0
2
3
0 1 0 1
0 5 -1 0
0 10 0 2
2
0 5 -1 0
0 10 0 6
0
end_operator
begin_operator
put-tower-on-block b1 b5 b3
3
2 0
6 5
10 0
2
3
0 2 0 1
0 5 -1 0
0 10 0 3
2
0 5 -1 0
0 10 0 6
0
end_operator
begin_operator
put-tower-on-block b1 b5 b4
3
3 0
6 5
10 0
2
3
0 3 0 1
0 5 -1 0
0 10 0 4
2
0 5 -1 0
0 10 0 6
0
end_operator
begin_operator
put-tower-on-block b1 b5 b5
3
4 0
6 5
10 0
2
3
0 4 0 1
0 5 -1 0
0 10 0 5
2
0 5 -1 0
0 10 0 6
0
end_operator
begin_operator
put-tower-on-block b2 b1 b1
3
0 0
6 0
7 1
2
3
0 0 0 1
0 5 -1 0
0 6 0 1
2
0 5 -1 0
0 6 0 6
0
end_operator
begin_operator
put-tower-on-block b2 b1 b2
3
1 0
6 0
7 1
2
3
0 1 0 1
0 5 -1 0
0 6 0 2
2
0 5 -1 0
0 6 0 6
0
end_operator
begin_operator
put-tower-on-block b2 b1 b3
3
2 0
6 0
7 1
2
3
0 2 0 1
0 5 -1 0
0 6 0 3
2
0 5 -1 0
0 6 0 6
0
end_operator
begin_operator
put-tower-on-block b2 b1 b4
3
3 0
6 0
7 1
2
3
0 3 0 1
0 5 -1 0
0 6 0 4
2
0 5 -1 0
0 6 0 6
0
end_operator
begin_operator
put-tower-on-block b2 b1 b5
3
4 0
6 0
7 1
2
3
0 4 0 1
0 5 -1 0
0 6 0 5
2
0 5 -1 0
0 6 0 6
0
end_operator
begin_operator
put-tower-on-block b2 b3 b1
3
0 0
7 3
8 0
2
3
0 0 0 1
0 5 -1 0
0 8 0 1
2
0 5 -1 0
0 8 0 6
0
end_operator
begin_operator
put-tower-on-block b2 b3 b2
3
1 0
7 3
8 0
2
3
0 1 0 1
0 5 -1 0
0 8 0 2
2
0 5 -1 0
0 8 0 6
0
end_operator
begin_operator
put-tower-on-block b2 b3 b3
3
2 0
7 3
8 0
2
3
0 2 0 1
0 5 -1 0
0 8 0 3
2
0 5 -1 0
0 8 0 6
0
end_operator
begin_operator
put-tower-on-block b2 b3 b4
3
3 0
7 3
8 0
2
3
0 3 0 1
0 5 -1 0
0 8 0 4
2
0 5 -1 0
0 8 0 6
0
end_operator
begin_operator
put-tower-on-block b2 b3 b5
3
4 0
7 3
8 0
2
3
0 4 0 1
0 5 -1 0
0 8 0 5
2
0 5 -1 0
0 8 0 6
0
end_operator
begin_operator
put-tower-on-block b2 b4 b1
3
0 0
7 4
9 0
2
3
0 0 0 1
0 5 -1 0
0 9 0 1
2
0 5 -1 0
0 9 0 6
0
end_operator
begin_operator
put-tower-on-block b2 b4 b2
3
1 0
7 4
9 0
2
3
0 1 0 1
0 5 -1 0
0 9 0 2
2
0 5 -1 0
0 9 0 6
0
end_operator
begin_operator
put-tower-on-block b2 b4 b3
3
2 0
7 4
9 0
2
3
0 2 0 1
0 5 -1 0
0 9 0 3
2
0 5 -1 0
0 9 0 6
0
end_operator
begin_operator
put-tower-on-block b2 b4 b4
3
3 0
7 4
9 0
2
3
0 3 0 1
0 5 -1 0
0 9 0 4
2
0 5 -1 0
0 9 0 6
0
end_operator
begin_operator
put-tower-on-block b2 b4 b5
3
4 0
7 4
9 0
2
3
0 4 0 1
0 5 -1 0
0 9 0 5
2
0 5 -1 0
0 9 0 6
0
end_operator
begin_operator
put-tower-on-block b2 b5 b1
3
0 0
7 5
10 0
2
3
0 0 0 1
0 5 -1 0
0 10 0 1
2
0 5 -1 0
0 10 0 6
0
end_operator
begin_operator
put-tower-on-block b2 b5 b2
3
1 0
7 5
10 0
2
3
0 1 0 1
0 5 -1 0
0 10 0 2
2
0 5 -1 0
0 10 0 6
0
end_operator
begin_operator
put-tower-on-block b2 b5 b3
3
2 0
7 5
10 0
2
3
0 2 0 1
0 5 -1 0
0 10 0 3
2
0 5 -1 0
0 10 0 6
0
end_operator
begin_operator
put-tower-on-block b2 b5 b4
3
3 0
7 5
10 0
2
3
0 3 0 1
0 5 -1 0
0 10 0 4
2
0 5 -1 0
0 10 0 6
0
end_operator
begin_operator
put-tower-on-block b2 b5 b5
3
4 0
7 5
10 0
2
3
0 4 0 1
0 5 -1 0
0 10 0 5
2
0 5 -1 0
0 10 0 6
0
end_operator
begin_operator
put-tower-on-block b3 b1 b1
3
0 0
6 0
8 1
2
3
0 0 0 1
0 5 -1 0
0 6 0 1
2
0 5 -1 0
0 6 0 6
0
end_operator
begin_operator
put-tower-on-block b3 b1 b2
3
1 0
6 0
8 1
2
3
0 1 0 1
0 5 -1 0
0 6 0 2
2
0 5 -1 0
0 6 0 6
0
end_operator
begin_operator
put-tower-on-block b3 b1 b3
3
2 0
6 0
8 1
2
3
0 2 0 1
0 5 -1 0
0 6 0 3
2
0 5 -1 0
0 6 0 6
0
end_operator
begin_operator
put-tower-on-block b3 b1 b4
3
3 0
6 0
8 1
2
3
0 3 0 1
0 5 -1 0
0 6 0 4
2
0 5 -1 0
0 6 0 6
0
end_operator
begin_operator
put-tower-on-block b3 b1 b5
3
4 0
6 0
8 1
2
3
0 4 0 1
0 5 -1 0
0 6 0 5
2
0 5 -1 0
0 6 0 6
0
end_operator
begin_operator
put-tower-on-block b3 b2 b1
3
0 0
7 0
8 2
2
3
0 0 0 1
0 5 -1 0
0 7 0 1
2
0 5 -1 0
0 7 0 6
0
end_operator
begin_operator
put-tower-on-block b3 b2 b2
3
1 0
7 0
8 2
2
3
0 1 0 1
0 5 -1 0
0 7 0 2
2
0 5 -1 0
0 7 0 6
0
end_operator
begin_operator
put-tower-on-block b3 b2 b3
3
2 0
7 0
8 2
2
3
0 2 0 1
0 5 -1 0
0 7 0 3
2
0 5 -1 0
0 7 0 6
0
end_operator
begin_operator
put-tower-on-block b3 b2 b4
3
3 0
7 0
8 2
2
3
0 3 0 1
0 5 -1 0
0 7 0 4
2
0 5 -1 0
0 7 0 6
0
end_operator
begin_operator
put-tower-on-block b3 b2 b5
3
4 0
7 0
8 2
2
3
0 4 0 1
0 5 -1 0
0 7 0 5
2
0 5 -1 0
0 7 0 6
0
end_operator
begin_operator
put-tower-on-block b3 b4 b1
3
0 0
8 4
9 0
2
3
0 0 0 1
0 5 -1 0
0 9 0 1
2
0 5 -1 0
0 9 0 6
0
end_operator
begin_operator
put-tower-on-block b3 b4 b2
3
1 0
8 4
9 0
2
3
0 1 0 1
0 5 -1 0
0 9 0 2
2
0 5 -1 0
0 9 0 6
0
end_operator
begin_operator
put-tower-on-block b3 b4 b3
3
2 0
8 4
9 0
2
3
0 2 0 1
0 5 -1 0
0 9 0 3
2
0 5 -1 0
0 9 0 6
0
end_operator
begin_operator
put-tower-on-block b3 b4 b4
3
3 0
8 4
9 0
2
3
0 3 0 1
0 5 -1 0
0 9 0 4
2
0 5 -1 0
0 9 0 6
0
end_operator
begin_operator
put-tower-on-block b3 b4 b5
3
4 0
8 4
9 0
2
3
0 4 0 1
0 5 -1 0
0 9 0 5
2
0 5 -1 0
0 9 0 6
0
end_operator
begin_operator
put-tower-on-block b3 b5 b1
3
0 0
8 5
10 0
2
3
0 0 0 1
0 5 -1 0
0 10 0 1
2
0 5 -1 0
0 10 0 6
0
end_operator
begin_operator
put-tower-on-block b3 b5 b2
3
1 0
8 5
10 0
2
3
0 1 0 1
0 5 -1 0
0 10 0 2
2
0 5 -1 0
0 10 0 6
0
end_operator
begin_operator
put-tower-on-block b3 b5 b3
3
2 0
8 5
10 0
2
3
0 2 0 1
0 5 -1 0
0 10 0 3
2
0 5 -1 0
0 10 0 6
0
end_operator
begin_operator
put-tower-on-block b3 b5 b4
3
3 0
8 5
10 0
2
3
0 3 0 1
0 5 -1 0
0 10 0 4
2
0 5 -1 0
0 10 0 6
0
end_operator
begin_operator
put-tower-on-block b3 b5 b5
3
4 0
8 5
10 0
2
3
0 4 0 1
0 5 -1 0
0 10 0 5
2
0 5 -1 0
0 10 0 6
0
end_operator
begin_operator
put-tower-on-block b4 b1 b1
3
0 0
6 0
9 1
2
3
0 0 0 1
0 5 -1 0
0 6 0 1
2
0 5 -1 0
0 6 0 6
0
end_operator
begin_operator
put-tower-on-block b4 b1 b2
3
1 0
6 0
9 1
2
3
0 1 0 1
0 5 -1 0
0 6 0 2
2
0 5 -1 0
0 6 0 6
0
end_operator
begin_operator
put-tower-on-block b4 b1 b3
3
2 0
6 0
9 1
2
3
0 2 0 1
0 5 -1 0
0 6 0 3
2
0 5 -1 0
0 6 0 6
0
end_operator
begin_operator
put-tower-on-block b4 b1 b4
3
3 0
6 0
9 1
2
3
0 3 0 1
0 5 -1 0
0 6 0 4
2
0 5 -1 0
0 6 0 6
0
end_operator
begin_operator
put-tower-on-block b4 b1 b5
3
4 0
6 0
9 1
2
3
0 4 0 1
0 5 -1 0
0 6 0 5
2
0 5 -1 0
0 6 0 6
0
end_operator
begin_operator
put-tower-on-block b4 b2 b1
3
0 0
7 0
9 2
2
3
0 0 0 1
0 5 -1 0
0 7 0 1
2
0 5 -1 0
0 7 0 6
0
end_operator
begin_operator
put-tower-on-block b4 b2 b2
3
1 0
7 0
9 2
2
3
0 1 0 1
0 5 -1 0
0 7 0 2
2
0 5 -1 0
0 7 0 6
0
end_operator
begin_operator
put-tower-on-block b4 b2 b3
3
2 0
7 0
9 2
2
3
0 2 0 1
0 5 -1 0
0 7 0 3
2
0 5 -1 0
0 7 0 6
0
end_operator
begin_operator
put-tower-on-block b4 b2 b4
3
3 0
7 0
9 2
2
3
0 3 0 1
0 5 -1 0
0 7 0 4
2
0 5 -1 0
0 7 0 6
0
end_operator
begin_operator
put-tower-on-block b4 b2 b5
3
4 0
7 0
9 2
2
3
0 4 0 1
0 5 -1 0
0 7 0 5
2
0 5 -1 0
0 7 0 6
0
end_operator
begin_operator
put-tower-on-block b4 b3 b1
3
0 0
8 0
9 3
2
3
0 0 0 1
0 5 -1 0
0 8 0 1
2
0 5 -1 0
0 8 0 6
0
end_operator
begin_operator
put-tower-on-block b4 b3 b2
3
1 0
8 0
9 3
2
3
0 1 0 1
0 5 -1 0
0 8 0 2
2
0 5 -1 0
0 8 0 6
0
end_operator
begin_operator
put-tower-on-block b4 b3 b3
3
2 0
8 0
9 3
2
3
0 2 0 1
0 5 -1 0
0 8 0 3
2
0 5 -1 0
0 8 0 6
0
end_operator
begin_operator
put-tower-on-block b4 b3 b4
3
3 0
8 0
9 3
2
3
0 3 0 1
0 5 -1 0
0 8 0 4
2
0 5 -1 0
0 8 0 6
0
end_operator
begin_operator
put-tower-on-block b4 b3 b5
3
4 0
8 0
9 3
2
3
0 4 0 1
0 5 -1 0
0 8 0 5
2
0 5 -1 0
0 8 0 6
0
end_operator
begin_operator
put-tower-on-block b4 b5 b1
3
0 0
9 5
10 0
2
3
0 0 0 1
0 5 -1 0
0 10 0 1
2
0 5 -1 0
0 10 0 6
0
end_operator
begin_operator
put-tower-on-block b4 b5 b2
3
1 0
9 5
10 0
2
3
0 1 0 1
0 5 -1 0
0 10 0 2
2
0 5 -1 0
0 10 0 6
0
end_operator
begin_operator
put-tower-on-block b4 b5 b3
3
2 0
9 5
10 0
2
3
0 2 0 1
0 5 -1 0
0 10 0 3
2
0 5 -1 0
0 10 0 6
0
end_operator
begin_operator
put-tower-on-block b4 b5 b4
3
3 0
9 5
10 0
2
3
0 3 0 1
0 5 -1 0
0 10 0 4
2
0 5 -1 0
0 10 0 6
0
end_operator
begin_operator
put-tower-on-block b4 b5 b5
3
4 0
9 5
10 0
2
3
0 4 0 1
0 5 -1 0
0 10 0 5
2
0 5 -1 0
0 10 0 6
0
end_operator
begin_operator
put-tower-on-block b5 b1 b1
3
0 0
6 0
10 1
2
3
0 0 0 1
0 5 -1 0
0 6 0 1
2
0 5 -1 0
0 6 0 6
0
end_operator
begin_operator
put-tower-on-block b5 b1 b2
3
1 0
6 0
10 1
2
3
0 1 0 1
0 5 -1 0
0 6 0 2
2
0 5 -1 0
0 6 0 6
0
end_operator
begin_operator
put-tower-on-block b5 b1 b3
3
2 0
6 0
10 1
2
3
0 2 0 1
0 5 -1 0
0 6 0 3
2
0 5 -1 0
0 6 0 6
0
end_operator
begin_operator
put-tower-on-block b5 b1 b4
3
3 0
6 0
10 1
2
3
0 3 0 1
0 5 -1 0
0 6 0 4
2
0 5 -1 0
0 6 0 6
0
end_operator
begin_operator
put-tower-on-block b5 b1 b5
3
4 0
6 0
10 1
2
3
0 4 0 1
0 5 -1 0
0 6 0 5
2
0 5 -1 0
0 6 0 6
0
end_operator
begin_operator
put-tower-on-block b5 b2 b1
3
0 0
7 0
10 2
2
3
0 0 0 1
0 5 -1 0
0 7 0 1
2
0 5 -1 0
0 7 0 6
0
end_operator
begin_operator
put-tower-on-block b5 b2 b2
3
1 0
7 0
10 2
2
3
0 1 0 1
0 5 -1 0
0 7 0 2
2
0 5 -1 0
0 7 0 6
0
end_operator
begin_operator
put-tower-on-block b5 b2 b3
3
2 0
7 0
10 2
2
3
0 2 0 1
0 5 -1 0
0 7 0 3
2
0 5 -1 0
0 7 0 6
0
end_operator
begin_operator
put-tower-on-block b5 b2 b4
3
3 0
7 0
10 2
2
3
0 3 0 1
0 5 -1 0
0 7 0 4
2
0 5 -1 0
0 7 0 6
0
end_operator
begin_operator
put-tower-on-block b5 b2 b5
3
4 0
7 0
10 2
2
3
0 4 0 1
0 5 -1 0
0 7 0 5
2
0 5 -1 0
0 7 0 6
0
end_operator
begin_operator
put-tower-on-block b5 b3 b1
3
0 0
8 0
10 3
2
3
0 0 0 1
0 5 -1 0
0 8 0 1
2
0 5 -1 0
0 8 0 6
0
end_operator
begin_operator
put-tower-on-block b5 b3 b2
3
1 0
8 0
10 3
2
3
0 1 0 1
0 5 -1 0
0 8 0 2
2
0 5 -1 0
0 8 0 6
0
end_operator
begin_operator
put-tower-on-block b5 b3 b3
3
2 0
8 0
10 3
2
3
0 2 0 1
0 5 -1 0
0 8 0 3
2
0 5 -1 0
0 8 0 6
0
end_operator
begin_operator
put-tower-on-block b5 b3 b4
3
3 0
8 0
10 3
2
3
0 3 0 1
0 5 -1 0
0 8 0 4
2
0 5 -1 0
0 8 0 6
0
end_operator
begin_operator
put-tower-on-block b5 b3 b5
3
4 0
8 0
10 3
2
3
0 4 0 1
0 5 -1 0
0 8 0 5
2
0 5 -1 0
0 8 0 6
0
end_operator
begin_operator
put-tower-on-block b5 b4 b1
3
0 0
9 0
10 4
2
3
0 0 0 1
0 5 -1 0
0 9 0 1
2
0 5 -1 0
0 9 0 6
0
end_operator
begin_operator
put-tower-on-block b5 b4 b2
3
1 0
9 0
10 4
2
3
0 1 0 1
0 5 -1 0
0 9 0 2
2
0 5 -1 0
0 9 0 6
0
end_operator
begin_operator
put-tower-on-block b5 b4 b3
3
2 0
9 0
10 4
2
3
0 2 0 1
0 5 -1 0
0 9 0 3
2
0 5 -1 0
0 9 0 6
0
end_operator
begin_operator
put-tower-on-block b5 b4 b4
3
3 0
9 0
10 4
2
3
0 3 0 1
0 5 -1 0
0 9 0 4
2
0 5 -1 0
0 9 0 6
0
end_operator
begin_operator
put-tower-on-block b5 b4 b5
3
4 0
9 0
10 4
2
3
0 4 0 1
0 5 -1 0
0 9 0 5
2
0 5 -1 0
0 9 0 6
0
end_operator
0

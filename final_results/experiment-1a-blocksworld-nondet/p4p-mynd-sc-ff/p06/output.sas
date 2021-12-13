begin_version
3.FOND
end_version
begin_metric
0
end_metric
22
begin_variable
var0
-1
2
Atom act()
NegatedAtom act()
end_variable
begin_variable
var1
-1
2
Atom clear(b1)
NegatedAtom clear(b1)
end_variable
begin_variable
var2
-1
2
Atom clear(b2)
NegatedAtom clear(b2)
end_variable
begin_variable
var3
-1
2
Atom clear(b3)
NegatedAtom clear(b3)
end_variable
begin_variable
var4
-1
2
Atom clear(b4)
NegatedAtom clear(b4)
end_variable
begin_variable
var5
-1
2
Atom clear(b5)
NegatedAtom clear(b5)
end_variable
begin_variable
var6
-1
2
Atom clear(b6)
NegatedAtom clear(b6)
end_variable
begin_variable
var7
-1
2
Atom emptyhand()
NegatedAtom emptyhand()
end_variable
begin_variable
var8
-1
8
Atom holding(b1)
Atom on(b1, b1)
Atom on(b1, b2)
Atom on(b1, b3)
Atom on(b1, b4)
Atom on(b1, b5)
Atom on(b1, b6)
Atom on-table(b1)
end_variable
begin_variable
var9
-1
8
Atom holding(b2)
Atom on(b2, b1)
Atom on(b2, b2)
Atom on(b2, b3)
Atom on(b2, b4)
Atom on(b2, b5)
Atom on(b2, b6)
Atom on-table(b2)
end_variable
begin_variable
var10
-1
8
Atom holding(b3)
Atom on(b3, b1)
Atom on(b3, b2)
Atom on(b3, b3)
Atom on(b3, b4)
Atom on(b3, b5)
Atom on(b3, b6)
Atom on-table(b3)
end_variable
begin_variable
var11
-1
8
Atom holding(b4)
Atom on(b4, b1)
Atom on(b4, b2)
Atom on(b4, b3)
Atom on(b4, b4)
Atom on(b4, b5)
Atom on(b4, b6)
Atom on-table(b4)
end_variable
begin_variable
var12
-1
8
Atom holding(b5)
Atom on(b5, b1)
Atom on(b5, b2)
Atom on(b5, b3)
Atom on(b5, b4)
Atom on(b5, b5)
Atom on(b5, b6)
Atom on-table(b5)
end_variable
begin_variable
var13
-1
8
Atom holding(b6)
Atom on(b6, b1)
Atom on(b6, b2)
Atom on(b6, b3)
Atom on(b6, b4)
Atom on(b6, b5)
Atom on(b6, b6)
Atom on-table(b6)
end_variable
begin_variable
var14
-1
2
Atom oon_b1_b2-and-yoon_b2_b3()
NegatedAtom oon_b1_b2-and-yoon_b2_b3()
end_variable
begin_variable
var15
-1
2
Atom oon_b2_b3()
NegatedAtom oon_b2_b3()
end_variable
begin_variable
var16
0
2
Atom val_on_b1_b2()
NegatedAtom val_on_b1_b2()
end_variable
begin_variable
var17
0
2
Atom val_on_b1_b2-and-yoon_b2_b3()
NegatedAtom val_on_b1_b2-and-yoon_b2_b3()
end_variable
begin_variable
var18
0
2
Atom val_on_b2_b3()
NegatedAtom val_on_b2_b3()
end_variable
begin_variable
var19
0
2
Atom val_oon_b1_b2-and-yoon_b2_b3()
NegatedAtom val_oon_b1_b2-and-yoon_b2_b3()
end_variable
begin_variable
var20
0
2
Atom val_oon_b2_b3()
NegatedAtom val_oon_b2_b3()
end_variable
begin_variable
var21
0
2
Atom val_yoon_b2_b3()
NegatedAtom val_yoon_b2_b3()
end_variable
7
begin_mutex_group
7
7 0
8 0
9 0
10 0
11 0
12 0
13 0
end_mutex_group
begin_mutex_group
8
8 0
8 1
8 2
8 3
8 4
8 5
8 6
8 7
end_mutex_group
begin_mutex_group
8
9 0
9 1
9 2
9 3
9 4
9 5
9 6
9 7
end_mutex_group
begin_mutex_group
8
10 0
10 1
10 2
10 3
10 4
10 5
10 6
10 7
end_mutex_group
begin_mutex_group
8
11 0
11 1
11 2
11 3
11 4
11 5
11 6
11 7
end_mutex_group
begin_mutex_group
8
12 0
12 1
12 2
12 3
12 4
12 5
12 6
12 7
end_mutex_group
begin_mutex_group
8
13 0
13 1
13 2
13 3
13 4
13 5
13 6
13 7
end_mutex_group
begin_state
0
0
0
0
0
0
0
0
7
7
7
7
7
7
1
1
1
1
1
1
1
1
end_state
begin_goal
2
0 0
19 0
end_goal
481
begin_operator
pick-tower b1 b1 b1
3
0 0
7 0
8 1
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 7 0 1
0 8 1 0
0
end_operator
begin_operator
pick-tower b1 b2 b1
4
0 0
7 0
8 2
9 1
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 7 0 1
0 9 1 0
0
end_operator
begin_operator
pick-tower b1 b2 b2
4
0 0
7 0
8 2
9 2
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 7 0 1
0 9 2 0
0
end_operator
begin_operator
pick-tower b1 b2 b3
4
0 0
7 0
8 2
9 3
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 7 0 1
0 9 3 0
0
end_operator
begin_operator
pick-tower b1 b2 b4
4
0 0
7 0
8 2
9 4
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 7 0 1
0 9 4 0
0
end_operator
begin_operator
pick-tower b1 b2 b5
4
0 0
7 0
8 2
9 5
2
1
0 0 0 1
4
0 0 0 1
0 5 -1 0
0 7 0 1
0 9 5 0
0
end_operator
begin_operator
pick-tower b1 b2 b6
4
0 0
7 0
8 2
9 6
2
1
0 0 0 1
4
0 0 0 1
0 6 -1 0
0 7 0 1
0 9 6 0
0
end_operator
begin_operator
pick-tower b1 b3 b1
4
0 0
7 0
8 3
10 1
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 7 0 1
0 10 1 0
0
end_operator
begin_operator
pick-tower b1 b3 b2
4
0 0
7 0
8 3
10 2
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 7 0 1
0 10 2 0
0
end_operator
begin_operator
pick-tower b1 b3 b3
4
0 0
7 0
8 3
10 3
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 7 0 1
0 10 3 0
0
end_operator
begin_operator
pick-tower b1 b3 b4
4
0 0
7 0
8 3
10 4
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 7 0 1
0 10 4 0
0
end_operator
begin_operator
pick-tower b1 b3 b5
4
0 0
7 0
8 3
10 5
2
1
0 0 0 1
4
0 0 0 1
0 5 -1 0
0 7 0 1
0 10 5 0
0
end_operator
begin_operator
pick-tower b1 b3 b6
4
0 0
7 0
8 3
10 6
2
1
0 0 0 1
4
0 0 0 1
0 6 -1 0
0 7 0 1
0 10 6 0
0
end_operator
begin_operator
pick-tower b1 b4 b1
4
0 0
7 0
8 4
11 1
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 7 0 1
0 11 1 0
0
end_operator
begin_operator
pick-tower b1 b4 b2
4
0 0
7 0
8 4
11 2
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 7 0 1
0 11 2 0
0
end_operator
begin_operator
pick-tower b1 b4 b3
4
0 0
7 0
8 4
11 3
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 7 0 1
0 11 3 0
0
end_operator
begin_operator
pick-tower b1 b4 b4
4
0 0
7 0
8 4
11 4
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 7 0 1
0 11 4 0
0
end_operator
begin_operator
pick-tower b1 b4 b5
4
0 0
7 0
8 4
11 5
2
1
0 0 0 1
4
0 0 0 1
0 5 -1 0
0 7 0 1
0 11 5 0
0
end_operator
begin_operator
pick-tower b1 b4 b6
4
0 0
7 0
8 4
11 6
2
1
0 0 0 1
4
0 0 0 1
0 6 -1 0
0 7 0 1
0 11 6 0
0
end_operator
begin_operator
pick-tower b1 b5 b1
4
0 0
7 0
8 5
12 1
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 7 0 1
0 12 1 0
0
end_operator
begin_operator
pick-tower b1 b5 b2
4
0 0
7 0
8 5
12 2
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 7 0 1
0 12 2 0
0
end_operator
begin_operator
pick-tower b1 b5 b3
4
0 0
7 0
8 5
12 3
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 7 0 1
0 12 3 0
0
end_operator
begin_operator
pick-tower b1 b5 b4
4
0 0
7 0
8 5
12 4
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 7 0 1
0 12 4 0
0
end_operator
begin_operator
pick-tower b1 b5 b5
4
0 0
7 0
8 5
12 5
2
1
0 0 0 1
4
0 0 0 1
0 5 -1 0
0 7 0 1
0 12 5 0
0
end_operator
begin_operator
pick-tower b1 b5 b6
4
0 0
7 0
8 5
12 6
2
1
0 0 0 1
4
0 0 0 1
0 6 -1 0
0 7 0 1
0 12 6 0
0
end_operator
begin_operator
pick-tower b1 b6 b1
4
0 0
7 0
8 6
13 1
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 7 0 1
0 13 1 0
0
end_operator
begin_operator
pick-tower b1 b6 b2
4
0 0
7 0
8 6
13 2
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 7 0 1
0 13 2 0
0
end_operator
begin_operator
pick-tower b1 b6 b3
4
0 0
7 0
8 6
13 3
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 7 0 1
0 13 3 0
0
end_operator
begin_operator
pick-tower b1 b6 b4
4
0 0
7 0
8 6
13 4
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 7 0 1
0 13 4 0
0
end_operator
begin_operator
pick-tower b1 b6 b5
4
0 0
7 0
8 6
13 5
2
1
0 0 0 1
4
0 0 0 1
0 5 -1 0
0 7 0 1
0 13 5 0
0
end_operator
begin_operator
pick-tower b1 b6 b6
4
0 0
7 0
8 6
13 6
2
1
0 0 0 1
4
0 0 0 1
0 6 -1 0
0 7 0 1
0 13 6 0
0
end_operator
begin_operator
pick-tower b2 b1 b1
4
0 0
7 0
8 1
9 1
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 7 0 1
0 8 1 0
0
end_operator
begin_operator
pick-tower b2 b1 b2
4
0 0
7 0
8 2
9 1
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 7 0 1
0 8 2 0
0
end_operator
begin_operator
pick-tower b2 b1 b3
4
0 0
7 0
8 3
9 1
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 7 0 1
0 8 3 0
0
end_operator
begin_operator
pick-tower b2 b1 b4
4
0 0
7 0
8 4
9 1
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 7 0 1
0 8 4 0
0
end_operator
begin_operator
pick-tower b2 b1 b5
4
0 0
7 0
8 5
9 1
2
1
0 0 0 1
4
0 0 0 1
0 5 -1 0
0 7 0 1
0 8 5 0
0
end_operator
begin_operator
pick-tower b2 b1 b6
4
0 0
7 0
8 6
9 1
2
1
0 0 0 1
4
0 0 0 1
0 6 -1 0
0 7 0 1
0 8 6 0
0
end_operator
begin_operator
pick-tower b2 b2 b2
3
0 0
7 0
9 2
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 7 0 1
0 9 2 0
0
end_operator
begin_operator
pick-tower b2 b3 b1
4
0 0
7 0
9 3
10 1
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 7 0 1
0 10 1 0
0
end_operator
begin_operator
pick-tower b2 b3 b2
4
0 0
7 0
9 3
10 2
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 7 0 1
0 10 2 0
0
end_operator
begin_operator
pick-tower b2 b3 b3
4
0 0
7 0
9 3
10 3
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 7 0 1
0 10 3 0
0
end_operator
begin_operator
pick-tower b2 b3 b4
4
0 0
7 0
9 3
10 4
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 7 0 1
0 10 4 0
0
end_operator
begin_operator
pick-tower b2 b3 b5
4
0 0
7 0
9 3
10 5
2
1
0 0 0 1
4
0 0 0 1
0 5 -1 0
0 7 0 1
0 10 5 0
0
end_operator
begin_operator
pick-tower b2 b3 b6
4
0 0
7 0
9 3
10 6
2
1
0 0 0 1
4
0 0 0 1
0 6 -1 0
0 7 0 1
0 10 6 0
0
end_operator
begin_operator
pick-tower b2 b4 b1
4
0 0
7 0
9 4
11 1
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 7 0 1
0 11 1 0
0
end_operator
begin_operator
pick-tower b2 b4 b2
4
0 0
7 0
9 4
11 2
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 7 0 1
0 11 2 0
0
end_operator
begin_operator
pick-tower b2 b4 b3
4
0 0
7 0
9 4
11 3
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 7 0 1
0 11 3 0
0
end_operator
begin_operator
pick-tower b2 b4 b4
4
0 0
7 0
9 4
11 4
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 7 0 1
0 11 4 0
0
end_operator
begin_operator
pick-tower b2 b4 b5
4
0 0
7 0
9 4
11 5
2
1
0 0 0 1
4
0 0 0 1
0 5 -1 0
0 7 0 1
0 11 5 0
0
end_operator
begin_operator
pick-tower b2 b4 b6
4
0 0
7 0
9 4
11 6
2
1
0 0 0 1
4
0 0 0 1
0 6 -1 0
0 7 0 1
0 11 6 0
0
end_operator
begin_operator
pick-tower b2 b5 b1
4
0 0
7 0
9 5
12 1
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 7 0 1
0 12 1 0
0
end_operator
begin_operator
pick-tower b2 b5 b2
4
0 0
7 0
9 5
12 2
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 7 0 1
0 12 2 0
0
end_operator
begin_operator
pick-tower b2 b5 b3
4
0 0
7 0
9 5
12 3
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 7 0 1
0 12 3 0
0
end_operator
begin_operator
pick-tower b2 b5 b4
4
0 0
7 0
9 5
12 4
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 7 0 1
0 12 4 0
0
end_operator
begin_operator
pick-tower b2 b5 b5
4
0 0
7 0
9 5
12 5
2
1
0 0 0 1
4
0 0 0 1
0 5 -1 0
0 7 0 1
0 12 5 0
0
end_operator
begin_operator
pick-tower b2 b5 b6
4
0 0
7 0
9 5
12 6
2
1
0 0 0 1
4
0 0 0 1
0 6 -1 0
0 7 0 1
0 12 6 0
0
end_operator
begin_operator
pick-tower b2 b6 b1
4
0 0
7 0
9 6
13 1
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 7 0 1
0 13 1 0
0
end_operator
begin_operator
pick-tower b2 b6 b2
4
0 0
7 0
9 6
13 2
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 7 0 1
0 13 2 0
0
end_operator
begin_operator
pick-tower b2 b6 b3
4
0 0
7 0
9 6
13 3
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 7 0 1
0 13 3 0
0
end_operator
begin_operator
pick-tower b2 b6 b4
4
0 0
7 0
9 6
13 4
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 7 0 1
0 13 4 0
0
end_operator
begin_operator
pick-tower b2 b6 b5
4
0 0
7 0
9 6
13 5
2
1
0 0 0 1
4
0 0 0 1
0 5 -1 0
0 7 0 1
0 13 5 0
0
end_operator
begin_operator
pick-tower b2 b6 b6
4
0 0
7 0
9 6
13 6
2
1
0 0 0 1
4
0 0 0 1
0 6 -1 0
0 7 0 1
0 13 6 0
0
end_operator
begin_operator
pick-tower b3 b1 b1
4
0 0
7 0
8 1
10 1
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 7 0 1
0 8 1 0
0
end_operator
begin_operator
pick-tower b3 b1 b2
4
0 0
7 0
8 2
10 1
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 7 0 1
0 8 2 0
0
end_operator
begin_operator
pick-tower b3 b1 b3
4
0 0
7 0
8 3
10 1
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 7 0 1
0 8 3 0
0
end_operator
begin_operator
pick-tower b3 b1 b4
4
0 0
7 0
8 4
10 1
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 7 0 1
0 8 4 0
0
end_operator
begin_operator
pick-tower b3 b1 b5
4
0 0
7 0
8 5
10 1
2
1
0 0 0 1
4
0 0 0 1
0 5 -1 0
0 7 0 1
0 8 5 0
0
end_operator
begin_operator
pick-tower b3 b1 b6
4
0 0
7 0
8 6
10 1
2
1
0 0 0 1
4
0 0 0 1
0 6 -1 0
0 7 0 1
0 8 6 0
0
end_operator
begin_operator
pick-tower b3 b2 b1
4
0 0
7 0
9 1
10 2
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 7 0 1
0 9 1 0
0
end_operator
begin_operator
pick-tower b3 b2 b2
4
0 0
7 0
9 2
10 2
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 7 0 1
0 9 2 0
0
end_operator
begin_operator
pick-tower b3 b2 b3
4
0 0
7 0
9 3
10 2
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 7 0 1
0 9 3 0
0
end_operator
begin_operator
pick-tower b3 b2 b4
4
0 0
7 0
9 4
10 2
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 7 0 1
0 9 4 0
0
end_operator
begin_operator
pick-tower b3 b2 b5
4
0 0
7 0
9 5
10 2
2
1
0 0 0 1
4
0 0 0 1
0 5 -1 0
0 7 0 1
0 9 5 0
0
end_operator
begin_operator
pick-tower b3 b2 b6
4
0 0
7 0
9 6
10 2
2
1
0 0 0 1
4
0 0 0 1
0 6 -1 0
0 7 0 1
0 9 6 0
0
end_operator
begin_operator
pick-tower b3 b3 b3
3
0 0
7 0
10 3
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 7 0 1
0 10 3 0
0
end_operator
begin_operator
pick-tower b3 b4 b1
4
0 0
7 0
10 4
11 1
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 7 0 1
0 11 1 0
0
end_operator
begin_operator
pick-tower b3 b4 b2
4
0 0
7 0
10 4
11 2
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 7 0 1
0 11 2 0
0
end_operator
begin_operator
pick-tower b3 b4 b3
4
0 0
7 0
10 4
11 3
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 7 0 1
0 11 3 0
0
end_operator
begin_operator
pick-tower b3 b4 b4
4
0 0
7 0
10 4
11 4
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 7 0 1
0 11 4 0
0
end_operator
begin_operator
pick-tower b3 b4 b5
4
0 0
7 0
10 4
11 5
2
1
0 0 0 1
4
0 0 0 1
0 5 -1 0
0 7 0 1
0 11 5 0
0
end_operator
begin_operator
pick-tower b3 b4 b6
4
0 0
7 0
10 4
11 6
2
1
0 0 0 1
4
0 0 0 1
0 6 -1 0
0 7 0 1
0 11 6 0
0
end_operator
begin_operator
pick-tower b3 b5 b1
4
0 0
7 0
10 5
12 1
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 7 0 1
0 12 1 0
0
end_operator
begin_operator
pick-tower b3 b5 b2
4
0 0
7 0
10 5
12 2
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 7 0 1
0 12 2 0
0
end_operator
begin_operator
pick-tower b3 b5 b3
4
0 0
7 0
10 5
12 3
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 7 0 1
0 12 3 0
0
end_operator
begin_operator
pick-tower b3 b5 b4
4
0 0
7 0
10 5
12 4
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 7 0 1
0 12 4 0
0
end_operator
begin_operator
pick-tower b3 b5 b5
4
0 0
7 0
10 5
12 5
2
1
0 0 0 1
4
0 0 0 1
0 5 -1 0
0 7 0 1
0 12 5 0
0
end_operator
begin_operator
pick-tower b3 b5 b6
4
0 0
7 0
10 5
12 6
2
1
0 0 0 1
4
0 0 0 1
0 6 -1 0
0 7 0 1
0 12 6 0
0
end_operator
begin_operator
pick-tower b3 b6 b1
4
0 0
7 0
10 6
13 1
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 7 0 1
0 13 1 0
0
end_operator
begin_operator
pick-tower b3 b6 b2
4
0 0
7 0
10 6
13 2
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 7 0 1
0 13 2 0
0
end_operator
begin_operator
pick-tower b3 b6 b3
4
0 0
7 0
10 6
13 3
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 7 0 1
0 13 3 0
0
end_operator
begin_operator
pick-tower b3 b6 b4
4
0 0
7 0
10 6
13 4
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 7 0 1
0 13 4 0
0
end_operator
begin_operator
pick-tower b3 b6 b5
4
0 0
7 0
10 6
13 5
2
1
0 0 0 1
4
0 0 0 1
0 5 -1 0
0 7 0 1
0 13 5 0
0
end_operator
begin_operator
pick-tower b3 b6 b6
4
0 0
7 0
10 6
13 6
2
1
0 0 0 1
4
0 0 0 1
0 6 -1 0
0 7 0 1
0 13 6 0
0
end_operator
begin_operator
pick-tower b4 b1 b1
4
0 0
7 0
8 1
11 1
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 7 0 1
0 8 1 0
0
end_operator
begin_operator
pick-tower b4 b1 b2
4
0 0
7 0
8 2
11 1
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 7 0 1
0 8 2 0
0
end_operator
begin_operator
pick-tower b4 b1 b3
4
0 0
7 0
8 3
11 1
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 7 0 1
0 8 3 0
0
end_operator
begin_operator
pick-tower b4 b1 b4
4
0 0
7 0
8 4
11 1
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 7 0 1
0 8 4 0
0
end_operator
begin_operator
pick-tower b4 b1 b5
4
0 0
7 0
8 5
11 1
2
1
0 0 0 1
4
0 0 0 1
0 5 -1 0
0 7 0 1
0 8 5 0
0
end_operator
begin_operator
pick-tower b4 b1 b6
4
0 0
7 0
8 6
11 1
2
1
0 0 0 1
4
0 0 0 1
0 6 -1 0
0 7 0 1
0 8 6 0
0
end_operator
begin_operator
pick-tower b4 b2 b1
4
0 0
7 0
9 1
11 2
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 7 0 1
0 9 1 0
0
end_operator
begin_operator
pick-tower b4 b2 b2
4
0 0
7 0
9 2
11 2
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 7 0 1
0 9 2 0
0
end_operator
begin_operator
pick-tower b4 b2 b3
4
0 0
7 0
9 3
11 2
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 7 0 1
0 9 3 0
0
end_operator
begin_operator
pick-tower b4 b2 b4
4
0 0
7 0
9 4
11 2
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 7 0 1
0 9 4 0
0
end_operator
begin_operator
pick-tower b4 b2 b5
4
0 0
7 0
9 5
11 2
2
1
0 0 0 1
4
0 0 0 1
0 5 -1 0
0 7 0 1
0 9 5 0
0
end_operator
begin_operator
pick-tower b4 b2 b6
4
0 0
7 0
9 6
11 2
2
1
0 0 0 1
4
0 0 0 1
0 6 -1 0
0 7 0 1
0 9 6 0
0
end_operator
begin_operator
pick-tower b4 b3 b1
4
0 0
7 0
10 1
11 3
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 7 0 1
0 10 1 0
0
end_operator
begin_operator
pick-tower b4 b3 b2
4
0 0
7 0
10 2
11 3
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 7 0 1
0 10 2 0
0
end_operator
begin_operator
pick-tower b4 b3 b3
4
0 0
7 0
10 3
11 3
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 7 0 1
0 10 3 0
0
end_operator
begin_operator
pick-tower b4 b3 b4
4
0 0
7 0
10 4
11 3
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 7 0 1
0 10 4 0
0
end_operator
begin_operator
pick-tower b4 b3 b5
4
0 0
7 0
10 5
11 3
2
1
0 0 0 1
4
0 0 0 1
0 5 -1 0
0 7 0 1
0 10 5 0
0
end_operator
begin_operator
pick-tower b4 b3 b6
4
0 0
7 0
10 6
11 3
2
1
0 0 0 1
4
0 0 0 1
0 6 -1 0
0 7 0 1
0 10 6 0
0
end_operator
begin_operator
pick-tower b4 b4 b4
3
0 0
7 0
11 4
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 7 0 1
0 11 4 0
0
end_operator
begin_operator
pick-tower b4 b5 b1
4
0 0
7 0
11 5
12 1
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 7 0 1
0 12 1 0
0
end_operator
begin_operator
pick-tower b4 b5 b2
4
0 0
7 0
11 5
12 2
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 7 0 1
0 12 2 0
0
end_operator
begin_operator
pick-tower b4 b5 b3
4
0 0
7 0
11 5
12 3
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 7 0 1
0 12 3 0
0
end_operator
begin_operator
pick-tower b4 b5 b4
4
0 0
7 0
11 5
12 4
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 7 0 1
0 12 4 0
0
end_operator
begin_operator
pick-tower b4 b5 b5
4
0 0
7 0
11 5
12 5
2
1
0 0 0 1
4
0 0 0 1
0 5 -1 0
0 7 0 1
0 12 5 0
0
end_operator
begin_operator
pick-tower b4 b5 b6
4
0 0
7 0
11 5
12 6
2
1
0 0 0 1
4
0 0 0 1
0 6 -1 0
0 7 0 1
0 12 6 0
0
end_operator
begin_operator
pick-tower b4 b6 b1
4
0 0
7 0
11 6
13 1
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 7 0 1
0 13 1 0
0
end_operator
begin_operator
pick-tower b4 b6 b2
4
0 0
7 0
11 6
13 2
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 7 0 1
0 13 2 0
0
end_operator
begin_operator
pick-tower b4 b6 b3
4
0 0
7 0
11 6
13 3
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 7 0 1
0 13 3 0
0
end_operator
begin_operator
pick-tower b4 b6 b4
4
0 0
7 0
11 6
13 4
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 7 0 1
0 13 4 0
0
end_operator
begin_operator
pick-tower b4 b6 b5
4
0 0
7 0
11 6
13 5
2
1
0 0 0 1
4
0 0 0 1
0 5 -1 0
0 7 0 1
0 13 5 0
0
end_operator
begin_operator
pick-tower b4 b6 b6
4
0 0
7 0
11 6
13 6
2
1
0 0 0 1
4
0 0 0 1
0 6 -1 0
0 7 0 1
0 13 6 0
0
end_operator
begin_operator
pick-tower b5 b1 b1
4
0 0
7 0
8 1
12 1
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 7 0 1
0 8 1 0
0
end_operator
begin_operator
pick-tower b5 b1 b2
4
0 0
7 0
8 2
12 1
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 7 0 1
0 8 2 0
0
end_operator
begin_operator
pick-tower b5 b1 b3
4
0 0
7 0
8 3
12 1
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 7 0 1
0 8 3 0
0
end_operator
begin_operator
pick-tower b5 b1 b4
4
0 0
7 0
8 4
12 1
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 7 0 1
0 8 4 0
0
end_operator
begin_operator
pick-tower b5 b1 b5
4
0 0
7 0
8 5
12 1
2
1
0 0 0 1
4
0 0 0 1
0 5 -1 0
0 7 0 1
0 8 5 0
0
end_operator
begin_operator
pick-tower b5 b1 b6
4
0 0
7 0
8 6
12 1
2
1
0 0 0 1
4
0 0 0 1
0 6 -1 0
0 7 0 1
0 8 6 0
0
end_operator
begin_operator
pick-tower b5 b2 b1
4
0 0
7 0
9 1
12 2
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 7 0 1
0 9 1 0
0
end_operator
begin_operator
pick-tower b5 b2 b2
4
0 0
7 0
9 2
12 2
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 7 0 1
0 9 2 0
0
end_operator
begin_operator
pick-tower b5 b2 b3
4
0 0
7 0
9 3
12 2
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 7 0 1
0 9 3 0
0
end_operator
begin_operator
pick-tower b5 b2 b4
4
0 0
7 0
9 4
12 2
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 7 0 1
0 9 4 0
0
end_operator
begin_operator
pick-tower b5 b2 b5
4
0 0
7 0
9 5
12 2
2
1
0 0 0 1
4
0 0 0 1
0 5 -1 0
0 7 0 1
0 9 5 0
0
end_operator
begin_operator
pick-tower b5 b2 b6
4
0 0
7 0
9 6
12 2
2
1
0 0 0 1
4
0 0 0 1
0 6 -1 0
0 7 0 1
0 9 6 0
0
end_operator
begin_operator
pick-tower b5 b3 b1
4
0 0
7 0
10 1
12 3
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 7 0 1
0 10 1 0
0
end_operator
begin_operator
pick-tower b5 b3 b2
4
0 0
7 0
10 2
12 3
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 7 0 1
0 10 2 0
0
end_operator
begin_operator
pick-tower b5 b3 b3
4
0 0
7 0
10 3
12 3
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 7 0 1
0 10 3 0
0
end_operator
begin_operator
pick-tower b5 b3 b4
4
0 0
7 0
10 4
12 3
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 7 0 1
0 10 4 0
0
end_operator
begin_operator
pick-tower b5 b3 b5
4
0 0
7 0
10 5
12 3
2
1
0 0 0 1
4
0 0 0 1
0 5 -1 0
0 7 0 1
0 10 5 0
0
end_operator
begin_operator
pick-tower b5 b3 b6
4
0 0
7 0
10 6
12 3
2
1
0 0 0 1
4
0 0 0 1
0 6 -1 0
0 7 0 1
0 10 6 0
0
end_operator
begin_operator
pick-tower b5 b4 b1
4
0 0
7 0
11 1
12 4
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 7 0 1
0 11 1 0
0
end_operator
begin_operator
pick-tower b5 b4 b2
4
0 0
7 0
11 2
12 4
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 7 0 1
0 11 2 0
0
end_operator
begin_operator
pick-tower b5 b4 b3
4
0 0
7 0
11 3
12 4
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 7 0 1
0 11 3 0
0
end_operator
begin_operator
pick-tower b5 b4 b4
4
0 0
7 0
11 4
12 4
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 7 0 1
0 11 4 0
0
end_operator
begin_operator
pick-tower b5 b4 b5
4
0 0
7 0
11 5
12 4
2
1
0 0 0 1
4
0 0 0 1
0 5 -1 0
0 7 0 1
0 11 5 0
0
end_operator
begin_operator
pick-tower b5 b4 b6
4
0 0
7 0
11 6
12 4
2
1
0 0 0 1
4
0 0 0 1
0 6 -1 0
0 7 0 1
0 11 6 0
0
end_operator
begin_operator
pick-tower b5 b5 b5
3
0 0
7 0
12 5
2
1
0 0 0 1
4
0 0 0 1
0 5 -1 0
0 7 0 1
0 12 5 0
0
end_operator
begin_operator
pick-tower b5 b6 b1
4
0 0
7 0
12 6
13 1
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 7 0 1
0 13 1 0
0
end_operator
begin_operator
pick-tower b5 b6 b2
4
0 0
7 0
12 6
13 2
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 7 0 1
0 13 2 0
0
end_operator
begin_operator
pick-tower b5 b6 b3
4
0 0
7 0
12 6
13 3
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 7 0 1
0 13 3 0
0
end_operator
begin_operator
pick-tower b5 b6 b4
4
0 0
7 0
12 6
13 4
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 7 0 1
0 13 4 0
0
end_operator
begin_operator
pick-tower b5 b6 b5
4
0 0
7 0
12 6
13 5
2
1
0 0 0 1
4
0 0 0 1
0 5 -1 0
0 7 0 1
0 13 5 0
0
end_operator
begin_operator
pick-tower b5 b6 b6
4
0 0
7 0
12 6
13 6
2
1
0 0 0 1
4
0 0 0 1
0 6 -1 0
0 7 0 1
0 13 6 0
0
end_operator
begin_operator
pick-tower b6 b1 b1
4
0 0
7 0
8 1
13 1
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 7 0 1
0 8 1 0
0
end_operator
begin_operator
pick-tower b6 b1 b2
4
0 0
7 0
8 2
13 1
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 7 0 1
0 8 2 0
0
end_operator
begin_operator
pick-tower b6 b1 b3
4
0 0
7 0
8 3
13 1
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 7 0 1
0 8 3 0
0
end_operator
begin_operator
pick-tower b6 b1 b4
4
0 0
7 0
8 4
13 1
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 7 0 1
0 8 4 0
0
end_operator
begin_operator
pick-tower b6 b1 b5
4
0 0
7 0
8 5
13 1
2
1
0 0 0 1
4
0 0 0 1
0 5 -1 0
0 7 0 1
0 8 5 0
0
end_operator
begin_operator
pick-tower b6 b1 b6
4
0 0
7 0
8 6
13 1
2
1
0 0 0 1
4
0 0 0 1
0 6 -1 0
0 7 0 1
0 8 6 0
0
end_operator
begin_operator
pick-tower b6 b2 b1
4
0 0
7 0
9 1
13 2
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 7 0 1
0 9 1 0
0
end_operator
begin_operator
pick-tower b6 b2 b2
4
0 0
7 0
9 2
13 2
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 7 0 1
0 9 2 0
0
end_operator
begin_operator
pick-tower b6 b2 b3
4
0 0
7 0
9 3
13 2
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 7 0 1
0 9 3 0
0
end_operator
begin_operator
pick-tower b6 b2 b4
4
0 0
7 0
9 4
13 2
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 7 0 1
0 9 4 0
0
end_operator
begin_operator
pick-tower b6 b2 b5
4
0 0
7 0
9 5
13 2
2
1
0 0 0 1
4
0 0 0 1
0 5 -1 0
0 7 0 1
0 9 5 0
0
end_operator
begin_operator
pick-tower b6 b2 b6
4
0 0
7 0
9 6
13 2
2
1
0 0 0 1
4
0 0 0 1
0 6 -1 0
0 7 0 1
0 9 6 0
0
end_operator
begin_operator
pick-tower b6 b3 b1
4
0 0
7 0
10 1
13 3
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 7 0 1
0 10 1 0
0
end_operator
begin_operator
pick-tower b6 b3 b2
4
0 0
7 0
10 2
13 3
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 7 0 1
0 10 2 0
0
end_operator
begin_operator
pick-tower b6 b3 b3
4
0 0
7 0
10 3
13 3
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 7 0 1
0 10 3 0
0
end_operator
begin_operator
pick-tower b6 b3 b4
4
0 0
7 0
10 4
13 3
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 7 0 1
0 10 4 0
0
end_operator
begin_operator
pick-tower b6 b3 b5
4
0 0
7 0
10 5
13 3
2
1
0 0 0 1
4
0 0 0 1
0 5 -1 0
0 7 0 1
0 10 5 0
0
end_operator
begin_operator
pick-tower b6 b3 b6
4
0 0
7 0
10 6
13 3
2
1
0 0 0 1
4
0 0 0 1
0 6 -1 0
0 7 0 1
0 10 6 0
0
end_operator
begin_operator
pick-tower b6 b4 b1
4
0 0
7 0
11 1
13 4
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 7 0 1
0 11 1 0
0
end_operator
begin_operator
pick-tower b6 b4 b2
4
0 0
7 0
11 2
13 4
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 7 0 1
0 11 2 0
0
end_operator
begin_operator
pick-tower b6 b4 b3
4
0 0
7 0
11 3
13 4
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 7 0 1
0 11 3 0
0
end_operator
begin_operator
pick-tower b6 b4 b4
4
0 0
7 0
11 4
13 4
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 7 0 1
0 11 4 0
0
end_operator
begin_operator
pick-tower b6 b4 b5
4
0 0
7 0
11 5
13 4
2
1
0 0 0 1
4
0 0 0 1
0 5 -1 0
0 7 0 1
0 11 5 0
0
end_operator
begin_operator
pick-tower b6 b4 b6
4
0 0
7 0
11 6
13 4
2
1
0 0 0 1
4
0 0 0 1
0 6 -1 0
0 7 0 1
0 11 6 0
0
end_operator
begin_operator
pick-tower b6 b5 b1
4
0 0
7 0
12 1
13 5
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 7 0 1
0 12 1 0
0
end_operator
begin_operator
pick-tower b6 b5 b2
4
0 0
7 0
12 2
13 5
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 7 0 1
0 12 2 0
0
end_operator
begin_operator
pick-tower b6 b5 b3
4
0 0
7 0
12 3
13 5
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 7 0 1
0 12 3 0
0
end_operator
begin_operator
pick-tower b6 b5 b4
4
0 0
7 0
12 4
13 5
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 7 0 1
0 12 4 0
0
end_operator
begin_operator
pick-tower b6 b5 b5
4
0 0
7 0
12 5
13 5
2
1
0 0 0 1
4
0 0 0 1
0 5 -1 0
0 7 0 1
0 12 5 0
0
end_operator
begin_operator
pick-tower b6 b5 b6
4
0 0
7 0
12 6
13 5
2
1
0 0 0 1
4
0 0 0 1
0 6 -1 0
0 7 0 1
0 12 6 0
0
end_operator
begin_operator
pick-tower b6 b6 b6
3
0 0
7 0
13 6
2
1
0 0 0 1
4
0 0 0 1
0 6 -1 0
0 7 0 1
0 13 6 0
0
end_operator
begin_operator
pick-up b1 b1
4
0 0
1 0
7 0
8 1
2
3
0 0 0 1
0 7 0 1
0 8 1 0
2
0 0 0 1
0 8 1 7
0
end_operator
begin_operator
pick-up b1 b2
4
0 0
1 0
7 0
8 2
2
5
0 0 0 1
0 1 0 1
0 2 -1 0
0 7 0 1
0 8 2 0
3
0 0 0 1
0 2 -1 0
0 8 2 7
0
end_operator
begin_operator
pick-up b1 b3
4
0 0
1 0
7 0
8 3
2
5
0 0 0 1
0 1 0 1
0 3 -1 0
0 7 0 1
0 8 3 0
3
0 0 0 1
0 3 -1 0
0 8 3 7
0
end_operator
begin_operator
pick-up b1 b4
4
0 0
1 0
7 0
8 4
2
5
0 0 0 1
0 1 0 1
0 4 -1 0
0 7 0 1
0 8 4 0
3
0 0 0 1
0 4 -1 0
0 8 4 7
0
end_operator
begin_operator
pick-up b1 b5
4
0 0
1 0
7 0
8 5
2
5
0 0 0 1
0 1 0 1
0 5 -1 0
0 7 0 1
0 8 5 0
3
0 0 0 1
0 5 -1 0
0 8 5 7
0
end_operator
begin_operator
pick-up b1 b6
4
0 0
1 0
7 0
8 6
2
5
0 0 0 1
0 1 0 1
0 6 -1 0
0 7 0 1
0 8 6 0
3
0 0 0 1
0 6 -1 0
0 8 6 7
0
end_operator
begin_operator
pick-up b2 b1
4
0 0
2 0
7 0
9 1
2
5
0 0 0 1
0 1 -1 0
0 2 0 1
0 7 0 1
0 9 1 0
3
0 0 0 1
0 1 -1 0
0 9 1 7
0
end_operator
begin_operator
pick-up b2 b2
4
0 0
2 0
7 0
9 2
2
3
0 0 0 1
0 7 0 1
0 9 2 0
2
0 0 0 1
0 9 2 7
0
end_operator
begin_operator
pick-up b2 b3
4
0 0
2 0
7 0
9 3
2
5
0 0 0 1
0 2 0 1
0 3 -1 0
0 7 0 1
0 9 3 0
3
0 0 0 1
0 3 -1 0
0 9 3 7
0
end_operator
begin_operator
pick-up b2 b4
4
0 0
2 0
7 0
9 4
2
5
0 0 0 1
0 2 0 1
0 4 -1 0
0 7 0 1
0 9 4 0
3
0 0 0 1
0 4 -1 0
0 9 4 7
0
end_operator
begin_operator
pick-up b2 b5
4
0 0
2 0
7 0
9 5
2
5
0 0 0 1
0 2 0 1
0 5 -1 0
0 7 0 1
0 9 5 0
3
0 0 0 1
0 5 -1 0
0 9 5 7
0
end_operator
begin_operator
pick-up b2 b6
4
0 0
2 0
7 0
9 6
2
5
0 0 0 1
0 2 0 1
0 6 -1 0
0 7 0 1
0 9 6 0
3
0 0 0 1
0 6 -1 0
0 9 6 7
0
end_operator
begin_operator
pick-up b3 b1
4
0 0
3 0
7 0
10 1
2
5
0 0 0 1
0 1 -1 0
0 3 0 1
0 7 0 1
0 10 1 0
3
0 0 0 1
0 1 -1 0
0 10 1 7
0
end_operator
begin_operator
pick-up b3 b2
4
0 0
3 0
7 0
10 2
2
5
0 0 0 1
0 2 -1 0
0 3 0 1
0 7 0 1
0 10 2 0
3
0 0 0 1
0 2 -1 0
0 10 2 7
0
end_operator
begin_operator
pick-up b3 b3
4
0 0
3 0
7 0
10 3
2
3
0 0 0 1
0 7 0 1
0 10 3 0
2
0 0 0 1
0 10 3 7
0
end_operator
begin_operator
pick-up b3 b4
4
0 0
3 0
7 0
10 4
2
5
0 0 0 1
0 3 0 1
0 4 -1 0
0 7 0 1
0 10 4 0
3
0 0 0 1
0 4 -1 0
0 10 4 7
0
end_operator
begin_operator
pick-up b3 b5
4
0 0
3 0
7 0
10 5
2
5
0 0 0 1
0 3 0 1
0 5 -1 0
0 7 0 1
0 10 5 0
3
0 0 0 1
0 5 -1 0
0 10 5 7
0
end_operator
begin_operator
pick-up b3 b6
4
0 0
3 0
7 0
10 6
2
5
0 0 0 1
0 3 0 1
0 6 -1 0
0 7 0 1
0 10 6 0
3
0 0 0 1
0 6 -1 0
0 10 6 7
0
end_operator
begin_operator
pick-up b4 b1
4
0 0
4 0
7 0
11 1
2
5
0 0 0 1
0 1 -1 0
0 4 0 1
0 7 0 1
0 11 1 0
3
0 0 0 1
0 1 -1 0
0 11 1 7
0
end_operator
begin_operator
pick-up b4 b2
4
0 0
4 0
7 0
11 2
2
5
0 0 0 1
0 2 -1 0
0 4 0 1
0 7 0 1
0 11 2 0
3
0 0 0 1
0 2 -1 0
0 11 2 7
0
end_operator
begin_operator
pick-up b4 b3
4
0 0
4 0
7 0
11 3
2
5
0 0 0 1
0 3 -1 0
0 4 0 1
0 7 0 1
0 11 3 0
3
0 0 0 1
0 3 -1 0
0 11 3 7
0
end_operator
begin_operator
pick-up b4 b4
4
0 0
4 0
7 0
11 4
2
3
0 0 0 1
0 7 0 1
0 11 4 0
2
0 0 0 1
0 11 4 7
0
end_operator
begin_operator
pick-up b4 b5
4
0 0
4 0
7 0
11 5
2
5
0 0 0 1
0 4 0 1
0 5 -1 0
0 7 0 1
0 11 5 0
3
0 0 0 1
0 5 -1 0
0 11 5 7
0
end_operator
begin_operator
pick-up b4 b6
4
0 0
4 0
7 0
11 6
2
5
0 0 0 1
0 4 0 1
0 6 -1 0
0 7 0 1
0 11 6 0
3
0 0 0 1
0 6 -1 0
0 11 6 7
0
end_operator
begin_operator
pick-up b5 b1
4
0 0
5 0
7 0
12 1
2
5
0 0 0 1
0 1 -1 0
0 5 0 1
0 7 0 1
0 12 1 0
3
0 0 0 1
0 1 -1 0
0 12 1 7
0
end_operator
begin_operator
pick-up b5 b2
4
0 0
5 0
7 0
12 2
2
5
0 0 0 1
0 2 -1 0
0 5 0 1
0 7 0 1
0 12 2 0
3
0 0 0 1
0 2 -1 0
0 12 2 7
0
end_operator
begin_operator
pick-up b5 b3
4
0 0
5 0
7 0
12 3
2
5
0 0 0 1
0 3 -1 0
0 5 0 1
0 7 0 1
0 12 3 0
3
0 0 0 1
0 3 -1 0
0 12 3 7
0
end_operator
begin_operator
pick-up b5 b4
4
0 0
5 0
7 0
12 4
2
5
0 0 0 1
0 4 -1 0
0 5 0 1
0 7 0 1
0 12 4 0
3
0 0 0 1
0 4 -1 0
0 12 4 7
0
end_operator
begin_operator
pick-up b5 b5
4
0 0
5 0
7 0
12 5
2
3
0 0 0 1
0 7 0 1
0 12 5 0
2
0 0 0 1
0 12 5 7
0
end_operator
begin_operator
pick-up b5 b6
4
0 0
5 0
7 0
12 6
2
5
0 0 0 1
0 5 0 1
0 6 -1 0
0 7 0 1
0 12 6 0
3
0 0 0 1
0 6 -1 0
0 12 6 7
0
end_operator
begin_operator
pick-up b6 b1
4
0 0
6 0
7 0
13 1
2
5
0 0 0 1
0 1 -1 0
0 6 0 1
0 7 0 1
0 13 1 0
3
0 0 0 1
0 1 -1 0
0 13 1 7
0
end_operator
begin_operator
pick-up b6 b2
4
0 0
6 0
7 0
13 2
2
5
0 0 0 1
0 2 -1 0
0 6 0 1
0 7 0 1
0 13 2 0
3
0 0 0 1
0 2 -1 0
0 13 2 7
0
end_operator
begin_operator
pick-up b6 b3
4
0 0
6 0
7 0
13 3
2
5
0 0 0 1
0 3 -1 0
0 6 0 1
0 7 0 1
0 13 3 0
3
0 0 0 1
0 3 -1 0
0 13 3 7
0
end_operator
begin_operator
pick-up b6 b4
4
0 0
6 0
7 0
13 4
2
5
0 0 0 1
0 4 -1 0
0 6 0 1
0 7 0 1
0 13 4 0
3
0 0 0 1
0 4 -1 0
0 13 4 7
0
end_operator
begin_operator
pick-up b6 b5
4
0 0
6 0
7 0
13 5
2
5
0 0 0 1
0 5 -1 0
0 6 0 1
0 7 0 1
0 13 5 0
3
0 0 0 1
0 5 -1 0
0 13 5 7
0
end_operator
begin_operator
pick-up b6 b6
4
0 0
6 0
7 0
13 6
2
3
0 0 0 1
0 7 0 1
0 13 6 0
2
0 0 0 1
0 13 6 7
0
end_operator
begin_operator
pick-up-from-table b1
4
0 0
1 0
7 0
8 7
2
1
0 0 0 1
3
0 0 0 1
0 7 0 1
0 8 7 0
0
end_operator
begin_operator
pick-up-from-table b2
4
0 0
2 0
7 0
9 7
2
1
0 0 0 1
3
0 0 0 1
0 7 0 1
0 9 7 0
0
end_operator
begin_operator
pick-up-from-table b3
4
0 0
3 0
7 0
10 7
2
1
0 0 0 1
3
0 0 0 1
0 7 0 1
0 10 7 0
0
end_operator
begin_operator
pick-up-from-table b4
4
0 0
4 0
7 0
11 7
2
1
0 0 0 1
3
0 0 0 1
0 7 0 1
0 11 7 0
0
end_operator
begin_operator
pick-up-from-table b5
4
0 0
5 0
7 0
12 7
2
1
0 0 0 1
3
0 0 0 1
0 7 0 1
0 12 7 0
0
end_operator
begin_operator
pick-up-from-table b6
4
0 0
6 0
7 0
13 7
2
1
0 0 0 1
3
0 0 0 1
0 7 0 1
0 13 7 0
0
end_operator
begin_operator
prog 
1
0 1
1
3
0 0 1 0
1 19 0 14 -1 0
1 20 0 15 -1 0
0
end_operator
begin_operator
put-down b1
2
0 0
8 0
1
4
0 0 0 1
0 1 -1 0
0 7 -1 0
0 8 0 7
0
end_operator
begin_operator
put-down b2
2
0 0
9 0
1
4
0 0 0 1
0 2 -1 0
0 7 -1 0
0 9 0 7
0
end_operator
begin_operator
put-down b3
2
0 0
10 0
1
4
0 0 0 1
0 3 -1 0
0 7 -1 0
0 10 0 7
0
end_operator
begin_operator
put-down b4
2
0 0
11 0
1
4
0 0 0 1
0 4 -1 0
0 7 -1 0
0 11 0 7
0
end_operator
begin_operator
put-down b5
2
0 0
12 0
1
4
0 0 0 1
0 5 -1 0
0 7 -1 0
0 12 0 7
0
end_operator
begin_operator
put-down b6
2
0 0
13 0
1
4
0 0 0 1
0 6 -1 0
0 7 -1 0
0 13 0 7
0
end_operator
begin_operator
put-on-block b1 b1
3
0 0
1 0
8 0
2
3
0 0 0 1
0 7 -1 0
0 8 0 1
3
0 0 0 1
0 7 -1 0
0 8 0 7
0
end_operator
begin_operator
put-on-block b1 b2
3
0 0
2 0
8 0
2
5
0 0 0 1
0 1 -1 0
0 2 0 1
0 7 -1 0
0 8 0 2
4
0 0 0 1
0 1 -1 0
0 7 -1 0
0 8 0 7
0
end_operator
begin_operator
put-on-block b1 b3
3
0 0
3 0
8 0
2
5
0 0 0 1
0 1 -1 0
0 3 0 1
0 7 -1 0
0 8 0 3
4
0 0 0 1
0 1 -1 0
0 7 -1 0
0 8 0 7
0
end_operator
begin_operator
put-on-block b1 b4
3
0 0
4 0
8 0
2
5
0 0 0 1
0 1 -1 0
0 4 0 1
0 7 -1 0
0 8 0 4
4
0 0 0 1
0 1 -1 0
0 7 -1 0
0 8 0 7
0
end_operator
begin_operator
put-on-block b1 b5
3
0 0
5 0
8 0
2
5
0 0 0 1
0 1 -1 0
0 5 0 1
0 7 -1 0
0 8 0 5
4
0 0 0 1
0 1 -1 0
0 7 -1 0
0 8 0 7
0
end_operator
begin_operator
put-on-block b1 b6
3
0 0
6 0
8 0
2
5
0 0 0 1
0 1 -1 0
0 6 0 1
0 7 -1 0
0 8 0 6
4
0 0 0 1
0 1 -1 0
0 7 -1 0
0 8 0 7
0
end_operator
begin_operator
put-on-block b2 b1
3
0 0
1 0
9 0
2
5
0 0 0 1
0 1 0 1
0 2 -1 0
0 7 -1 0
0 9 0 1
4
0 0 0 1
0 2 -1 0
0 7 -1 0
0 9 0 7
0
end_operator
begin_operator
put-on-block b2 b2
3
0 0
2 0
9 0
2
3
0 0 0 1
0 7 -1 0
0 9 0 2
3
0 0 0 1
0 7 -1 0
0 9 0 7
0
end_operator
begin_operator
put-on-block b2 b3
3
0 0
3 0
9 0
2
5
0 0 0 1
0 2 -1 0
0 3 0 1
0 7 -1 0
0 9 0 3
4
0 0 0 1
0 2 -1 0
0 7 -1 0
0 9 0 7
0
end_operator
begin_operator
put-on-block b2 b4
3
0 0
4 0
9 0
2
5
0 0 0 1
0 2 -1 0
0 4 0 1
0 7 -1 0
0 9 0 4
4
0 0 0 1
0 2 -1 0
0 7 -1 0
0 9 0 7
0
end_operator
begin_operator
put-on-block b2 b5
3
0 0
5 0
9 0
2
5
0 0 0 1
0 2 -1 0
0 5 0 1
0 7 -1 0
0 9 0 5
4
0 0 0 1
0 2 -1 0
0 7 -1 0
0 9 0 7
0
end_operator
begin_operator
put-on-block b2 b6
3
0 0
6 0
9 0
2
5
0 0 0 1
0 2 -1 0
0 6 0 1
0 7 -1 0
0 9 0 6
4
0 0 0 1
0 2 -1 0
0 7 -1 0
0 9 0 7
0
end_operator
begin_operator
put-on-block b3 b1
3
0 0
1 0
10 0
2
5
0 0 0 1
0 1 0 1
0 3 -1 0
0 7 -1 0
0 10 0 1
4
0 0 0 1
0 3 -1 0
0 7 -1 0
0 10 0 7
0
end_operator
begin_operator
put-on-block b3 b2
3
0 0
2 0
10 0
2
5
0 0 0 1
0 2 0 1
0 3 -1 0
0 7 -1 0
0 10 0 2
4
0 0 0 1
0 3 -1 0
0 7 -1 0
0 10 0 7
0
end_operator
begin_operator
put-on-block b3 b3
3
0 0
3 0
10 0
2
3
0 0 0 1
0 7 -1 0
0 10 0 3
3
0 0 0 1
0 7 -1 0
0 10 0 7
0
end_operator
begin_operator
put-on-block b3 b4
3
0 0
4 0
10 0
2
5
0 0 0 1
0 3 -1 0
0 4 0 1
0 7 -1 0
0 10 0 4
4
0 0 0 1
0 3 -1 0
0 7 -1 0
0 10 0 7
0
end_operator
begin_operator
put-on-block b3 b5
3
0 0
5 0
10 0
2
5
0 0 0 1
0 3 -1 0
0 5 0 1
0 7 -1 0
0 10 0 5
4
0 0 0 1
0 3 -1 0
0 7 -1 0
0 10 0 7
0
end_operator
begin_operator
put-on-block b3 b6
3
0 0
6 0
10 0
2
5
0 0 0 1
0 3 -1 0
0 6 0 1
0 7 -1 0
0 10 0 6
4
0 0 0 1
0 3 -1 0
0 7 -1 0
0 10 0 7
0
end_operator
begin_operator
put-on-block b4 b1
3
0 0
1 0
11 0
2
5
0 0 0 1
0 1 0 1
0 4 -1 0
0 7 -1 0
0 11 0 1
4
0 0 0 1
0 4 -1 0
0 7 -1 0
0 11 0 7
0
end_operator
begin_operator
put-on-block b4 b2
3
0 0
2 0
11 0
2
5
0 0 0 1
0 2 0 1
0 4 -1 0
0 7 -1 0
0 11 0 2
4
0 0 0 1
0 4 -1 0
0 7 -1 0
0 11 0 7
0
end_operator
begin_operator
put-on-block b4 b3
3
0 0
3 0
11 0
2
5
0 0 0 1
0 3 0 1
0 4 -1 0
0 7 -1 0
0 11 0 3
4
0 0 0 1
0 4 -1 0
0 7 -1 0
0 11 0 7
0
end_operator
begin_operator
put-on-block b4 b4
3
0 0
4 0
11 0
2
3
0 0 0 1
0 7 -1 0
0 11 0 4
3
0 0 0 1
0 7 -1 0
0 11 0 7
0
end_operator
begin_operator
put-on-block b4 b5
3
0 0
5 0
11 0
2
5
0 0 0 1
0 4 -1 0
0 5 0 1
0 7 -1 0
0 11 0 5
4
0 0 0 1
0 4 -1 0
0 7 -1 0
0 11 0 7
0
end_operator
begin_operator
put-on-block b4 b6
3
0 0
6 0
11 0
2
5
0 0 0 1
0 4 -1 0
0 6 0 1
0 7 -1 0
0 11 0 6
4
0 0 0 1
0 4 -1 0
0 7 -1 0
0 11 0 7
0
end_operator
begin_operator
put-on-block b5 b1
3
0 0
1 0
12 0
2
5
0 0 0 1
0 1 0 1
0 5 -1 0
0 7 -1 0
0 12 0 1
4
0 0 0 1
0 5 -1 0
0 7 -1 0
0 12 0 7
0
end_operator
begin_operator
put-on-block b5 b2
3
0 0
2 0
12 0
2
5
0 0 0 1
0 2 0 1
0 5 -1 0
0 7 -1 0
0 12 0 2
4
0 0 0 1
0 5 -1 0
0 7 -1 0
0 12 0 7
0
end_operator
begin_operator
put-on-block b5 b3
3
0 0
3 0
12 0
2
5
0 0 0 1
0 3 0 1
0 5 -1 0
0 7 -1 0
0 12 0 3
4
0 0 0 1
0 5 -1 0
0 7 -1 0
0 12 0 7
0
end_operator
begin_operator
put-on-block b5 b4
3
0 0
4 0
12 0
2
5
0 0 0 1
0 4 0 1
0 5 -1 0
0 7 -1 0
0 12 0 4
4
0 0 0 1
0 5 -1 0
0 7 -1 0
0 12 0 7
0
end_operator
begin_operator
put-on-block b5 b5
3
0 0
5 0
12 0
2
3
0 0 0 1
0 7 -1 0
0 12 0 5
3
0 0 0 1
0 7 -1 0
0 12 0 7
0
end_operator
begin_operator
put-on-block b5 b6
3
0 0
6 0
12 0
2
5
0 0 0 1
0 5 -1 0
0 6 0 1
0 7 -1 0
0 12 0 6
4
0 0 0 1
0 5 -1 0
0 7 -1 0
0 12 0 7
0
end_operator
begin_operator
put-on-block b6 b1
3
0 0
1 0
13 0
2
5
0 0 0 1
0 1 0 1
0 6 -1 0
0 7 -1 0
0 13 0 1
4
0 0 0 1
0 6 -1 0
0 7 -1 0
0 13 0 7
0
end_operator
begin_operator
put-on-block b6 b2
3
0 0
2 0
13 0
2
5
0 0 0 1
0 2 0 1
0 6 -1 0
0 7 -1 0
0 13 0 2
4
0 0 0 1
0 6 -1 0
0 7 -1 0
0 13 0 7
0
end_operator
begin_operator
put-on-block b6 b3
3
0 0
3 0
13 0
2
5
0 0 0 1
0 3 0 1
0 6 -1 0
0 7 -1 0
0 13 0 3
4
0 0 0 1
0 6 -1 0
0 7 -1 0
0 13 0 7
0
end_operator
begin_operator
put-on-block b6 b4
3
0 0
4 0
13 0
2
5
0 0 0 1
0 4 0 1
0 6 -1 0
0 7 -1 0
0 13 0 4
4
0 0 0 1
0 6 -1 0
0 7 -1 0
0 13 0 7
0
end_operator
begin_operator
put-on-block b6 b5
3
0 0
5 0
13 0
2
5
0 0 0 1
0 5 0 1
0 6 -1 0
0 7 -1 0
0 13 0 5
4
0 0 0 1
0 6 -1 0
0 7 -1 0
0 13 0 7
0
end_operator
begin_operator
put-on-block b6 b6
3
0 0
6 0
13 0
2
3
0 0 0 1
0 7 -1 0
0 13 0 6
3
0 0 0 1
0 7 -1 0
0 13 0 7
0
end_operator
begin_operator
put-tower-down b1 b2
3
0 0
8 2
9 0
1
3
0 0 0 1
0 7 -1 0
0 9 0 7
0
end_operator
begin_operator
put-tower-down b1 b3
3
0 0
8 3
10 0
1
3
0 0 0 1
0 7 -1 0
0 10 0 7
0
end_operator
begin_operator
put-tower-down b1 b4
3
0 0
8 4
11 0
1
3
0 0 0 1
0 7 -1 0
0 11 0 7
0
end_operator
begin_operator
put-tower-down b1 b5
3
0 0
8 5
12 0
1
3
0 0 0 1
0 7 -1 0
0 12 0 7
0
end_operator
begin_operator
put-tower-down b1 b6
3
0 0
8 6
13 0
1
3
0 0 0 1
0 7 -1 0
0 13 0 7
0
end_operator
begin_operator
put-tower-down b2 b1
3
0 0
8 0
9 1
1
3
0 0 0 1
0 7 -1 0
0 8 0 7
0
end_operator
begin_operator
put-tower-down b2 b3
3
0 0
9 3
10 0
1
3
0 0 0 1
0 7 -1 0
0 10 0 7
0
end_operator
begin_operator
put-tower-down b2 b4
3
0 0
9 4
11 0
1
3
0 0 0 1
0 7 -1 0
0 11 0 7
0
end_operator
begin_operator
put-tower-down b2 b5
3
0 0
9 5
12 0
1
3
0 0 0 1
0 7 -1 0
0 12 0 7
0
end_operator
begin_operator
put-tower-down b2 b6
3
0 0
9 6
13 0
1
3
0 0 0 1
0 7 -1 0
0 13 0 7
0
end_operator
begin_operator
put-tower-down b3 b1
3
0 0
8 0
10 1
1
3
0 0 0 1
0 7 -1 0
0 8 0 7
0
end_operator
begin_operator
put-tower-down b3 b2
3
0 0
9 0
10 2
1
3
0 0 0 1
0 7 -1 0
0 9 0 7
0
end_operator
begin_operator
put-tower-down b3 b4
3
0 0
10 4
11 0
1
3
0 0 0 1
0 7 -1 0
0 11 0 7
0
end_operator
begin_operator
put-tower-down b3 b5
3
0 0
10 5
12 0
1
3
0 0 0 1
0 7 -1 0
0 12 0 7
0
end_operator
begin_operator
put-tower-down b3 b6
3
0 0
10 6
13 0
1
3
0 0 0 1
0 7 -1 0
0 13 0 7
0
end_operator
begin_operator
put-tower-down b4 b1
3
0 0
8 0
11 1
1
3
0 0 0 1
0 7 -1 0
0 8 0 7
0
end_operator
begin_operator
put-tower-down b4 b2
3
0 0
9 0
11 2
1
3
0 0 0 1
0 7 -1 0
0 9 0 7
0
end_operator
begin_operator
put-tower-down b4 b3
3
0 0
10 0
11 3
1
3
0 0 0 1
0 7 -1 0
0 10 0 7
0
end_operator
begin_operator
put-tower-down b4 b5
3
0 0
11 5
12 0
1
3
0 0 0 1
0 7 -1 0
0 12 0 7
0
end_operator
begin_operator
put-tower-down b4 b6
3
0 0
11 6
13 0
1
3
0 0 0 1
0 7 -1 0
0 13 0 7
0
end_operator
begin_operator
put-tower-down b5 b1
3
0 0
8 0
12 1
1
3
0 0 0 1
0 7 -1 0
0 8 0 7
0
end_operator
begin_operator
put-tower-down b5 b2
3
0 0
9 0
12 2
1
3
0 0 0 1
0 7 -1 0
0 9 0 7
0
end_operator
begin_operator
put-tower-down b5 b3
3
0 0
10 0
12 3
1
3
0 0 0 1
0 7 -1 0
0 10 0 7
0
end_operator
begin_operator
put-tower-down b5 b4
3
0 0
11 0
12 4
1
3
0 0 0 1
0 7 -1 0
0 11 0 7
0
end_operator
begin_operator
put-tower-down b5 b6
3
0 0
12 6
13 0
1
3
0 0 0 1
0 7 -1 0
0 13 0 7
0
end_operator
begin_operator
put-tower-down b6 b1
3
0 0
8 0
13 1
1
3
0 0 0 1
0 7 -1 0
0 8 0 7
0
end_operator
begin_operator
put-tower-down b6 b2
3
0 0
9 0
13 2
1
3
0 0 0 1
0 7 -1 0
0 9 0 7
0
end_operator
begin_operator
put-tower-down b6 b3
3
0 0
10 0
13 3
1
3
0 0 0 1
0 7 -1 0
0 10 0 7
0
end_operator
begin_operator
put-tower-down b6 b4
3
0 0
11 0
13 4
1
3
0 0 0 1
0 7 -1 0
0 11 0 7
0
end_operator
begin_operator
put-tower-down b6 b5
3
0 0
12 0
13 5
1
3
0 0 0 1
0 7 -1 0
0 12 0 7
0
end_operator
begin_operator
put-tower-on-block b1 b2 b1
4
0 0
1 0
8 2
9 0
2
4
0 0 0 1
0 1 0 1
0 7 -1 0
0 9 0 1
3
0 0 0 1
0 7 -1 0
0 9 0 7
0
end_operator
begin_operator
put-tower-on-block b1 b2 b2
4
0 0
2 0
8 2
9 0
2
4
0 0 0 1
0 2 0 1
0 7 -1 0
0 9 0 2
3
0 0 0 1
0 7 -1 0
0 9 0 7
0
end_operator
begin_operator
put-tower-on-block b1 b2 b3
4
0 0
3 0
8 2
9 0
2
4
0 0 0 1
0 3 0 1
0 7 -1 0
0 9 0 3
3
0 0 0 1
0 7 -1 0
0 9 0 7
0
end_operator
begin_operator
put-tower-on-block b1 b2 b4
4
0 0
4 0
8 2
9 0
2
4
0 0 0 1
0 4 0 1
0 7 -1 0
0 9 0 4
3
0 0 0 1
0 7 -1 0
0 9 0 7
0
end_operator
begin_operator
put-tower-on-block b1 b2 b5
4
0 0
5 0
8 2
9 0
2
4
0 0 0 1
0 5 0 1
0 7 -1 0
0 9 0 5
3
0 0 0 1
0 7 -1 0
0 9 0 7
0
end_operator
begin_operator
put-tower-on-block b1 b2 b6
4
0 0
6 0
8 2
9 0
2
4
0 0 0 1
0 6 0 1
0 7 -1 0
0 9 0 6
3
0 0 0 1
0 7 -1 0
0 9 0 7
0
end_operator
begin_operator
put-tower-on-block b1 b3 b1
4
0 0
1 0
8 3
10 0
2
4
0 0 0 1
0 1 0 1
0 7 -1 0
0 10 0 1
3
0 0 0 1
0 7 -1 0
0 10 0 7
0
end_operator
begin_operator
put-tower-on-block b1 b3 b2
4
0 0
2 0
8 3
10 0
2
4
0 0 0 1
0 2 0 1
0 7 -1 0
0 10 0 2
3
0 0 0 1
0 7 -1 0
0 10 0 7
0
end_operator
begin_operator
put-tower-on-block b1 b3 b3
4
0 0
3 0
8 3
10 0
2
4
0 0 0 1
0 3 0 1
0 7 -1 0
0 10 0 3
3
0 0 0 1
0 7 -1 0
0 10 0 7
0
end_operator
begin_operator
put-tower-on-block b1 b3 b4
4
0 0
4 0
8 3
10 0
2
4
0 0 0 1
0 4 0 1
0 7 -1 0
0 10 0 4
3
0 0 0 1
0 7 -1 0
0 10 0 7
0
end_operator
begin_operator
put-tower-on-block b1 b3 b5
4
0 0
5 0
8 3
10 0
2
4
0 0 0 1
0 5 0 1
0 7 -1 0
0 10 0 5
3
0 0 0 1
0 7 -1 0
0 10 0 7
0
end_operator
begin_operator
put-tower-on-block b1 b3 b6
4
0 0
6 0
8 3
10 0
2
4
0 0 0 1
0 6 0 1
0 7 -1 0
0 10 0 6
3
0 0 0 1
0 7 -1 0
0 10 0 7
0
end_operator
begin_operator
put-tower-on-block b1 b4 b1
4
0 0
1 0
8 4
11 0
2
4
0 0 0 1
0 1 0 1
0 7 -1 0
0 11 0 1
3
0 0 0 1
0 7 -1 0
0 11 0 7
0
end_operator
begin_operator
put-tower-on-block b1 b4 b2
4
0 0
2 0
8 4
11 0
2
4
0 0 0 1
0 2 0 1
0 7 -1 0
0 11 0 2
3
0 0 0 1
0 7 -1 0
0 11 0 7
0
end_operator
begin_operator
put-tower-on-block b1 b4 b3
4
0 0
3 0
8 4
11 0
2
4
0 0 0 1
0 3 0 1
0 7 -1 0
0 11 0 3
3
0 0 0 1
0 7 -1 0
0 11 0 7
0
end_operator
begin_operator
put-tower-on-block b1 b4 b4
4
0 0
4 0
8 4
11 0
2
4
0 0 0 1
0 4 0 1
0 7 -1 0
0 11 0 4
3
0 0 0 1
0 7 -1 0
0 11 0 7
0
end_operator
begin_operator
put-tower-on-block b1 b4 b5
4
0 0
5 0
8 4
11 0
2
4
0 0 0 1
0 5 0 1
0 7 -1 0
0 11 0 5
3
0 0 0 1
0 7 -1 0
0 11 0 7
0
end_operator
begin_operator
put-tower-on-block b1 b4 b6
4
0 0
6 0
8 4
11 0
2
4
0 0 0 1
0 6 0 1
0 7 -1 0
0 11 0 6
3
0 0 0 1
0 7 -1 0
0 11 0 7
0
end_operator
begin_operator
put-tower-on-block b1 b5 b1
4
0 0
1 0
8 5
12 0
2
4
0 0 0 1
0 1 0 1
0 7 -1 0
0 12 0 1
3
0 0 0 1
0 7 -1 0
0 12 0 7
0
end_operator
begin_operator
put-tower-on-block b1 b5 b2
4
0 0
2 0
8 5
12 0
2
4
0 0 0 1
0 2 0 1
0 7 -1 0
0 12 0 2
3
0 0 0 1
0 7 -1 0
0 12 0 7
0
end_operator
begin_operator
put-tower-on-block b1 b5 b3
4
0 0
3 0
8 5
12 0
2
4
0 0 0 1
0 3 0 1
0 7 -1 0
0 12 0 3
3
0 0 0 1
0 7 -1 0
0 12 0 7
0
end_operator
begin_operator
put-tower-on-block b1 b5 b4
4
0 0
4 0
8 5
12 0
2
4
0 0 0 1
0 4 0 1
0 7 -1 0
0 12 0 4
3
0 0 0 1
0 7 -1 0
0 12 0 7
0
end_operator
begin_operator
put-tower-on-block b1 b5 b5
4
0 0
5 0
8 5
12 0
2
4
0 0 0 1
0 5 0 1
0 7 -1 0
0 12 0 5
3
0 0 0 1
0 7 -1 0
0 12 0 7
0
end_operator
begin_operator
put-tower-on-block b1 b5 b6
4
0 0
6 0
8 5
12 0
2
4
0 0 0 1
0 6 0 1
0 7 -1 0
0 12 0 6
3
0 0 0 1
0 7 -1 0
0 12 0 7
0
end_operator
begin_operator
put-tower-on-block b1 b6 b1
4
0 0
1 0
8 6
13 0
2
4
0 0 0 1
0 1 0 1
0 7 -1 0
0 13 0 1
3
0 0 0 1
0 7 -1 0
0 13 0 7
0
end_operator
begin_operator
put-tower-on-block b1 b6 b2
4
0 0
2 0
8 6
13 0
2
4
0 0 0 1
0 2 0 1
0 7 -1 0
0 13 0 2
3
0 0 0 1
0 7 -1 0
0 13 0 7
0
end_operator
begin_operator
put-tower-on-block b1 b6 b3
4
0 0
3 0
8 6
13 0
2
4
0 0 0 1
0 3 0 1
0 7 -1 0
0 13 0 3
3
0 0 0 1
0 7 -1 0
0 13 0 7
0
end_operator
begin_operator
put-tower-on-block b1 b6 b4
4
0 0
4 0
8 6
13 0
2
4
0 0 0 1
0 4 0 1
0 7 -1 0
0 13 0 4
3
0 0 0 1
0 7 -1 0
0 13 0 7
0
end_operator
begin_operator
put-tower-on-block b1 b6 b5
4
0 0
5 0
8 6
13 0
2
4
0 0 0 1
0 5 0 1
0 7 -1 0
0 13 0 5
3
0 0 0 1
0 7 -1 0
0 13 0 7
0
end_operator
begin_operator
put-tower-on-block b1 b6 b6
4
0 0
6 0
8 6
13 0
2
4
0 0 0 1
0 6 0 1
0 7 -1 0
0 13 0 6
3
0 0 0 1
0 7 -1 0
0 13 0 7
0
end_operator
begin_operator
put-tower-on-block b2 b1 b1
4
0 0
1 0
8 0
9 1
2
4
0 0 0 1
0 1 0 1
0 7 -1 0
0 8 0 1
3
0 0 0 1
0 7 -1 0
0 8 0 7
0
end_operator
begin_operator
put-tower-on-block b2 b1 b2
4
0 0
2 0
8 0
9 1
2
4
0 0 0 1
0 2 0 1
0 7 -1 0
0 8 0 2
3
0 0 0 1
0 7 -1 0
0 8 0 7
0
end_operator
begin_operator
put-tower-on-block b2 b1 b3
4
0 0
3 0
8 0
9 1
2
4
0 0 0 1
0 3 0 1
0 7 -1 0
0 8 0 3
3
0 0 0 1
0 7 -1 0
0 8 0 7
0
end_operator
begin_operator
put-tower-on-block b2 b1 b4
4
0 0
4 0
8 0
9 1
2
4
0 0 0 1
0 4 0 1
0 7 -1 0
0 8 0 4
3
0 0 0 1
0 7 -1 0
0 8 0 7
0
end_operator
begin_operator
put-tower-on-block b2 b1 b5
4
0 0
5 0
8 0
9 1
2
4
0 0 0 1
0 5 0 1
0 7 -1 0
0 8 0 5
3
0 0 0 1
0 7 -1 0
0 8 0 7
0
end_operator
begin_operator
put-tower-on-block b2 b1 b6
4
0 0
6 0
8 0
9 1
2
4
0 0 0 1
0 6 0 1
0 7 -1 0
0 8 0 6
3
0 0 0 1
0 7 -1 0
0 8 0 7
0
end_operator
begin_operator
put-tower-on-block b2 b3 b1
4
0 0
1 0
9 3
10 0
2
4
0 0 0 1
0 1 0 1
0 7 -1 0
0 10 0 1
3
0 0 0 1
0 7 -1 0
0 10 0 7
0
end_operator
begin_operator
put-tower-on-block b2 b3 b2
4
0 0
2 0
9 3
10 0
2
4
0 0 0 1
0 2 0 1
0 7 -1 0
0 10 0 2
3
0 0 0 1
0 7 -1 0
0 10 0 7
0
end_operator
begin_operator
put-tower-on-block b2 b3 b3
4
0 0
3 0
9 3
10 0
2
4
0 0 0 1
0 3 0 1
0 7 -1 0
0 10 0 3
3
0 0 0 1
0 7 -1 0
0 10 0 7
0
end_operator
begin_operator
put-tower-on-block b2 b3 b4
4
0 0
4 0
9 3
10 0
2
4
0 0 0 1
0 4 0 1
0 7 -1 0
0 10 0 4
3
0 0 0 1
0 7 -1 0
0 10 0 7
0
end_operator
begin_operator
put-tower-on-block b2 b3 b5
4
0 0
5 0
9 3
10 0
2
4
0 0 0 1
0 5 0 1
0 7 -1 0
0 10 0 5
3
0 0 0 1
0 7 -1 0
0 10 0 7
0
end_operator
begin_operator
put-tower-on-block b2 b3 b6
4
0 0
6 0
9 3
10 0
2
4
0 0 0 1
0 6 0 1
0 7 -1 0
0 10 0 6
3
0 0 0 1
0 7 -1 0
0 10 0 7
0
end_operator
begin_operator
put-tower-on-block b2 b4 b1
4
0 0
1 0
9 4
11 0
2
4
0 0 0 1
0 1 0 1
0 7 -1 0
0 11 0 1
3
0 0 0 1
0 7 -1 0
0 11 0 7
0
end_operator
begin_operator
put-tower-on-block b2 b4 b2
4
0 0
2 0
9 4
11 0
2
4
0 0 0 1
0 2 0 1
0 7 -1 0
0 11 0 2
3
0 0 0 1
0 7 -1 0
0 11 0 7
0
end_operator
begin_operator
put-tower-on-block b2 b4 b3
4
0 0
3 0
9 4
11 0
2
4
0 0 0 1
0 3 0 1
0 7 -1 0
0 11 0 3
3
0 0 0 1
0 7 -1 0
0 11 0 7
0
end_operator
begin_operator
put-tower-on-block b2 b4 b4
4
0 0
4 0
9 4
11 0
2
4
0 0 0 1
0 4 0 1
0 7 -1 0
0 11 0 4
3
0 0 0 1
0 7 -1 0
0 11 0 7
0
end_operator
begin_operator
put-tower-on-block b2 b4 b5
4
0 0
5 0
9 4
11 0
2
4
0 0 0 1
0 5 0 1
0 7 -1 0
0 11 0 5
3
0 0 0 1
0 7 -1 0
0 11 0 7
0
end_operator
begin_operator
put-tower-on-block b2 b4 b6
4
0 0
6 0
9 4
11 0
2
4
0 0 0 1
0 6 0 1
0 7 -1 0
0 11 0 6
3
0 0 0 1
0 7 -1 0
0 11 0 7
0
end_operator
begin_operator
put-tower-on-block b2 b5 b1
4
0 0
1 0
9 5
12 0
2
4
0 0 0 1
0 1 0 1
0 7 -1 0
0 12 0 1
3
0 0 0 1
0 7 -1 0
0 12 0 7
0
end_operator
begin_operator
put-tower-on-block b2 b5 b2
4
0 0
2 0
9 5
12 0
2
4
0 0 0 1
0 2 0 1
0 7 -1 0
0 12 0 2
3
0 0 0 1
0 7 -1 0
0 12 0 7
0
end_operator
begin_operator
put-tower-on-block b2 b5 b3
4
0 0
3 0
9 5
12 0
2
4
0 0 0 1
0 3 0 1
0 7 -1 0
0 12 0 3
3
0 0 0 1
0 7 -1 0
0 12 0 7
0
end_operator
begin_operator
put-tower-on-block b2 b5 b4
4
0 0
4 0
9 5
12 0
2
4
0 0 0 1
0 4 0 1
0 7 -1 0
0 12 0 4
3
0 0 0 1
0 7 -1 0
0 12 0 7
0
end_operator
begin_operator
put-tower-on-block b2 b5 b5
4
0 0
5 0
9 5
12 0
2
4
0 0 0 1
0 5 0 1
0 7 -1 0
0 12 0 5
3
0 0 0 1
0 7 -1 0
0 12 0 7
0
end_operator
begin_operator
put-tower-on-block b2 b5 b6
4
0 0
6 0
9 5
12 0
2
4
0 0 0 1
0 6 0 1
0 7 -1 0
0 12 0 6
3
0 0 0 1
0 7 -1 0
0 12 0 7
0
end_operator
begin_operator
put-tower-on-block b2 b6 b1
4
0 0
1 0
9 6
13 0
2
4
0 0 0 1
0 1 0 1
0 7 -1 0
0 13 0 1
3
0 0 0 1
0 7 -1 0
0 13 0 7
0
end_operator
begin_operator
put-tower-on-block b2 b6 b2
4
0 0
2 0
9 6
13 0
2
4
0 0 0 1
0 2 0 1
0 7 -1 0
0 13 0 2
3
0 0 0 1
0 7 -1 0
0 13 0 7
0
end_operator
begin_operator
put-tower-on-block b2 b6 b3
4
0 0
3 0
9 6
13 0
2
4
0 0 0 1
0 3 0 1
0 7 -1 0
0 13 0 3
3
0 0 0 1
0 7 -1 0
0 13 0 7
0
end_operator
begin_operator
put-tower-on-block b2 b6 b4
4
0 0
4 0
9 6
13 0
2
4
0 0 0 1
0 4 0 1
0 7 -1 0
0 13 0 4
3
0 0 0 1
0 7 -1 0
0 13 0 7
0
end_operator
begin_operator
put-tower-on-block b2 b6 b5
4
0 0
5 0
9 6
13 0
2
4
0 0 0 1
0 5 0 1
0 7 -1 0
0 13 0 5
3
0 0 0 1
0 7 -1 0
0 13 0 7
0
end_operator
begin_operator
put-tower-on-block b2 b6 b6
4
0 0
6 0
9 6
13 0
2
4
0 0 0 1
0 6 0 1
0 7 -1 0
0 13 0 6
3
0 0 0 1
0 7 -1 0
0 13 0 7
0
end_operator
begin_operator
put-tower-on-block b3 b1 b1
4
0 0
1 0
8 0
10 1
2
4
0 0 0 1
0 1 0 1
0 7 -1 0
0 8 0 1
3
0 0 0 1
0 7 -1 0
0 8 0 7
0
end_operator
begin_operator
put-tower-on-block b3 b1 b2
4
0 0
2 0
8 0
10 1
2
4
0 0 0 1
0 2 0 1
0 7 -1 0
0 8 0 2
3
0 0 0 1
0 7 -1 0
0 8 0 7
0
end_operator
begin_operator
put-tower-on-block b3 b1 b3
4
0 0
3 0
8 0
10 1
2
4
0 0 0 1
0 3 0 1
0 7 -1 0
0 8 0 3
3
0 0 0 1
0 7 -1 0
0 8 0 7
0
end_operator
begin_operator
put-tower-on-block b3 b1 b4
4
0 0
4 0
8 0
10 1
2
4
0 0 0 1
0 4 0 1
0 7 -1 0
0 8 0 4
3
0 0 0 1
0 7 -1 0
0 8 0 7
0
end_operator
begin_operator
put-tower-on-block b3 b1 b5
4
0 0
5 0
8 0
10 1
2
4
0 0 0 1
0 5 0 1
0 7 -1 0
0 8 0 5
3
0 0 0 1
0 7 -1 0
0 8 0 7
0
end_operator
begin_operator
put-tower-on-block b3 b1 b6
4
0 0
6 0
8 0
10 1
2
4
0 0 0 1
0 6 0 1
0 7 -1 0
0 8 0 6
3
0 0 0 1
0 7 -1 0
0 8 0 7
0
end_operator
begin_operator
put-tower-on-block b3 b2 b1
4
0 0
1 0
9 0
10 2
2
4
0 0 0 1
0 1 0 1
0 7 -1 0
0 9 0 1
3
0 0 0 1
0 7 -1 0
0 9 0 7
0
end_operator
begin_operator
put-tower-on-block b3 b2 b2
4
0 0
2 0
9 0
10 2
2
4
0 0 0 1
0 2 0 1
0 7 -1 0
0 9 0 2
3
0 0 0 1
0 7 -1 0
0 9 0 7
0
end_operator
begin_operator
put-tower-on-block b3 b2 b3
4
0 0
3 0
9 0
10 2
2
4
0 0 0 1
0 3 0 1
0 7 -1 0
0 9 0 3
3
0 0 0 1
0 7 -1 0
0 9 0 7
0
end_operator
begin_operator
put-tower-on-block b3 b2 b4
4
0 0
4 0
9 0
10 2
2
4
0 0 0 1
0 4 0 1
0 7 -1 0
0 9 0 4
3
0 0 0 1
0 7 -1 0
0 9 0 7
0
end_operator
begin_operator
put-tower-on-block b3 b2 b5
4
0 0
5 0
9 0
10 2
2
4
0 0 0 1
0 5 0 1
0 7 -1 0
0 9 0 5
3
0 0 0 1
0 7 -1 0
0 9 0 7
0
end_operator
begin_operator
put-tower-on-block b3 b2 b6
4
0 0
6 0
9 0
10 2
2
4
0 0 0 1
0 6 0 1
0 7 -1 0
0 9 0 6
3
0 0 0 1
0 7 -1 0
0 9 0 7
0
end_operator
begin_operator
put-tower-on-block b3 b4 b1
4
0 0
1 0
10 4
11 0
2
4
0 0 0 1
0 1 0 1
0 7 -1 0
0 11 0 1
3
0 0 0 1
0 7 -1 0
0 11 0 7
0
end_operator
begin_operator
put-tower-on-block b3 b4 b2
4
0 0
2 0
10 4
11 0
2
4
0 0 0 1
0 2 0 1
0 7 -1 0
0 11 0 2
3
0 0 0 1
0 7 -1 0
0 11 0 7
0
end_operator
begin_operator
put-tower-on-block b3 b4 b3
4
0 0
3 0
10 4
11 0
2
4
0 0 0 1
0 3 0 1
0 7 -1 0
0 11 0 3
3
0 0 0 1
0 7 -1 0
0 11 0 7
0
end_operator
begin_operator
put-tower-on-block b3 b4 b4
4
0 0
4 0
10 4
11 0
2
4
0 0 0 1
0 4 0 1
0 7 -1 0
0 11 0 4
3
0 0 0 1
0 7 -1 0
0 11 0 7
0
end_operator
begin_operator
put-tower-on-block b3 b4 b5
4
0 0
5 0
10 4
11 0
2
4
0 0 0 1
0 5 0 1
0 7 -1 0
0 11 0 5
3
0 0 0 1
0 7 -1 0
0 11 0 7
0
end_operator
begin_operator
put-tower-on-block b3 b4 b6
4
0 0
6 0
10 4
11 0
2
4
0 0 0 1
0 6 0 1
0 7 -1 0
0 11 0 6
3
0 0 0 1
0 7 -1 0
0 11 0 7
0
end_operator
begin_operator
put-tower-on-block b3 b5 b1
4
0 0
1 0
10 5
12 0
2
4
0 0 0 1
0 1 0 1
0 7 -1 0
0 12 0 1
3
0 0 0 1
0 7 -1 0
0 12 0 7
0
end_operator
begin_operator
put-tower-on-block b3 b5 b2
4
0 0
2 0
10 5
12 0
2
4
0 0 0 1
0 2 0 1
0 7 -1 0
0 12 0 2
3
0 0 0 1
0 7 -1 0
0 12 0 7
0
end_operator
begin_operator
put-tower-on-block b3 b5 b3
4
0 0
3 0
10 5
12 0
2
4
0 0 0 1
0 3 0 1
0 7 -1 0
0 12 0 3
3
0 0 0 1
0 7 -1 0
0 12 0 7
0
end_operator
begin_operator
put-tower-on-block b3 b5 b4
4
0 0
4 0
10 5
12 0
2
4
0 0 0 1
0 4 0 1
0 7 -1 0
0 12 0 4
3
0 0 0 1
0 7 -1 0
0 12 0 7
0
end_operator
begin_operator
put-tower-on-block b3 b5 b5
4
0 0
5 0
10 5
12 0
2
4
0 0 0 1
0 5 0 1
0 7 -1 0
0 12 0 5
3
0 0 0 1
0 7 -1 0
0 12 0 7
0
end_operator
begin_operator
put-tower-on-block b3 b5 b6
4
0 0
6 0
10 5
12 0
2
4
0 0 0 1
0 6 0 1
0 7 -1 0
0 12 0 6
3
0 0 0 1
0 7 -1 0
0 12 0 7
0
end_operator
begin_operator
put-tower-on-block b3 b6 b1
4
0 0
1 0
10 6
13 0
2
4
0 0 0 1
0 1 0 1
0 7 -1 0
0 13 0 1
3
0 0 0 1
0 7 -1 0
0 13 0 7
0
end_operator
begin_operator
put-tower-on-block b3 b6 b2
4
0 0
2 0
10 6
13 0
2
4
0 0 0 1
0 2 0 1
0 7 -1 0
0 13 0 2
3
0 0 0 1
0 7 -1 0
0 13 0 7
0
end_operator
begin_operator
put-tower-on-block b3 b6 b3
4
0 0
3 0
10 6
13 0
2
4
0 0 0 1
0 3 0 1
0 7 -1 0
0 13 0 3
3
0 0 0 1
0 7 -1 0
0 13 0 7
0
end_operator
begin_operator
put-tower-on-block b3 b6 b4
4
0 0
4 0
10 6
13 0
2
4
0 0 0 1
0 4 0 1
0 7 -1 0
0 13 0 4
3
0 0 0 1
0 7 -1 0
0 13 0 7
0
end_operator
begin_operator
put-tower-on-block b3 b6 b5
4
0 0
5 0
10 6
13 0
2
4
0 0 0 1
0 5 0 1
0 7 -1 0
0 13 0 5
3
0 0 0 1
0 7 -1 0
0 13 0 7
0
end_operator
begin_operator
put-tower-on-block b3 b6 b6
4
0 0
6 0
10 6
13 0
2
4
0 0 0 1
0 6 0 1
0 7 -1 0
0 13 0 6
3
0 0 0 1
0 7 -1 0
0 13 0 7
0
end_operator
begin_operator
put-tower-on-block b4 b1 b1
4
0 0
1 0
8 0
11 1
2
4
0 0 0 1
0 1 0 1
0 7 -1 0
0 8 0 1
3
0 0 0 1
0 7 -1 0
0 8 0 7
0
end_operator
begin_operator
put-tower-on-block b4 b1 b2
4
0 0
2 0
8 0
11 1
2
4
0 0 0 1
0 2 0 1
0 7 -1 0
0 8 0 2
3
0 0 0 1
0 7 -1 0
0 8 0 7
0
end_operator
begin_operator
put-tower-on-block b4 b1 b3
4
0 0
3 0
8 0
11 1
2
4
0 0 0 1
0 3 0 1
0 7 -1 0
0 8 0 3
3
0 0 0 1
0 7 -1 0
0 8 0 7
0
end_operator
begin_operator
put-tower-on-block b4 b1 b4
4
0 0
4 0
8 0
11 1
2
4
0 0 0 1
0 4 0 1
0 7 -1 0
0 8 0 4
3
0 0 0 1
0 7 -1 0
0 8 0 7
0
end_operator
begin_operator
put-tower-on-block b4 b1 b5
4
0 0
5 0
8 0
11 1
2
4
0 0 0 1
0 5 0 1
0 7 -1 0
0 8 0 5
3
0 0 0 1
0 7 -1 0
0 8 0 7
0
end_operator
begin_operator
put-tower-on-block b4 b1 b6
4
0 0
6 0
8 0
11 1
2
4
0 0 0 1
0 6 0 1
0 7 -1 0
0 8 0 6
3
0 0 0 1
0 7 -1 0
0 8 0 7
0
end_operator
begin_operator
put-tower-on-block b4 b2 b1
4
0 0
1 0
9 0
11 2
2
4
0 0 0 1
0 1 0 1
0 7 -1 0
0 9 0 1
3
0 0 0 1
0 7 -1 0
0 9 0 7
0
end_operator
begin_operator
put-tower-on-block b4 b2 b2
4
0 0
2 0
9 0
11 2
2
4
0 0 0 1
0 2 0 1
0 7 -1 0
0 9 0 2
3
0 0 0 1
0 7 -1 0
0 9 0 7
0
end_operator
begin_operator
put-tower-on-block b4 b2 b3
4
0 0
3 0
9 0
11 2
2
4
0 0 0 1
0 3 0 1
0 7 -1 0
0 9 0 3
3
0 0 0 1
0 7 -1 0
0 9 0 7
0
end_operator
begin_operator
put-tower-on-block b4 b2 b4
4
0 0
4 0
9 0
11 2
2
4
0 0 0 1
0 4 0 1
0 7 -1 0
0 9 0 4
3
0 0 0 1
0 7 -1 0
0 9 0 7
0
end_operator
begin_operator
put-tower-on-block b4 b2 b5
4
0 0
5 0
9 0
11 2
2
4
0 0 0 1
0 5 0 1
0 7 -1 0
0 9 0 5
3
0 0 0 1
0 7 -1 0
0 9 0 7
0
end_operator
begin_operator
put-tower-on-block b4 b2 b6
4
0 0
6 0
9 0
11 2
2
4
0 0 0 1
0 6 0 1
0 7 -1 0
0 9 0 6
3
0 0 0 1
0 7 -1 0
0 9 0 7
0
end_operator
begin_operator
put-tower-on-block b4 b3 b1
4
0 0
1 0
10 0
11 3
2
4
0 0 0 1
0 1 0 1
0 7 -1 0
0 10 0 1
3
0 0 0 1
0 7 -1 0
0 10 0 7
0
end_operator
begin_operator
put-tower-on-block b4 b3 b2
4
0 0
2 0
10 0
11 3
2
4
0 0 0 1
0 2 0 1
0 7 -1 0
0 10 0 2
3
0 0 0 1
0 7 -1 0
0 10 0 7
0
end_operator
begin_operator
put-tower-on-block b4 b3 b3
4
0 0
3 0
10 0
11 3
2
4
0 0 0 1
0 3 0 1
0 7 -1 0
0 10 0 3
3
0 0 0 1
0 7 -1 0
0 10 0 7
0
end_operator
begin_operator
put-tower-on-block b4 b3 b4
4
0 0
4 0
10 0
11 3
2
4
0 0 0 1
0 4 0 1
0 7 -1 0
0 10 0 4
3
0 0 0 1
0 7 -1 0
0 10 0 7
0
end_operator
begin_operator
put-tower-on-block b4 b3 b5
4
0 0
5 0
10 0
11 3
2
4
0 0 0 1
0 5 0 1
0 7 -1 0
0 10 0 5
3
0 0 0 1
0 7 -1 0
0 10 0 7
0
end_operator
begin_operator
put-tower-on-block b4 b3 b6
4
0 0
6 0
10 0
11 3
2
4
0 0 0 1
0 6 0 1
0 7 -1 0
0 10 0 6
3
0 0 0 1
0 7 -1 0
0 10 0 7
0
end_operator
begin_operator
put-tower-on-block b4 b5 b1
4
0 0
1 0
11 5
12 0
2
4
0 0 0 1
0 1 0 1
0 7 -1 0
0 12 0 1
3
0 0 0 1
0 7 -1 0
0 12 0 7
0
end_operator
begin_operator
put-tower-on-block b4 b5 b2
4
0 0
2 0
11 5
12 0
2
4
0 0 0 1
0 2 0 1
0 7 -1 0
0 12 0 2
3
0 0 0 1
0 7 -1 0
0 12 0 7
0
end_operator
begin_operator
put-tower-on-block b4 b5 b3
4
0 0
3 0
11 5
12 0
2
4
0 0 0 1
0 3 0 1
0 7 -1 0
0 12 0 3
3
0 0 0 1
0 7 -1 0
0 12 0 7
0
end_operator
begin_operator
put-tower-on-block b4 b5 b4
4
0 0
4 0
11 5
12 0
2
4
0 0 0 1
0 4 0 1
0 7 -1 0
0 12 0 4
3
0 0 0 1
0 7 -1 0
0 12 0 7
0
end_operator
begin_operator
put-tower-on-block b4 b5 b5
4
0 0
5 0
11 5
12 0
2
4
0 0 0 1
0 5 0 1
0 7 -1 0
0 12 0 5
3
0 0 0 1
0 7 -1 0
0 12 0 7
0
end_operator
begin_operator
put-tower-on-block b4 b5 b6
4
0 0
6 0
11 5
12 0
2
4
0 0 0 1
0 6 0 1
0 7 -1 0
0 12 0 6
3
0 0 0 1
0 7 -1 0
0 12 0 7
0
end_operator
begin_operator
put-tower-on-block b4 b6 b1
4
0 0
1 0
11 6
13 0
2
4
0 0 0 1
0 1 0 1
0 7 -1 0
0 13 0 1
3
0 0 0 1
0 7 -1 0
0 13 0 7
0
end_operator
begin_operator
put-tower-on-block b4 b6 b2
4
0 0
2 0
11 6
13 0
2
4
0 0 0 1
0 2 0 1
0 7 -1 0
0 13 0 2
3
0 0 0 1
0 7 -1 0
0 13 0 7
0
end_operator
begin_operator
put-tower-on-block b4 b6 b3
4
0 0
3 0
11 6
13 0
2
4
0 0 0 1
0 3 0 1
0 7 -1 0
0 13 0 3
3
0 0 0 1
0 7 -1 0
0 13 0 7
0
end_operator
begin_operator
put-tower-on-block b4 b6 b4
4
0 0
4 0
11 6
13 0
2
4
0 0 0 1
0 4 0 1
0 7 -1 0
0 13 0 4
3
0 0 0 1
0 7 -1 0
0 13 0 7
0
end_operator
begin_operator
put-tower-on-block b4 b6 b5
4
0 0
5 0
11 6
13 0
2
4
0 0 0 1
0 5 0 1
0 7 -1 0
0 13 0 5
3
0 0 0 1
0 7 -1 0
0 13 0 7
0
end_operator
begin_operator
put-tower-on-block b4 b6 b6
4
0 0
6 0
11 6
13 0
2
4
0 0 0 1
0 6 0 1
0 7 -1 0
0 13 0 6
3
0 0 0 1
0 7 -1 0
0 13 0 7
0
end_operator
begin_operator
put-tower-on-block b5 b1 b1
4
0 0
1 0
8 0
12 1
2
4
0 0 0 1
0 1 0 1
0 7 -1 0
0 8 0 1
3
0 0 0 1
0 7 -1 0
0 8 0 7
0
end_operator
begin_operator
put-tower-on-block b5 b1 b2
4
0 0
2 0
8 0
12 1
2
4
0 0 0 1
0 2 0 1
0 7 -1 0
0 8 0 2
3
0 0 0 1
0 7 -1 0
0 8 0 7
0
end_operator
begin_operator
put-tower-on-block b5 b1 b3
4
0 0
3 0
8 0
12 1
2
4
0 0 0 1
0 3 0 1
0 7 -1 0
0 8 0 3
3
0 0 0 1
0 7 -1 0
0 8 0 7
0
end_operator
begin_operator
put-tower-on-block b5 b1 b4
4
0 0
4 0
8 0
12 1
2
4
0 0 0 1
0 4 0 1
0 7 -1 0
0 8 0 4
3
0 0 0 1
0 7 -1 0
0 8 0 7
0
end_operator
begin_operator
put-tower-on-block b5 b1 b5
4
0 0
5 0
8 0
12 1
2
4
0 0 0 1
0 5 0 1
0 7 -1 0
0 8 0 5
3
0 0 0 1
0 7 -1 0
0 8 0 7
0
end_operator
begin_operator
put-tower-on-block b5 b1 b6
4
0 0
6 0
8 0
12 1
2
4
0 0 0 1
0 6 0 1
0 7 -1 0
0 8 0 6
3
0 0 0 1
0 7 -1 0
0 8 0 7
0
end_operator
begin_operator
put-tower-on-block b5 b2 b1
4
0 0
1 0
9 0
12 2
2
4
0 0 0 1
0 1 0 1
0 7 -1 0
0 9 0 1
3
0 0 0 1
0 7 -1 0
0 9 0 7
0
end_operator
begin_operator
put-tower-on-block b5 b2 b2
4
0 0
2 0
9 0
12 2
2
4
0 0 0 1
0 2 0 1
0 7 -1 0
0 9 0 2
3
0 0 0 1
0 7 -1 0
0 9 0 7
0
end_operator
begin_operator
put-tower-on-block b5 b2 b3
4
0 0
3 0
9 0
12 2
2
4
0 0 0 1
0 3 0 1
0 7 -1 0
0 9 0 3
3
0 0 0 1
0 7 -1 0
0 9 0 7
0
end_operator
begin_operator
put-tower-on-block b5 b2 b4
4
0 0
4 0
9 0
12 2
2
4
0 0 0 1
0 4 0 1
0 7 -1 0
0 9 0 4
3
0 0 0 1
0 7 -1 0
0 9 0 7
0
end_operator
begin_operator
put-tower-on-block b5 b2 b5
4
0 0
5 0
9 0
12 2
2
4
0 0 0 1
0 5 0 1
0 7 -1 0
0 9 0 5
3
0 0 0 1
0 7 -1 0
0 9 0 7
0
end_operator
begin_operator
put-tower-on-block b5 b2 b6
4
0 0
6 0
9 0
12 2
2
4
0 0 0 1
0 6 0 1
0 7 -1 0
0 9 0 6
3
0 0 0 1
0 7 -1 0
0 9 0 7
0
end_operator
begin_operator
put-tower-on-block b5 b3 b1
4
0 0
1 0
10 0
12 3
2
4
0 0 0 1
0 1 0 1
0 7 -1 0
0 10 0 1
3
0 0 0 1
0 7 -1 0
0 10 0 7
0
end_operator
begin_operator
put-tower-on-block b5 b3 b2
4
0 0
2 0
10 0
12 3
2
4
0 0 0 1
0 2 0 1
0 7 -1 0
0 10 0 2
3
0 0 0 1
0 7 -1 0
0 10 0 7
0
end_operator
begin_operator
put-tower-on-block b5 b3 b3
4
0 0
3 0
10 0
12 3
2
4
0 0 0 1
0 3 0 1
0 7 -1 0
0 10 0 3
3
0 0 0 1
0 7 -1 0
0 10 0 7
0
end_operator
begin_operator
put-tower-on-block b5 b3 b4
4
0 0
4 0
10 0
12 3
2
4
0 0 0 1
0 4 0 1
0 7 -1 0
0 10 0 4
3
0 0 0 1
0 7 -1 0
0 10 0 7
0
end_operator
begin_operator
put-tower-on-block b5 b3 b5
4
0 0
5 0
10 0
12 3
2
4
0 0 0 1
0 5 0 1
0 7 -1 0
0 10 0 5
3
0 0 0 1
0 7 -1 0
0 10 0 7
0
end_operator
begin_operator
put-tower-on-block b5 b3 b6
4
0 0
6 0
10 0
12 3
2
4
0 0 0 1
0 6 0 1
0 7 -1 0
0 10 0 6
3
0 0 0 1
0 7 -1 0
0 10 0 7
0
end_operator
begin_operator
put-tower-on-block b5 b4 b1
4
0 0
1 0
11 0
12 4
2
4
0 0 0 1
0 1 0 1
0 7 -1 0
0 11 0 1
3
0 0 0 1
0 7 -1 0
0 11 0 7
0
end_operator
begin_operator
put-tower-on-block b5 b4 b2
4
0 0
2 0
11 0
12 4
2
4
0 0 0 1
0 2 0 1
0 7 -1 0
0 11 0 2
3
0 0 0 1
0 7 -1 0
0 11 0 7
0
end_operator
begin_operator
put-tower-on-block b5 b4 b3
4
0 0
3 0
11 0
12 4
2
4
0 0 0 1
0 3 0 1
0 7 -1 0
0 11 0 3
3
0 0 0 1
0 7 -1 0
0 11 0 7
0
end_operator
begin_operator
put-tower-on-block b5 b4 b4
4
0 0
4 0
11 0
12 4
2
4
0 0 0 1
0 4 0 1
0 7 -1 0
0 11 0 4
3
0 0 0 1
0 7 -1 0
0 11 0 7
0
end_operator
begin_operator
put-tower-on-block b5 b4 b5
4
0 0
5 0
11 0
12 4
2
4
0 0 0 1
0 5 0 1
0 7 -1 0
0 11 0 5
3
0 0 0 1
0 7 -1 0
0 11 0 7
0
end_operator
begin_operator
put-tower-on-block b5 b4 b6
4
0 0
6 0
11 0
12 4
2
4
0 0 0 1
0 6 0 1
0 7 -1 0
0 11 0 6
3
0 0 0 1
0 7 -1 0
0 11 0 7
0
end_operator
begin_operator
put-tower-on-block b5 b6 b1
4
0 0
1 0
12 6
13 0
2
4
0 0 0 1
0 1 0 1
0 7 -1 0
0 13 0 1
3
0 0 0 1
0 7 -1 0
0 13 0 7
0
end_operator
begin_operator
put-tower-on-block b5 b6 b2
4
0 0
2 0
12 6
13 0
2
4
0 0 0 1
0 2 0 1
0 7 -1 0
0 13 0 2
3
0 0 0 1
0 7 -1 0
0 13 0 7
0
end_operator
begin_operator
put-tower-on-block b5 b6 b3
4
0 0
3 0
12 6
13 0
2
4
0 0 0 1
0 3 0 1
0 7 -1 0
0 13 0 3
3
0 0 0 1
0 7 -1 0
0 13 0 7
0
end_operator
begin_operator
put-tower-on-block b5 b6 b4
4
0 0
4 0
12 6
13 0
2
4
0 0 0 1
0 4 0 1
0 7 -1 0
0 13 0 4
3
0 0 0 1
0 7 -1 0
0 13 0 7
0
end_operator
begin_operator
put-tower-on-block b5 b6 b5
4
0 0
5 0
12 6
13 0
2
4
0 0 0 1
0 5 0 1
0 7 -1 0
0 13 0 5
3
0 0 0 1
0 7 -1 0
0 13 0 7
0
end_operator
begin_operator
put-tower-on-block b5 b6 b6
4
0 0
6 0
12 6
13 0
2
4
0 0 0 1
0 6 0 1
0 7 -1 0
0 13 0 6
3
0 0 0 1
0 7 -1 0
0 13 0 7
0
end_operator
begin_operator
put-tower-on-block b6 b1 b1
4
0 0
1 0
8 0
13 1
2
4
0 0 0 1
0 1 0 1
0 7 -1 0
0 8 0 1
3
0 0 0 1
0 7 -1 0
0 8 0 7
0
end_operator
begin_operator
put-tower-on-block b6 b1 b2
4
0 0
2 0
8 0
13 1
2
4
0 0 0 1
0 2 0 1
0 7 -1 0
0 8 0 2
3
0 0 0 1
0 7 -1 0
0 8 0 7
0
end_operator
begin_operator
put-tower-on-block b6 b1 b3
4
0 0
3 0
8 0
13 1
2
4
0 0 0 1
0 3 0 1
0 7 -1 0
0 8 0 3
3
0 0 0 1
0 7 -1 0
0 8 0 7
0
end_operator
begin_operator
put-tower-on-block b6 b1 b4
4
0 0
4 0
8 0
13 1
2
4
0 0 0 1
0 4 0 1
0 7 -1 0
0 8 0 4
3
0 0 0 1
0 7 -1 0
0 8 0 7
0
end_operator
begin_operator
put-tower-on-block b6 b1 b5
4
0 0
5 0
8 0
13 1
2
4
0 0 0 1
0 5 0 1
0 7 -1 0
0 8 0 5
3
0 0 0 1
0 7 -1 0
0 8 0 7
0
end_operator
begin_operator
put-tower-on-block b6 b1 b6
4
0 0
6 0
8 0
13 1
2
4
0 0 0 1
0 6 0 1
0 7 -1 0
0 8 0 6
3
0 0 0 1
0 7 -1 0
0 8 0 7
0
end_operator
begin_operator
put-tower-on-block b6 b2 b1
4
0 0
1 0
9 0
13 2
2
4
0 0 0 1
0 1 0 1
0 7 -1 0
0 9 0 1
3
0 0 0 1
0 7 -1 0
0 9 0 7
0
end_operator
begin_operator
put-tower-on-block b6 b2 b2
4
0 0
2 0
9 0
13 2
2
4
0 0 0 1
0 2 0 1
0 7 -1 0
0 9 0 2
3
0 0 0 1
0 7 -1 0
0 9 0 7
0
end_operator
begin_operator
put-tower-on-block b6 b2 b3
4
0 0
3 0
9 0
13 2
2
4
0 0 0 1
0 3 0 1
0 7 -1 0
0 9 0 3
3
0 0 0 1
0 7 -1 0
0 9 0 7
0
end_operator
begin_operator
put-tower-on-block b6 b2 b4
4
0 0
4 0
9 0
13 2
2
4
0 0 0 1
0 4 0 1
0 7 -1 0
0 9 0 4
3
0 0 0 1
0 7 -1 0
0 9 0 7
0
end_operator
begin_operator
put-tower-on-block b6 b2 b5
4
0 0
5 0
9 0
13 2
2
4
0 0 0 1
0 5 0 1
0 7 -1 0
0 9 0 5
3
0 0 0 1
0 7 -1 0
0 9 0 7
0
end_operator
begin_operator
put-tower-on-block b6 b2 b6
4
0 0
6 0
9 0
13 2
2
4
0 0 0 1
0 6 0 1
0 7 -1 0
0 9 0 6
3
0 0 0 1
0 7 -1 0
0 9 0 7
0
end_operator
begin_operator
put-tower-on-block b6 b3 b1
4
0 0
1 0
10 0
13 3
2
4
0 0 0 1
0 1 0 1
0 7 -1 0
0 10 0 1
3
0 0 0 1
0 7 -1 0
0 10 0 7
0
end_operator
begin_operator
put-tower-on-block b6 b3 b2
4
0 0
2 0
10 0
13 3
2
4
0 0 0 1
0 2 0 1
0 7 -1 0
0 10 0 2
3
0 0 0 1
0 7 -1 0
0 10 0 7
0
end_operator
begin_operator
put-tower-on-block b6 b3 b3
4
0 0
3 0
10 0
13 3
2
4
0 0 0 1
0 3 0 1
0 7 -1 0
0 10 0 3
3
0 0 0 1
0 7 -1 0
0 10 0 7
0
end_operator
begin_operator
put-tower-on-block b6 b3 b4
4
0 0
4 0
10 0
13 3
2
4
0 0 0 1
0 4 0 1
0 7 -1 0
0 10 0 4
3
0 0 0 1
0 7 -1 0
0 10 0 7
0
end_operator
begin_operator
put-tower-on-block b6 b3 b5
4
0 0
5 0
10 0
13 3
2
4
0 0 0 1
0 5 0 1
0 7 -1 0
0 10 0 5
3
0 0 0 1
0 7 -1 0
0 10 0 7
0
end_operator
begin_operator
put-tower-on-block b6 b3 b6
4
0 0
6 0
10 0
13 3
2
4
0 0 0 1
0 6 0 1
0 7 -1 0
0 10 0 6
3
0 0 0 1
0 7 -1 0
0 10 0 7
0
end_operator
begin_operator
put-tower-on-block b6 b4 b1
4
0 0
1 0
11 0
13 4
2
4
0 0 0 1
0 1 0 1
0 7 -1 0
0 11 0 1
3
0 0 0 1
0 7 -1 0
0 11 0 7
0
end_operator
begin_operator
put-tower-on-block b6 b4 b2
4
0 0
2 0
11 0
13 4
2
4
0 0 0 1
0 2 0 1
0 7 -1 0
0 11 0 2
3
0 0 0 1
0 7 -1 0
0 11 0 7
0
end_operator
begin_operator
put-tower-on-block b6 b4 b3
4
0 0
3 0
11 0
13 4
2
4
0 0 0 1
0 3 0 1
0 7 -1 0
0 11 0 3
3
0 0 0 1
0 7 -1 0
0 11 0 7
0
end_operator
begin_operator
put-tower-on-block b6 b4 b4
4
0 0
4 0
11 0
13 4
2
4
0 0 0 1
0 4 0 1
0 7 -1 0
0 11 0 4
3
0 0 0 1
0 7 -1 0
0 11 0 7
0
end_operator
begin_operator
put-tower-on-block b6 b4 b5
4
0 0
5 0
11 0
13 4
2
4
0 0 0 1
0 5 0 1
0 7 -1 0
0 11 0 5
3
0 0 0 1
0 7 -1 0
0 11 0 7
0
end_operator
begin_operator
put-tower-on-block b6 b4 b6
4
0 0
6 0
11 0
13 4
2
4
0 0 0 1
0 6 0 1
0 7 -1 0
0 11 0 6
3
0 0 0 1
0 7 -1 0
0 11 0 7
0
end_operator
begin_operator
put-tower-on-block b6 b5 b1
4
0 0
1 0
12 0
13 5
2
4
0 0 0 1
0 1 0 1
0 7 -1 0
0 12 0 1
3
0 0 0 1
0 7 -1 0
0 12 0 7
0
end_operator
begin_operator
put-tower-on-block b6 b5 b2
4
0 0
2 0
12 0
13 5
2
4
0 0 0 1
0 2 0 1
0 7 -1 0
0 12 0 2
3
0 0 0 1
0 7 -1 0
0 12 0 7
0
end_operator
begin_operator
put-tower-on-block b6 b5 b3
4
0 0
3 0
12 0
13 5
2
4
0 0 0 1
0 3 0 1
0 7 -1 0
0 12 0 3
3
0 0 0 1
0 7 -1 0
0 12 0 7
0
end_operator
begin_operator
put-tower-on-block b6 b5 b4
4
0 0
4 0
12 0
13 5
2
4
0 0 0 1
0 4 0 1
0 7 -1 0
0 12 0 4
3
0 0 0 1
0 7 -1 0
0 12 0 7
0
end_operator
begin_operator
put-tower-on-block b6 b5 b5
4
0 0
5 0
12 0
13 5
2
4
0 0 0 1
0 5 0 1
0 7 -1 0
0 12 0 5
3
0 0 0 1
0 7 -1 0
0 12 0 7
0
end_operator
begin_operator
put-tower-on-block b6 b5 b6
4
0 0
6 0
12 0
13 5
2
4
0 0 0 1
0 6 0 1
0 7 -1 0
0 12 0 6
3
0 0 0 1
0 7 -1 0
0 12 0 7
0
end_operator
8
begin_rule
1
8 2
16 1 0
end_rule
begin_rule
1
9 3
18 1 0
end_rule
begin_rule
1
14 0
19 1 0
end_rule
begin_rule
1
15 0
20 1 0
end_rule
begin_rule
1
15 0
21 1 0
end_rule
begin_rule
2
16 0
21 0
17 1 0
end_rule
begin_rule
1
17 0
19 1 0
end_rule
begin_rule
1
18 0
20 1 0
end_rule

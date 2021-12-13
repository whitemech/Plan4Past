begin_version
3.FOND
end_version
begin_metric
0
end_metric
21
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
Atom emptyhand()
NegatedAtom emptyhand()
end_variable
begin_variable
var7
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
var8
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
var9
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
var10
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
var11
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
begin_variable
var12
0
2
Atom val_clear_b1()
NegatedAtom val_clear_b1()
end_variable
begin_variable
var13
0
2
Atom val_clear_b5()
NegatedAtom val_clear_b5()
end_variable
begin_variable
var14
0
2
Atom val_emptyhand()
NegatedAtom val_emptyhand()
end_variable
begin_variable
var15
0
2
Atom val_emptyhand-and-on-table_b1-and-on-table_b2-and-on_b3_b2-and-on_b4_b3-and-on_b5_b4-and-clear_b1-and-clear_b5()
NegatedAtom val_emptyhand-and-on-table_b1-and-on-table_b2-and-on_b3_b2-and-on_b4_b3-and-on_b5_b4-and-clear_b1-and-clear_b5()
end_variable
begin_variable
var16
0
2
Atom val_on-table_b1()
NegatedAtom val_on-table_b1()
end_variable
begin_variable
var17
0
2
Atom val_on-table_b2()
NegatedAtom val_on-table_b2()
end_variable
begin_variable
var18
0
2
Atom val_on_b3_b2()
NegatedAtom val_on_b3_b2()
end_variable
begin_variable
var19
0
2
Atom val_on_b4_b3()
NegatedAtom val_on_b4_b3()
end_variable
begin_variable
var20
0
2
Atom val_on_b5_b4()
NegatedAtom val_on_b5_b4()
end_variable
6
begin_mutex_group
6
6 0
7 0
8 0
9 0
10 0
11 0
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
begin_mutex_group
7
11 0
11 1
11 2
11 3
11 4
11 5
11 6
end_mutex_group
begin_state
0
1
1
0
1
1
0
2
4
1
5
6
1
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
15 0
end_goal
286
begin_operator
pick-tower b1 b1 b1
3
0 0
6 0
7 1
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 6 0 1
0 7 1 0
0
end_operator
begin_operator
pick-tower b1 b2 b1
4
0 0
6 0
7 2
8 1
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 6 0 1
0 8 1 0
0
end_operator
begin_operator
pick-tower b1 b2 b2
4
0 0
6 0
7 2
8 2
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 6 0 1
0 8 2 0
0
end_operator
begin_operator
pick-tower b1 b2 b3
4
0 0
6 0
7 2
8 3
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 6 0 1
0 8 3 0
0
end_operator
begin_operator
pick-tower b1 b2 b4
4
0 0
6 0
7 2
8 4
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 6 0 1
0 8 4 0
0
end_operator
begin_operator
pick-tower b1 b2 b5
4
0 0
6 0
7 2
8 5
2
1
0 0 0 1
4
0 0 0 1
0 5 -1 0
0 6 0 1
0 8 5 0
0
end_operator
begin_operator
pick-tower b1 b3 b1
4
0 0
6 0
7 3
9 1
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 6 0 1
0 9 1 0
0
end_operator
begin_operator
pick-tower b1 b3 b2
4
0 0
6 0
7 3
9 2
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 6 0 1
0 9 2 0
0
end_operator
begin_operator
pick-tower b1 b3 b3
4
0 0
6 0
7 3
9 3
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 6 0 1
0 9 3 0
0
end_operator
begin_operator
pick-tower b1 b3 b4
4
0 0
6 0
7 3
9 4
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 6 0 1
0 9 4 0
0
end_operator
begin_operator
pick-tower b1 b3 b5
4
0 0
6 0
7 3
9 5
2
1
0 0 0 1
4
0 0 0 1
0 5 -1 0
0 6 0 1
0 9 5 0
0
end_operator
begin_operator
pick-tower b1 b4 b1
4
0 0
6 0
7 4
10 1
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 6 0 1
0 10 1 0
0
end_operator
begin_operator
pick-tower b1 b4 b2
4
0 0
6 0
7 4
10 2
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 6 0 1
0 10 2 0
0
end_operator
begin_operator
pick-tower b1 b4 b3
4
0 0
6 0
7 4
10 3
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 6 0 1
0 10 3 0
0
end_operator
begin_operator
pick-tower b1 b4 b4
4
0 0
6 0
7 4
10 4
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 6 0 1
0 10 4 0
0
end_operator
begin_operator
pick-tower b1 b4 b5
4
0 0
6 0
7 4
10 5
2
1
0 0 0 1
4
0 0 0 1
0 5 -1 0
0 6 0 1
0 10 5 0
0
end_operator
begin_operator
pick-tower b1 b5 b1
4
0 0
6 0
7 5
11 1
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 6 0 1
0 11 1 0
0
end_operator
begin_operator
pick-tower b1 b5 b2
4
0 0
6 0
7 5
11 2
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 6 0 1
0 11 2 0
0
end_operator
begin_operator
pick-tower b1 b5 b3
4
0 0
6 0
7 5
11 3
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 6 0 1
0 11 3 0
0
end_operator
begin_operator
pick-tower b1 b5 b4
4
0 0
6 0
7 5
11 4
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 6 0 1
0 11 4 0
0
end_operator
begin_operator
pick-tower b1 b5 b5
4
0 0
6 0
7 5
11 5
2
1
0 0 0 1
4
0 0 0 1
0 5 -1 0
0 6 0 1
0 11 5 0
0
end_operator
begin_operator
pick-tower b2 b1 b1
4
0 0
6 0
7 1
8 1
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 6 0 1
0 7 1 0
0
end_operator
begin_operator
pick-tower b2 b1 b2
4
0 0
6 0
7 2
8 1
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 6 0 1
0 7 2 0
0
end_operator
begin_operator
pick-tower b2 b1 b3
4
0 0
6 0
7 3
8 1
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 6 0 1
0 7 3 0
0
end_operator
begin_operator
pick-tower b2 b1 b4
4
0 0
6 0
7 4
8 1
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 6 0 1
0 7 4 0
0
end_operator
begin_operator
pick-tower b2 b1 b5
4
0 0
6 0
7 5
8 1
2
1
0 0 0 1
4
0 0 0 1
0 5 -1 0
0 6 0 1
0 7 5 0
0
end_operator
begin_operator
pick-tower b2 b2 b2
3
0 0
6 0
8 2
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 6 0 1
0 8 2 0
0
end_operator
begin_operator
pick-tower b2 b3 b1
4
0 0
6 0
8 3
9 1
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 6 0 1
0 9 1 0
0
end_operator
begin_operator
pick-tower b2 b3 b2
4
0 0
6 0
8 3
9 2
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 6 0 1
0 9 2 0
0
end_operator
begin_operator
pick-tower b2 b3 b3
4
0 0
6 0
8 3
9 3
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 6 0 1
0 9 3 0
0
end_operator
begin_operator
pick-tower b2 b3 b4
4
0 0
6 0
8 3
9 4
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 6 0 1
0 9 4 0
0
end_operator
begin_operator
pick-tower b2 b3 b5
4
0 0
6 0
8 3
9 5
2
1
0 0 0 1
4
0 0 0 1
0 5 -1 0
0 6 0 1
0 9 5 0
0
end_operator
begin_operator
pick-tower b2 b4 b1
4
0 0
6 0
8 4
10 1
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 6 0 1
0 10 1 0
0
end_operator
begin_operator
pick-tower b2 b4 b2
4
0 0
6 0
8 4
10 2
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 6 0 1
0 10 2 0
0
end_operator
begin_operator
pick-tower b2 b4 b3
4
0 0
6 0
8 4
10 3
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 6 0 1
0 10 3 0
0
end_operator
begin_operator
pick-tower b2 b4 b4
4
0 0
6 0
8 4
10 4
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 6 0 1
0 10 4 0
0
end_operator
begin_operator
pick-tower b2 b4 b5
4
0 0
6 0
8 4
10 5
2
1
0 0 0 1
4
0 0 0 1
0 5 -1 0
0 6 0 1
0 10 5 0
0
end_operator
begin_operator
pick-tower b2 b5 b1
4
0 0
6 0
8 5
11 1
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 6 0 1
0 11 1 0
0
end_operator
begin_operator
pick-tower b2 b5 b2
4
0 0
6 0
8 5
11 2
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 6 0 1
0 11 2 0
0
end_operator
begin_operator
pick-tower b2 b5 b3
4
0 0
6 0
8 5
11 3
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 6 0 1
0 11 3 0
0
end_operator
begin_operator
pick-tower b2 b5 b4
4
0 0
6 0
8 5
11 4
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 6 0 1
0 11 4 0
0
end_operator
begin_operator
pick-tower b2 b5 b5
4
0 0
6 0
8 5
11 5
2
1
0 0 0 1
4
0 0 0 1
0 5 -1 0
0 6 0 1
0 11 5 0
0
end_operator
begin_operator
pick-tower b3 b1 b1
4
0 0
6 0
7 1
9 1
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 6 0 1
0 7 1 0
0
end_operator
begin_operator
pick-tower b3 b1 b2
4
0 0
6 0
7 2
9 1
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 6 0 1
0 7 2 0
0
end_operator
begin_operator
pick-tower b3 b1 b3
4
0 0
6 0
7 3
9 1
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 6 0 1
0 7 3 0
0
end_operator
begin_operator
pick-tower b3 b1 b4
4
0 0
6 0
7 4
9 1
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 6 0 1
0 7 4 0
0
end_operator
begin_operator
pick-tower b3 b1 b5
4
0 0
6 0
7 5
9 1
2
1
0 0 0 1
4
0 0 0 1
0 5 -1 0
0 6 0 1
0 7 5 0
0
end_operator
begin_operator
pick-tower b3 b2 b1
4
0 0
6 0
8 1
9 2
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 6 0 1
0 8 1 0
0
end_operator
begin_operator
pick-tower b3 b2 b2
4
0 0
6 0
8 2
9 2
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 6 0 1
0 8 2 0
0
end_operator
begin_operator
pick-tower b3 b2 b3
4
0 0
6 0
8 3
9 2
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 6 0 1
0 8 3 0
0
end_operator
begin_operator
pick-tower b3 b2 b4
4
0 0
6 0
8 4
9 2
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 6 0 1
0 8 4 0
0
end_operator
begin_operator
pick-tower b3 b2 b5
4
0 0
6 0
8 5
9 2
2
1
0 0 0 1
4
0 0 0 1
0 5 -1 0
0 6 0 1
0 8 5 0
0
end_operator
begin_operator
pick-tower b3 b3 b3
3
0 0
6 0
9 3
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 6 0 1
0 9 3 0
0
end_operator
begin_operator
pick-tower b3 b4 b1
4
0 0
6 0
9 4
10 1
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 6 0 1
0 10 1 0
0
end_operator
begin_operator
pick-tower b3 b4 b2
4
0 0
6 0
9 4
10 2
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 6 0 1
0 10 2 0
0
end_operator
begin_operator
pick-tower b3 b4 b3
4
0 0
6 0
9 4
10 3
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 6 0 1
0 10 3 0
0
end_operator
begin_operator
pick-tower b3 b4 b4
4
0 0
6 0
9 4
10 4
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 6 0 1
0 10 4 0
0
end_operator
begin_operator
pick-tower b3 b4 b5
4
0 0
6 0
9 4
10 5
2
1
0 0 0 1
4
0 0 0 1
0 5 -1 0
0 6 0 1
0 10 5 0
0
end_operator
begin_operator
pick-tower b3 b5 b1
4
0 0
6 0
9 5
11 1
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 6 0 1
0 11 1 0
0
end_operator
begin_operator
pick-tower b3 b5 b2
4
0 0
6 0
9 5
11 2
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 6 0 1
0 11 2 0
0
end_operator
begin_operator
pick-tower b3 b5 b3
4
0 0
6 0
9 5
11 3
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 6 0 1
0 11 3 0
0
end_operator
begin_operator
pick-tower b3 b5 b4
4
0 0
6 0
9 5
11 4
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 6 0 1
0 11 4 0
0
end_operator
begin_operator
pick-tower b3 b5 b5
4
0 0
6 0
9 5
11 5
2
1
0 0 0 1
4
0 0 0 1
0 5 -1 0
0 6 0 1
0 11 5 0
0
end_operator
begin_operator
pick-tower b4 b1 b1
4
0 0
6 0
7 1
10 1
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 6 0 1
0 7 1 0
0
end_operator
begin_operator
pick-tower b4 b1 b2
4
0 0
6 0
7 2
10 1
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 6 0 1
0 7 2 0
0
end_operator
begin_operator
pick-tower b4 b1 b3
4
0 0
6 0
7 3
10 1
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 6 0 1
0 7 3 0
0
end_operator
begin_operator
pick-tower b4 b1 b4
4
0 0
6 0
7 4
10 1
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 6 0 1
0 7 4 0
0
end_operator
begin_operator
pick-tower b4 b1 b5
4
0 0
6 0
7 5
10 1
2
1
0 0 0 1
4
0 0 0 1
0 5 -1 0
0 6 0 1
0 7 5 0
0
end_operator
begin_operator
pick-tower b4 b2 b1
4
0 0
6 0
8 1
10 2
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 6 0 1
0 8 1 0
0
end_operator
begin_operator
pick-tower b4 b2 b2
4
0 0
6 0
8 2
10 2
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 6 0 1
0 8 2 0
0
end_operator
begin_operator
pick-tower b4 b2 b3
4
0 0
6 0
8 3
10 2
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 6 0 1
0 8 3 0
0
end_operator
begin_operator
pick-tower b4 b2 b4
4
0 0
6 0
8 4
10 2
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 6 0 1
0 8 4 0
0
end_operator
begin_operator
pick-tower b4 b2 b5
4
0 0
6 0
8 5
10 2
2
1
0 0 0 1
4
0 0 0 1
0 5 -1 0
0 6 0 1
0 8 5 0
0
end_operator
begin_operator
pick-tower b4 b3 b1
4
0 0
6 0
9 1
10 3
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 6 0 1
0 9 1 0
0
end_operator
begin_operator
pick-tower b4 b3 b2
4
0 0
6 0
9 2
10 3
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 6 0 1
0 9 2 0
0
end_operator
begin_operator
pick-tower b4 b3 b3
4
0 0
6 0
9 3
10 3
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 6 0 1
0 9 3 0
0
end_operator
begin_operator
pick-tower b4 b3 b4
4
0 0
6 0
9 4
10 3
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 6 0 1
0 9 4 0
0
end_operator
begin_operator
pick-tower b4 b3 b5
4
0 0
6 0
9 5
10 3
2
1
0 0 0 1
4
0 0 0 1
0 5 -1 0
0 6 0 1
0 9 5 0
0
end_operator
begin_operator
pick-tower b4 b4 b4
3
0 0
6 0
10 4
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 6 0 1
0 10 4 0
0
end_operator
begin_operator
pick-tower b4 b5 b1
4
0 0
6 0
10 5
11 1
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 6 0 1
0 11 1 0
0
end_operator
begin_operator
pick-tower b4 b5 b2
4
0 0
6 0
10 5
11 2
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 6 0 1
0 11 2 0
0
end_operator
begin_operator
pick-tower b4 b5 b3
4
0 0
6 0
10 5
11 3
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 6 0 1
0 11 3 0
0
end_operator
begin_operator
pick-tower b4 b5 b4
4
0 0
6 0
10 5
11 4
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 6 0 1
0 11 4 0
0
end_operator
begin_operator
pick-tower b4 b5 b5
4
0 0
6 0
10 5
11 5
2
1
0 0 0 1
4
0 0 0 1
0 5 -1 0
0 6 0 1
0 11 5 0
0
end_operator
begin_operator
pick-tower b5 b1 b1
4
0 0
6 0
7 1
11 1
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 6 0 1
0 7 1 0
0
end_operator
begin_operator
pick-tower b5 b1 b2
4
0 0
6 0
7 2
11 1
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 6 0 1
0 7 2 0
0
end_operator
begin_operator
pick-tower b5 b1 b3
4
0 0
6 0
7 3
11 1
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 6 0 1
0 7 3 0
0
end_operator
begin_operator
pick-tower b5 b1 b4
4
0 0
6 0
7 4
11 1
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 6 0 1
0 7 4 0
0
end_operator
begin_operator
pick-tower b5 b1 b5
4
0 0
6 0
7 5
11 1
2
1
0 0 0 1
4
0 0 0 1
0 5 -1 0
0 6 0 1
0 7 5 0
0
end_operator
begin_operator
pick-tower b5 b2 b1
4
0 0
6 0
8 1
11 2
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 6 0 1
0 8 1 0
0
end_operator
begin_operator
pick-tower b5 b2 b2
4
0 0
6 0
8 2
11 2
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 6 0 1
0 8 2 0
0
end_operator
begin_operator
pick-tower b5 b2 b3
4
0 0
6 0
8 3
11 2
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 6 0 1
0 8 3 0
0
end_operator
begin_operator
pick-tower b5 b2 b4
4
0 0
6 0
8 4
11 2
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 6 0 1
0 8 4 0
0
end_operator
begin_operator
pick-tower b5 b2 b5
4
0 0
6 0
8 5
11 2
2
1
0 0 0 1
4
0 0 0 1
0 5 -1 0
0 6 0 1
0 8 5 0
0
end_operator
begin_operator
pick-tower b5 b3 b1
4
0 0
6 0
9 1
11 3
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 6 0 1
0 9 1 0
0
end_operator
begin_operator
pick-tower b5 b3 b2
4
0 0
6 0
9 2
11 3
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 6 0 1
0 9 2 0
0
end_operator
begin_operator
pick-tower b5 b3 b3
4
0 0
6 0
9 3
11 3
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 6 0 1
0 9 3 0
0
end_operator
begin_operator
pick-tower b5 b3 b4
4
0 0
6 0
9 4
11 3
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 6 0 1
0 9 4 0
0
end_operator
begin_operator
pick-tower b5 b3 b5
4
0 0
6 0
9 5
11 3
2
1
0 0 0 1
4
0 0 0 1
0 5 -1 0
0 6 0 1
0 9 5 0
0
end_operator
begin_operator
pick-tower b5 b4 b1
4
0 0
6 0
10 1
11 4
2
1
0 0 0 1
4
0 0 0 1
0 1 -1 0
0 6 0 1
0 10 1 0
0
end_operator
begin_operator
pick-tower b5 b4 b2
4
0 0
6 0
10 2
11 4
2
1
0 0 0 1
4
0 0 0 1
0 2 -1 0
0 6 0 1
0 10 2 0
0
end_operator
begin_operator
pick-tower b5 b4 b3
4
0 0
6 0
10 3
11 4
2
1
0 0 0 1
4
0 0 0 1
0 3 -1 0
0 6 0 1
0 10 3 0
0
end_operator
begin_operator
pick-tower b5 b4 b4
4
0 0
6 0
10 4
11 4
2
1
0 0 0 1
4
0 0 0 1
0 4 -1 0
0 6 0 1
0 10 4 0
0
end_operator
begin_operator
pick-tower b5 b4 b5
4
0 0
6 0
10 5
11 4
2
1
0 0 0 1
4
0 0 0 1
0 5 -1 0
0 6 0 1
0 10 5 0
0
end_operator
begin_operator
pick-tower b5 b5 b5
3
0 0
6 0
11 5
2
1
0 0 0 1
4
0 0 0 1
0 5 -1 0
0 6 0 1
0 11 5 0
0
end_operator
begin_operator
pick-up b1 b1
4
0 0
1 0
6 0
7 1
2
3
0 0 0 1
0 6 0 1
0 7 1 0
2
0 0 0 1
0 7 1 6
0
end_operator
begin_operator
pick-up b1 b2
4
0 0
1 0
6 0
7 2
2
5
0 0 0 1
0 1 0 1
0 2 -1 0
0 6 0 1
0 7 2 0
3
0 0 0 1
0 2 -1 0
0 7 2 6
0
end_operator
begin_operator
pick-up b1 b3
4
0 0
1 0
6 0
7 3
2
5
0 0 0 1
0 1 0 1
0 3 -1 0
0 6 0 1
0 7 3 0
3
0 0 0 1
0 3 -1 0
0 7 3 6
0
end_operator
begin_operator
pick-up b1 b4
4
0 0
1 0
6 0
7 4
2
5
0 0 0 1
0 1 0 1
0 4 -1 0
0 6 0 1
0 7 4 0
3
0 0 0 1
0 4 -1 0
0 7 4 6
0
end_operator
begin_operator
pick-up b1 b5
4
0 0
1 0
6 0
7 5
2
5
0 0 0 1
0 1 0 1
0 5 -1 0
0 6 0 1
0 7 5 0
3
0 0 0 1
0 5 -1 0
0 7 5 6
0
end_operator
begin_operator
pick-up b2 b1
4
0 0
2 0
6 0
8 1
2
5
0 0 0 1
0 1 -1 0
0 2 0 1
0 6 0 1
0 8 1 0
3
0 0 0 1
0 1 -1 0
0 8 1 6
0
end_operator
begin_operator
pick-up b2 b2
4
0 0
2 0
6 0
8 2
2
3
0 0 0 1
0 6 0 1
0 8 2 0
2
0 0 0 1
0 8 2 6
0
end_operator
begin_operator
pick-up b2 b3
4
0 0
2 0
6 0
8 3
2
5
0 0 0 1
0 2 0 1
0 3 -1 0
0 6 0 1
0 8 3 0
3
0 0 0 1
0 3 -1 0
0 8 3 6
0
end_operator
begin_operator
pick-up b2 b4
4
0 0
2 0
6 0
8 4
2
5
0 0 0 1
0 2 0 1
0 4 -1 0
0 6 0 1
0 8 4 0
3
0 0 0 1
0 4 -1 0
0 8 4 6
0
end_operator
begin_operator
pick-up b2 b5
4
0 0
2 0
6 0
8 5
2
5
0 0 0 1
0 2 0 1
0 5 -1 0
0 6 0 1
0 8 5 0
3
0 0 0 1
0 5 -1 0
0 8 5 6
0
end_operator
begin_operator
pick-up b3 b1
4
0 0
3 0
6 0
9 1
2
5
0 0 0 1
0 1 -1 0
0 3 0 1
0 6 0 1
0 9 1 0
3
0 0 0 1
0 1 -1 0
0 9 1 6
0
end_operator
begin_operator
pick-up b3 b2
4
0 0
3 0
6 0
9 2
2
5
0 0 0 1
0 2 -1 0
0 3 0 1
0 6 0 1
0 9 2 0
3
0 0 0 1
0 2 -1 0
0 9 2 6
0
end_operator
begin_operator
pick-up b3 b3
4
0 0
3 0
6 0
9 3
2
3
0 0 0 1
0 6 0 1
0 9 3 0
2
0 0 0 1
0 9 3 6
0
end_operator
begin_operator
pick-up b3 b4
4
0 0
3 0
6 0
9 4
2
5
0 0 0 1
0 3 0 1
0 4 -1 0
0 6 0 1
0 9 4 0
3
0 0 0 1
0 4 -1 0
0 9 4 6
0
end_operator
begin_operator
pick-up b3 b5
4
0 0
3 0
6 0
9 5
2
5
0 0 0 1
0 3 0 1
0 5 -1 0
0 6 0 1
0 9 5 0
3
0 0 0 1
0 5 -1 0
0 9 5 6
0
end_operator
begin_operator
pick-up b4 b1
4
0 0
4 0
6 0
10 1
2
5
0 0 0 1
0 1 -1 0
0 4 0 1
0 6 0 1
0 10 1 0
3
0 0 0 1
0 1 -1 0
0 10 1 6
0
end_operator
begin_operator
pick-up b4 b2
4
0 0
4 0
6 0
10 2
2
5
0 0 0 1
0 2 -1 0
0 4 0 1
0 6 0 1
0 10 2 0
3
0 0 0 1
0 2 -1 0
0 10 2 6
0
end_operator
begin_operator
pick-up b4 b3
4
0 0
4 0
6 0
10 3
2
5
0 0 0 1
0 3 -1 0
0 4 0 1
0 6 0 1
0 10 3 0
3
0 0 0 1
0 3 -1 0
0 10 3 6
0
end_operator
begin_operator
pick-up b4 b4
4
0 0
4 0
6 0
10 4
2
3
0 0 0 1
0 6 0 1
0 10 4 0
2
0 0 0 1
0 10 4 6
0
end_operator
begin_operator
pick-up b4 b5
4
0 0
4 0
6 0
10 5
2
5
0 0 0 1
0 4 0 1
0 5 -1 0
0 6 0 1
0 10 5 0
3
0 0 0 1
0 5 -1 0
0 10 5 6
0
end_operator
begin_operator
pick-up b5 b1
4
0 0
5 0
6 0
11 1
2
5
0 0 0 1
0 1 -1 0
0 5 0 1
0 6 0 1
0 11 1 0
3
0 0 0 1
0 1 -1 0
0 11 1 6
0
end_operator
begin_operator
pick-up b5 b2
4
0 0
5 0
6 0
11 2
2
5
0 0 0 1
0 2 -1 0
0 5 0 1
0 6 0 1
0 11 2 0
3
0 0 0 1
0 2 -1 0
0 11 2 6
0
end_operator
begin_operator
pick-up b5 b3
4
0 0
5 0
6 0
11 3
2
5
0 0 0 1
0 3 -1 0
0 5 0 1
0 6 0 1
0 11 3 0
3
0 0 0 1
0 3 -1 0
0 11 3 6
0
end_operator
begin_operator
pick-up b5 b4
4
0 0
5 0
6 0
11 4
2
5
0 0 0 1
0 4 -1 0
0 5 0 1
0 6 0 1
0 11 4 0
3
0 0 0 1
0 4 -1 0
0 11 4 6
0
end_operator
begin_operator
pick-up b5 b5
4
0 0
5 0
6 0
11 5
2
3
0 0 0 1
0 6 0 1
0 11 5 0
2
0 0 0 1
0 11 5 6
0
end_operator
begin_operator
pick-up-from-table b1
4
0 0
1 0
6 0
7 6
2
1
0 0 0 1
3
0 0 0 1
0 6 0 1
0 7 6 0
0
end_operator
begin_operator
pick-up-from-table b2
4
0 0
2 0
6 0
8 6
2
1
0 0 0 1
3
0 0 0 1
0 6 0 1
0 8 6 0
0
end_operator
begin_operator
pick-up-from-table b3
4
0 0
3 0
6 0
9 6
2
1
0 0 0 1
3
0 0 0 1
0 6 0 1
0 9 6 0
0
end_operator
begin_operator
pick-up-from-table b4
4
0 0
4 0
6 0
10 6
2
1
0 0 0 1
3
0 0 0 1
0 6 0 1
0 10 6 0
0
end_operator
begin_operator
pick-up-from-table b5
4
0 0
5 0
6 0
11 6
2
1
0 0 0 1
3
0 0 0 1
0 6 0 1
0 11 6 0
0
end_operator
begin_operator
prog 
1
0 1
1
1
0 0 1 0
0
end_operator
begin_operator
put-down b1
2
0 0
7 0
1
4
0 0 0 1
0 1 -1 0
0 6 -1 0
0 7 0 6
0
end_operator
begin_operator
put-down b2
2
0 0
8 0
1
4
0 0 0 1
0 2 -1 0
0 6 -1 0
0 8 0 6
0
end_operator
begin_operator
put-down b3
2
0 0
9 0
1
4
0 0 0 1
0 3 -1 0
0 6 -1 0
0 9 0 6
0
end_operator
begin_operator
put-down b4
2
0 0
10 0
1
4
0 0 0 1
0 4 -1 0
0 6 -1 0
0 10 0 6
0
end_operator
begin_operator
put-down b5
2
0 0
11 0
1
4
0 0 0 1
0 5 -1 0
0 6 -1 0
0 11 0 6
0
end_operator
begin_operator
put-on-block b1 b1
3
0 0
1 0
7 0
2
3
0 0 0 1
0 6 -1 0
0 7 0 1
3
0 0 0 1
0 6 -1 0
0 7 0 6
0
end_operator
begin_operator
put-on-block b1 b2
3
0 0
2 0
7 0
2
5
0 0 0 1
0 1 -1 0
0 2 0 1
0 6 -1 0
0 7 0 2
4
0 0 0 1
0 1 -1 0
0 6 -1 0
0 7 0 6
0
end_operator
begin_operator
put-on-block b1 b3
3
0 0
3 0
7 0
2
5
0 0 0 1
0 1 -1 0
0 3 0 1
0 6 -1 0
0 7 0 3
4
0 0 0 1
0 1 -1 0
0 6 -1 0
0 7 0 6
0
end_operator
begin_operator
put-on-block b1 b4
3
0 0
4 0
7 0
2
5
0 0 0 1
0 1 -1 0
0 4 0 1
0 6 -1 0
0 7 0 4
4
0 0 0 1
0 1 -1 0
0 6 -1 0
0 7 0 6
0
end_operator
begin_operator
put-on-block b1 b5
3
0 0
5 0
7 0
2
5
0 0 0 1
0 1 -1 0
0 5 0 1
0 6 -1 0
0 7 0 5
4
0 0 0 1
0 1 -1 0
0 6 -1 0
0 7 0 6
0
end_operator
begin_operator
put-on-block b2 b1
3
0 0
1 0
8 0
2
5
0 0 0 1
0 1 0 1
0 2 -1 0
0 6 -1 0
0 8 0 1
4
0 0 0 1
0 2 -1 0
0 6 -1 0
0 8 0 6
0
end_operator
begin_operator
put-on-block b2 b2
3
0 0
2 0
8 0
2
3
0 0 0 1
0 6 -1 0
0 8 0 2
3
0 0 0 1
0 6 -1 0
0 8 0 6
0
end_operator
begin_operator
put-on-block b2 b3
3
0 0
3 0
8 0
2
5
0 0 0 1
0 2 -1 0
0 3 0 1
0 6 -1 0
0 8 0 3
4
0 0 0 1
0 2 -1 0
0 6 -1 0
0 8 0 6
0
end_operator
begin_operator
put-on-block b2 b4
3
0 0
4 0
8 0
2
5
0 0 0 1
0 2 -1 0
0 4 0 1
0 6 -1 0
0 8 0 4
4
0 0 0 1
0 2 -1 0
0 6 -1 0
0 8 0 6
0
end_operator
begin_operator
put-on-block b2 b5
3
0 0
5 0
8 0
2
5
0 0 0 1
0 2 -1 0
0 5 0 1
0 6 -1 0
0 8 0 5
4
0 0 0 1
0 2 -1 0
0 6 -1 0
0 8 0 6
0
end_operator
begin_operator
put-on-block b3 b1
3
0 0
1 0
9 0
2
5
0 0 0 1
0 1 0 1
0 3 -1 0
0 6 -1 0
0 9 0 1
4
0 0 0 1
0 3 -1 0
0 6 -1 0
0 9 0 6
0
end_operator
begin_operator
put-on-block b3 b2
3
0 0
2 0
9 0
2
5
0 0 0 1
0 2 0 1
0 3 -1 0
0 6 -1 0
0 9 0 2
4
0 0 0 1
0 3 -1 0
0 6 -1 0
0 9 0 6
0
end_operator
begin_operator
put-on-block b3 b3
3
0 0
3 0
9 0
2
3
0 0 0 1
0 6 -1 0
0 9 0 3
3
0 0 0 1
0 6 -1 0
0 9 0 6
0
end_operator
begin_operator
put-on-block b3 b4
3
0 0
4 0
9 0
2
5
0 0 0 1
0 3 -1 0
0 4 0 1
0 6 -1 0
0 9 0 4
4
0 0 0 1
0 3 -1 0
0 6 -1 0
0 9 0 6
0
end_operator
begin_operator
put-on-block b3 b5
3
0 0
5 0
9 0
2
5
0 0 0 1
0 3 -1 0
0 5 0 1
0 6 -1 0
0 9 0 5
4
0 0 0 1
0 3 -1 0
0 6 -1 0
0 9 0 6
0
end_operator
begin_operator
put-on-block b4 b1
3
0 0
1 0
10 0
2
5
0 0 0 1
0 1 0 1
0 4 -1 0
0 6 -1 0
0 10 0 1
4
0 0 0 1
0 4 -1 0
0 6 -1 0
0 10 0 6
0
end_operator
begin_operator
put-on-block b4 b2
3
0 0
2 0
10 0
2
5
0 0 0 1
0 2 0 1
0 4 -1 0
0 6 -1 0
0 10 0 2
4
0 0 0 1
0 4 -1 0
0 6 -1 0
0 10 0 6
0
end_operator
begin_operator
put-on-block b4 b3
3
0 0
3 0
10 0
2
5
0 0 0 1
0 3 0 1
0 4 -1 0
0 6 -1 0
0 10 0 3
4
0 0 0 1
0 4 -1 0
0 6 -1 0
0 10 0 6
0
end_operator
begin_operator
put-on-block b4 b4
3
0 0
4 0
10 0
2
3
0 0 0 1
0 6 -1 0
0 10 0 4
3
0 0 0 1
0 6 -1 0
0 10 0 6
0
end_operator
begin_operator
put-on-block b4 b5
3
0 0
5 0
10 0
2
5
0 0 0 1
0 4 -1 0
0 5 0 1
0 6 -1 0
0 10 0 5
4
0 0 0 1
0 4 -1 0
0 6 -1 0
0 10 0 6
0
end_operator
begin_operator
put-on-block b5 b1
3
0 0
1 0
11 0
2
5
0 0 0 1
0 1 0 1
0 5 -1 0
0 6 -1 0
0 11 0 1
4
0 0 0 1
0 5 -1 0
0 6 -1 0
0 11 0 6
0
end_operator
begin_operator
put-on-block b5 b2
3
0 0
2 0
11 0
2
5
0 0 0 1
0 2 0 1
0 5 -1 0
0 6 -1 0
0 11 0 2
4
0 0 0 1
0 5 -1 0
0 6 -1 0
0 11 0 6
0
end_operator
begin_operator
put-on-block b5 b3
3
0 0
3 0
11 0
2
5
0 0 0 1
0 3 0 1
0 5 -1 0
0 6 -1 0
0 11 0 3
4
0 0 0 1
0 5 -1 0
0 6 -1 0
0 11 0 6
0
end_operator
begin_operator
put-on-block b5 b4
3
0 0
4 0
11 0
2
5
0 0 0 1
0 4 0 1
0 5 -1 0
0 6 -1 0
0 11 0 4
4
0 0 0 1
0 5 -1 0
0 6 -1 0
0 11 0 6
0
end_operator
begin_operator
put-on-block b5 b5
3
0 0
5 0
11 0
2
3
0 0 0 1
0 6 -1 0
0 11 0 5
3
0 0 0 1
0 6 -1 0
0 11 0 6
0
end_operator
begin_operator
put-tower-down b1 b2
3
0 0
7 2
8 0
1
3
0 0 0 1
0 6 -1 0
0 8 0 6
0
end_operator
begin_operator
put-tower-down b1 b3
3
0 0
7 3
9 0
1
3
0 0 0 1
0 6 -1 0
0 9 0 6
0
end_operator
begin_operator
put-tower-down b1 b4
3
0 0
7 4
10 0
1
3
0 0 0 1
0 6 -1 0
0 10 0 6
0
end_operator
begin_operator
put-tower-down b1 b5
3
0 0
7 5
11 0
1
3
0 0 0 1
0 6 -1 0
0 11 0 6
0
end_operator
begin_operator
put-tower-down b2 b1
3
0 0
7 0
8 1
1
3
0 0 0 1
0 6 -1 0
0 7 0 6
0
end_operator
begin_operator
put-tower-down b2 b3
3
0 0
8 3
9 0
1
3
0 0 0 1
0 6 -1 0
0 9 0 6
0
end_operator
begin_operator
put-tower-down b2 b4
3
0 0
8 4
10 0
1
3
0 0 0 1
0 6 -1 0
0 10 0 6
0
end_operator
begin_operator
put-tower-down b2 b5
3
0 0
8 5
11 0
1
3
0 0 0 1
0 6 -1 0
0 11 0 6
0
end_operator
begin_operator
put-tower-down b3 b1
3
0 0
7 0
9 1
1
3
0 0 0 1
0 6 -1 0
0 7 0 6
0
end_operator
begin_operator
put-tower-down b3 b2
3
0 0
8 0
9 2
1
3
0 0 0 1
0 6 -1 0
0 8 0 6
0
end_operator
begin_operator
put-tower-down b3 b4
3
0 0
9 4
10 0
1
3
0 0 0 1
0 6 -1 0
0 10 0 6
0
end_operator
begin_operator
put-tower-down b3 b5
3
0 0
9 5
11 0
1
3
0 0 0 1
0 6 -1 0
0 11 0 6
0
end_operator
begin_operator
put-tower-down b4 b1
3
0 0
7 0
10 1
1
3
0 0 0 1
0 6 -1 0
0 7 0 6
0
end_operator
begin_operator
put-tower-down b4 b2
3
0 0
8 0
10 2
1
3
0 0 0 1
0 6 -1 0
0 8 0 6
0
end_operator
begin_operator
put-tower-down b4 b3
3
0 0
9 0
10 3
1
3
0 0 0 1
0 6 -1 0
0 9 0 6
0
end_operator
begin_operator
put-tower-down b4 b5
3
0 0
10 5
11 0
1
3
0 0 0 1
0 6 -1 0
0 11 0 6
0
end_operator
begin_operator
put-tower-down b5 b1
3
0 0
7 0
11 1
1
3
0 0 0 1
0 6 -1 0
0 7 0 6
0
end_operator
begin_operator
put-tower-down b5 b2
3
0 0
8 0
11 2
1
3
0 0 0 1
0 6 -1 0
0 8 0 6
0
end_operator
begin_operator
put-tower-down b5 b3
3
0 0
9 0
11 3
1
3
0 0 0 1
0 6 -1 0
0 9 0 6
0
end_operator
begin_operator
put-tower-down b5 b4
3
0 0
10 0
11 4
1
3
0 0 0 1
0 6 -1 0
0 10 0 6
0
end_operator
begin_operator
put-tower-on-block b1 b2 b1
4
0 0
1 0
7 2
8 0
2
4
0 0 0 1
0 1 0 1
0 6 -1 0
0 8 0 1
3
0 0 0 1
0 6 -1 0
0 8 0 6
0
end_operator
begin_operator
put-tower-on-block b1 b2 b2
4
0 0
2 0
7 2
8 0
2
4
0 0 0 1
0 2 0 1
0 6 -1 0
0 8 0 2
3
0 0 0 1
0 6 -1 0
0 8 0 6
0
end_operator
begin_operator
put-tower-on-block b1 b2 b3
4
0 0
3 0
7 2
8 0
2
4
0 0 0 1
0 3 0 1
0 6 -1 0
0 8 0 3
3
0 0 0 1
0 6 -1 0
0 8 0 6
0
end_operator
begin_operator
put-tower-on-block b1 b2 b4
4
0 0
4 0
7 2
8 0
2
4
0 0 0 1
0 4 0 1
0 6 -1 0
0 8 0 4
3
0 0 0 1
0 6 -1 0
0 8 0 6
0
end_operator
begin_operator
put-tower-on-block b1 b2 b5
4
0 0
5 0
7 2
8 0
2
4
0 0 0 1
0 5 0 1
0 6 -1 0
0 8 0 5
3
0 0 0 1
0 6 -1 0
0 8 0 6
0
end_operator
begin_operator
put-tower-on-block b1 b3 b1
4
0 0
1 0
7 3
9 0
2
4
0 0 0 1
0 1 0 1
0 6 -1 0
0 9 0 1
3
0 0 0 1
0 6 -1 0
0 9 0 6
0
end_operator
begin_operator
put-tower-on-block b1 b3 b2
4
0 0
2 0
7 3
9 0
2
4
0 0 0 1
0 2 0 1
0 6 -1 0
0 9 0 2
3
0 0 0 1
0 6 -1 0
0 9 0 6
0
end_operator
begin_operator
put-tower-on-block b1 b3 b3
4
0 0
3 0
7 3
9 0
2
4
0 0 0 1
0 3 0 1
0 6 -1 0
0 9 0 3
3
0 0 0 1
0 6 -1 0
0 9 0 6
0
end_operator
begin_operator
put-tower-on-block b1 b3 b4
4
0 0
4 0
7 3
9 0
2
4
0 0 0 1
0 4 0 1
0 6 -1 0
0 9 0 4
3
0 0 0 1
0 6 -1 0
0 9 0 6
0
end_operator
begin_operator
put-tower-on-block b1 b3 b5
4
0 0
5 0
7 3
9 0
2
4
0 0 0 1
0 5 0 1
0 6 -1 0
0 9 0 5
3
0 0 0 1
0 6 -1 0
0 9 0 6
0
end_operator
begin_operator
put-tower-on-block b1 b4 b1
4
0 0
1 0
7 4
10 0
2
4
0 0 0 1
0 1 0 1
0 6 -1 0
0 10 0 1
3
0 0 0 1
0 6 -1 0
0 10 0 6
0
end_operator
begin_operator
put-tower-on-block b1 b4 b2
4
0 0
2 0
7 4
10 0
2
4
0 0 0 1
0 2 0 1
0 6 -1 0
0 10 0 2
3
0 0 0 1
0 6 -1 0
0 10 0 6
0
end_operator
begin_operator
put-tower-on-block b1 b4 b3
4
0 0
3 0
7 4
10 0
2
4
0 0 0 1
0 3 0 1
0 6 -1 0
0 10 0 3
3
0 0 0 1
0 6 -1 0
0 10 0 6
0
end_operator
begin_operator
put-tower-on-block b1 b4 b4
4
0 0
4 0
7 4
10 0
2
4
0 0 0 1
0 4 0 1
0 6 -1 0
0 10 0 4
3
0 0 0 1
0 6 -1 0
0 10 0 6
0
end_operator
begin_operator
put-tower-on-block b1 b4 b5
4
0 0
5 0
7 4
10 0
2
4
0 0 0 1
0 5 0 1
0 6 -1 0
0 10 0 5
3
0 0 0 1
0 6 -1 0
0 10 0 6
0
end_operator
begin_operator
put-tower-on-block b1 b5 b1
4
0 0
1 0
7 5
11 0
2
4
0 0 0 1
0 1 0 1
0 6 -1 0
0 11 0 1
3
0 0 0 1
0 6 -1 0
0 11 0 6
0
end_operator
begin_operator
put-tower-on-block b1 b5 b2
4
0 0
2 0
7 5
11 0
2
4
0 0 0 1
0 2 0 1
0 6 -1 0
0 11 0 2
3
0 0 0 1
0 6 -1 0
0 11 0 6
0
end_operator
begin_operator
put-tower-on-block b1 b5 b3
4
0 0
3 0
7 5
11 0
2
4
0 0 0 1
0 3 0 1
0 6 -1 0
0 11 0 3
3
0 0 0 1
0 6 -1 0
0 11 0 6
0
end_operator
begin_operator
put-tower-on-block b1 b5 b4
4
0 0
4 0
7 5
11 0
2
4
0 0 0 1
0 4 0 1
0 6 -1 0
0 11 0 4
3
0 0 0 1
0 6 -1 0
0 11 0 6
0
end_operator
begin_operator
put-tower-on-block b1 b5 b5
4
0 0
5 0
7 5
11 0
2
4
0 0 0 1
0 5 0 1
0 6 -1 0
0 11 0 5
3
0 0 0 1
0 6 -1 0
0 11 0 6
0
end_operator
begin_operator
put-tower-on-block b2 b1 b1
4
0 0
1 0
7 0
8 1
2
4
0 0 0 1
0 1 0 1
0 6 -1 0
0 7 0 1
3
0 0 0 1
0 6 -1 0
0 7 0 6
0
end_operator
begin_operator
put-tower-on-block b2 b1 b2
4
0 0
2 0
7 0
8 1
2
4
0 0 0 1
0 2 0 1
0 6 -1 0
0 7 0 2
3
0 0 0 1
0 6 -1 0
0 7 0 6
0
end_operator
begin_operator
put-tower-on-block b2 b1 b3
4
0 0
3 0
7 0
8 1
2
4
0 0 0 1
0 3 0 1
0 6 -1 0
0 7 0 3
3
0 0 0 1
0 6 -1 0
0 7 0 6
0
end_operator
begin_operator
put-tower-on-block b2 b1 b4
4
0 0
4 0
7 0
8 1
2
4
0 0 0 1
0 4 0 1
0 6 -1 0
0 7 0 4
3
0 0 0 1
0 6 -1 0
0 7 0 6
0
end_operator
begin_operator
put-tower-on-block b2 b1 b5
4
0 0
5 0
7 0
8 1
2
4
0 0 0 1
0 5 0 1
0 6 -1 0
0 7 0 5
3
0 0 0 1
0 6 -1 0
0 7 0 6
0
end_operator
begin_operator
put-tower-on-block b2 b3 b1
4
0 0
1 0
8 3
9 0
2
4
0 0 0 1
0 1 0 1
0 6 -1 0
0 9 0 1
3
0 0 0 1
0 6 -1 0
0 9 0 6
0
end_operator
begin_operator
put-tower-on-block b2 b3 b2
4
0 0
2 0
8 3
9 0
2
4
0 0 0 1
0 2 0 1
0 6 -1 0
0 9 0 2
3
0 0 0 1
0 6 -1 0
0 9 0 6
0
end_operator
begin_operator
put-tower-on-block b2 b3 b3
4
0 0
3 0
8 3
9 0
2
4
0 0 0 1
0 3 0 1
0 6 -1 0
0 9 0 3
3
0 0 0 1
0 6 -1 0
0 9 0 6
0
end_operator
begin_operator
put-tower-on-block b2 b3 b4
4
0 0
4 0
8 3
9 0
2
4
0 0 0 1
0 4 0 1
0 6 -1 0
0 9 0 4
3
0 0 0 1
0 6 -1 0
0 9 0 6
0
end_operator
begin_operator
put-tower-on-block b2 b3 b5
4
0 0
5 0
8 3
9 0
2
4
0 0 0 1
0 5 0 1
0 6 -1 0
0 9 0 5
3
0 0 0 1
0 6 -1 0
0 9 0 6
0
end_operator
begin_operator
put-tower-on-block b2 b4 b1
4
0 0
1 0
8 4
10 0
2
4
0 0 0 1
0 1 0 1
0 6 -1 0
0 10 0 1
3
0 0 0 1
0 6 -1 0
0 10 0 6
0
end_operator
begin_operator
put-tower-on-block b2 b4 b2
4
0 0
2 0
8 4
10 0
2
4
0 0 0 1
0 2 0 1
0 6 -1 0
0 10 0 2
3
0 0 0 1
0 6 -1 0
0 10 0 6
0
end_operator
begin_operator
put-tower-on-block b2 b4 b3
4
0 0
3 0
8 4
10 0
2
4
0 0 0 1
0 3 0 1
0 6 -1 0
0 10 0 3
3
0 0 0 1
0 6 -1 0
0 10 0 6
0
end_operator
begin_operator
put-tower-on-block b2 b4 b4
4
0 0
4 0
8 4
10 0
2
4
0 0 0 1
0 4 0 1
0 6 -1 0
0 10 0 4
3
0 0 0 1
0 6 -1 0
0 10 0 6
0
end_operator
begin_operator
put-tower-on-block b2 b4 b5
4
0 0
5 0
8 4
10 0
2
4
0 0 0 1
0 5 0 1
0 6 -1 0
0 10 0 5
3
0 0 0 1
0 6 -1 0
0 10 0 6
0
end_operator
begin_operator
put-tower-on-block b2 b5 b1
4
0 0
1 0
8 5
11 0
2
4
0 0 0 1
0 1 0 1
0 6 -1 0
0 11 0 1
3
0 0 0 1
0 6 -1 0
0 11 0 6
0
end_operator
begin_operator
put-tower-on-block b2 b5 b2
4
0 0
2 0
8 5
11 0
2
4
0 0 0 1
0 2 0 1
0 6 -1 0
0 11 0 2
3
0 0 0 1
0 6 -1 0
0 11 0 6
0
end_operator
begin_operator
put-tower-on-block b2 b5 b3
4
0 0
3 0
8 5
11 0
2
4
0 0 0 1
0 3 0 1
0 6 -1 0
0 11 0 3
3
0 0 0 1
0 6 -1 0
0 11 0 6
0
end_operator
begin_operator
put-tower-on-block b2 b5 b4
4
0 0
4 0
8 5
11 0
2
4
0 0 0 1
0 4 0 1
0 6 -1 0
0 11 0 4
3
0 0 0 1
0 6 -1 0
0 11 0 6
0
end_operator
begin_operator
put-tower-on-block b2 b5 b5
4
0 0
5 0
8 5
11 0
2
4
0 0 0 1
0 5 0 1
0 6 -1 0
0 11 0 5
3
0 0 0 1
0 6 -1 0
0 11 0 6
0
end_operator
begin_operator
put-tower-on-block b3 b1 b1
4
0 0
1 0
7 0
9 1
2
4
0 0 0 1
0 1 0 1
0 6 -1 0
0 7 0 1
3
0 0 0 1
0 6 -1 0
0 7 0 6
0
end_operator
begin_operator
put-tower-on-block b3 b1 b2
4
0 0
2 0
7 0
9 1
2
4
0 0 0 1
0 2 0 1
0 6 -1 0
0 7 0 2
3
0 0 0 1
0 6 -1 0
0 7 0 6
0
end_operator
begin_operator
put-tower-on-block b3 b1 b3
4
0 0
3 0
7 0
9 1
2
4
0 0 0 1
0 3 0 1
0 6 -1 0
0 7 0 3
3
0 0 0 1
0 6 -1 0
0 7 0 6
0
end_operator
begin_operator
put-tower-on-block b3 b1 b4
4
0 0
4 0
7 0
9 1
2
4
0 0 0 1
0 4 0 1
0 6 -1 0
0 7 0 4
3
0 0 0 1
0 6 -1 0
0 7 0 6
0
end_operator
begin_operator
put-tower-on-block b3 b1 b5
4
0 0
5 0
7 0
9 1
2
4
0 0 0 1
0 5 0 1
0 6 -1 0
0 7 0 5
3
0 0 0 1
0 6 -1 0
0 7 0 6
0
end_operator
begin_operator
put-tower-on-block b3 b2 b1
4
0 0
1 0
8 0
9 2
2
4
0 0 0 1
0 1 0 1
0 6 -1 0
0 8 0 1
3
0 0 0 1
0 6 -1 0
0 8 0 6
0
end_operator
begin_operator
put-tower-on-block b3 b2 b2
4
0 0
2 0
8 0
9 2
2
4
0 0 0 1
0 2 0 1
0 6 -1 0
0 8 0 2
3
0 0 0 1
0 6 -1 0
0 8 0 6
0
end_operator
begin_operator
put-tower-on-block b3 b2 b3
4
0 0
3 0
8 0
9 2
2
4
0 0 0 1
0 3 0 1
0 6 -1 0
0 8 0 3
3
0 0 0 1
0 6 -1 0
0 8 0 6
0
end_operator
begin_operator
put-tower-on-block b3 b2 b4
4
0 0
4 0
8 0
9 2
2
4
0 0 0 1
0 4 0 1
0 6 -1 0
0 8 0 4
3
0 0 0 1
0 6 -1 0
0 8 0 6
0
end_operator
begin_operator
put-tower-on-block b3 b2 b5
4
0 0
5 0
8 0
9 2
2
4
0 0 0 1
0 5 0 1
0 6 -1 0
0 8 0 5
3
0 0 0 1
0 6 -1 0
0 8 0 6
0
end_operator
begin_operator
put-tower-on-block b3 b4 b1
4
0 0
1 0
9 4
10 0
2
4
0 0 0 1
0 1 0 1
0 6 -1 0
0 10 0 1
3
0 0 0 1
0 6 -1 0
0 10 0 6
0
end_operator
begin_operator
put-tower-on-block b3 b4 b2
4
0 0
2 0
9 4
10 0
2
4
0 0 0 1
0 2 0 1
0 6 -1 0
0 10 0 2
3
0 0 0 1
0 6 -1 0
0 10 0 6
0
end_operator
begin_operator
put-tower-on-block b3 b4 b3
4
0 0
3 0
9 4
10 0
2
4
0 0 0 1
0 3 0 1
0 6 -1 0
0 10 0 3
3
0 0 0 1
0 6 -1 0
0 10 0 6
0
end_operator
begin_operator
put-tower-on-block b3 b4 b4
4
0 0
4 0
9 4
10 0
2
4
0 0 0 1
0 4 0 1
0 6 -1 0
0 10 0 4
3
0 0 0 1
0 6 -1 0
0 10 0 6
0
end_operator
begin_operator
put-tower-on-block b3 b4 b5
4
0 0
5 0
9 4
10 0
2
4
0 0 0 1
0 5 0 1
0 6 -1 0
0 10 0 5
3
0 0 0 1
0 6 -1 0
0 10 0 6
0
end_operator
begin_operator
put-tower-on-block b3 b5 b1
4
0 0
1 0
9 5
11 0
2
4
0 0 0 1
0 1 0 1
0 6 -1 0
0 11 0 1
3
0 0 0 1
0 6 -1 0
0 11 0 6
0
end_operator
begin_operator
put-tower-on-block b3 b5 b2
4
0 0
2 0
9 5
11 0
2
4
0 0 0 1
0 2 0 1
0 6 -1 0
0 11 0 2
3
0 0 0 1
0 6 -1 0
0 11 0 6
0
end_operator
begin_operator
put-tower-on-block b3 b5 b3
4
0 0
3 0
9 5
11 0
2
4
0 0 0 1
0 3 0 1
0 6 -1 0
0 11 0 3
3
0 0 0 1
0 6 -1 0
0 11 0 6
0
end_operator
begin_operator
put-tower-on-block b3 b5 b4
4
0 0
4 0
9 5
11 0
2
4
0 0 0 1
0 4 0 1
0 6 -1 0
0 11 0 4
3
0 0 0 1
0 6 -1 0
0 11 0 6
0
end_operator
begin_operator
put-tower-on-block b3 b5 b5
4
0 0
5 0
9 5
11 0
2
4
0 0 0 1
0 5 0 1
0 6 -1 0
0 11 0 5
3
0 0 0 1
0 6 -1 0
0 11 0 6
0
end_operator
begin_operator
put-tower-on-block b4 b1 b1
4
0 0
1 0
7 0
10 1
2
4
0 0 0 1
0 1 0 1
0 6 -1 0
0 7 0 1
3
0 0 0 1
0 6 -1 0
0 7 0 6
0
end_operator
begin_operator
put-tower-on-block b4 b1 b2
4
0 0
2 0
7 0
10 1
2
4
0 0 0 1
0 2 0 1
0 6 -1 0
0 7 0 2
3
0 0 0 1
0 6 -1 0
0 7 0 6
0
end_operator
begin_operator
put-tower-on-block b4 b1 b3
4
0 0
3 0
7 0
10 1
2
4
0 0 0 1
0 3 0 1
0 6 -1 0
0 7 0 3
3
0 0 0 1
0 6 -1 0
0 7 0 6
0
end_operator
begin_operator
put-tower-on-block b4 b1 b4
4
0 0
4 0
7 0
10 1
2
4
0 0 0 1
0 4 0 1
0 6 -1 0
0 7 0 4
3
0 0 0 1
0 6 -1 0
0 7 0 6
0
end_operator
begin_operator
put-tower-on-block b4 b1 b5
4
0 0
5 0
7 0
10 1
2
4
0 0 0 1
0 5 0 1
0 6 -1 0
0 7 0 5
3
0 0 0 1
0 6 -1 0
0 7 0 6
0
end_operator
begin_operator
put-tower-on-block b4 b2 b1
4
0 0
1 0
8 0
10 2
2
4
0 0 0 1
0 1 0 1
0 6 -1 0
0 8 0 1
3
0 0 0 1
0 6 -1 0
0 8 0 6
0
end_operator
begin_operator
put-tower-on-block b4 b2 b2
4
0 0
2 0
8 0
10 2
2
4
0 0 0 1
0 2 0 1
0 6 -1 0
0 8 0 2
3
0 0 0 1
0 6 -1 0
0 8 0 6
0
end_operator
begin_operator
put-tower-on-block b4 b2 b3
4
0 0
3 0
8 0
10 2
2
4
0 0 0 1
0 3 0 1
0 6 -1 0
0 8 0 3
3
0 0 0 1
0 6 -1 0
0 8 0 6
0
end_operator
begin_operator
put-tower-on-block b4 b2 b4
4
0 0
4 0
8 0
10 2
2
4
0 0 0 1
0 4 0 1
0 6 -1 0
0 8 0 4
3
0 0 0 1
0 6 -1 0
0 8 0 6
0
end_operator
begin_operator
put-tower-on-block b4 b2 b5
4
0 0
5 0
8 0
10 2
2
4
0 0 0 1
0 5 0 1
0 6 -1 0
0 8 0 5
3
0 0 0 1
0 6 -1 0
0 8 0 6
0
end_operator
begin_operator
put-tower-on-block b4 b3 b1
4
0 0
1 0
9 0
10 3
2
4
0 0 0 1
0 1 0 1
0 6 -1 0
0 9 0 1
3
0 0 0 1
0 6 -1 0
0 9 0 6
0
end_operator
begin_operator
put-tower-on-block b4 b3 b2
4
0 0
2 0
9 0
10 3
2
4
0 0 0 1
0 2 0 1
0 6 -1 0
0 9 0 2
3
0 0 0 1
0 6 -1 0
0 9 0 6
0
end_operator
begin_operator
put-tower-on-block b4 b3 b3
4
0 0
3 0
9 0
10 3
2
4
0 0 0 1
0 3 0 1
0 6 -1 0
0 9 0 3
3
0 0 0 1
0 6 -1 0
0 9 0 6
0
end_operator
begin_operator
put-tower-on-block b4 b3 b4
4
0 0
4 0
9 0
10 3
2
4
0 0 0 1
0 4 0 1
0 6 -1 0
0 9 0 4
3
0 0 0 1
0 6 -1 0
0 9 0 6
0
end_operator
begin_operator
put-tower-on-block b4 b3 b5
4
0 0
5 0
9 0
10 3
2
4
0 0 0 1
0 5 0 1
0 6 -1 0
0 9 0 5
3
0 0 0 1
0 6 -1 0
0 9 0 6
0
end_operator
begin_operator
put-tower-on-block b4 b5 b1
4
0 0
1 0
10 5
11 0
2
4
0 0 0 1
0 1 0 1
0 6 -1 0
0 11 0 1
3
0 0 0 1
0 6 -1 0
0 11 0 6
0
end_operator
begin_operator
put-tower-on-block b4 b5 b2
4
0 0
2 0
10 5
11 0
2
4
0 0 0 1
0 2 0 1
0 6 -1 0
0 11 0 2
3
0 0 0 1
0 6 -1 0
0 11 0 6
0
end_operator
begin_operator
put-tower-on-block b4 b5 b3
4
0 0
3 0
10 5
11 0
2
4
0 0 0 1
0 3 0 1
0 6 -1 0
0 11 0 3
3
0 0 0 1
0 6 -1 0
0 11 0 6
0
end_operator
begin_operator
put-tower-on-block b4 b5 b4
4
0 0
4 0
10 5
11 0
2
4
0 0 0 1
0 4 0 1
0 6 -1 0
0 11 0 4
3
0 0 0 1
0 6 -1 0
0 11 0 6
0
end_operator
begin_operator
put-tower-on-block b4 b5 b5
4
0 0
5 0
10 5
11 0
2
4
0 0 0 1
0 5 0 1
0 6 -1 0
0 11 0 5
3
0 0 0 1
0 6 -1 0
0 11 0 6
0
end_operator
begin_operator
put-tower-on-block b5 b1 b1
4
0 0
1 0
7 0
11 1
2
4
0 0 0 1
0 1 0 1
0 6 -1 0
0 7 0 1
3
0 0 0 1
0 6 -1 0
0 7 0 6
0
end_operator
begin_operator
put-tower-on-block b5 b1 b2
4
0 0
2 0
7 0
11 1
2
4
0 0 0 1
0 2 0 1
0 6 -1 0
0 7 0 2
3
0 0 0 1
0 6 -1 0
0 7 0 6
0
end_operator
begin_operator
put-tower-on-block b5 b1 b3
4
0 0
3 0
7 0
11 1
2
4
0 0 0 1
0 3 0 1
0 6 -1 0
0 7 0 3
3
0 0 0 1
0 6 -1 0
0 7 0 6
0
end_operator
begin_operator
put-tower-on-block b5 b1 b4
4
0 0
4 0
7 0
11 1
2
4
0 0 0 1
0 4 0 1
0 6 -1 0
0 7 0 4
3
0 0 0 1
0 6 -1 0
0 7 0 6
0
end_operator
begin_operator
put-tower-on-block b5 b1 b5
4
0 0
5 0
7 0
11 1
2
4
0 0 0 1
0 5 0 1
0 6 -1 0
0 7 0 5
3
0 0 0 1
0 6 -1 0
0 7 0 6
0
end_operator
begin_operator
put-tower-on-block b5 b2 b1
4
0 0
1 0
8 0
11 2
2
4
0 0 0 1
0 1 0 1
0 6 -1 0
0 8 0 1
3
0 0 0 1
0 6 -1 0
0 8 0 6
0
end_operator
begin_operator
put-tower-on-block b5 b2 b2
4
0 0
2 0
8 0
11 2
2
4
0 0 0 1
0 2 0 1
0 6 -1 0
0 8 0 2
3
0 0 0 1
0 6 -1 0
0 8 0 6
0
end_operator
begin_operator
put-tower-on-block b5 b2 b3
4
0 0
3 0
8 0
11 2
2
4
0 0 0 1
0 3 0 1
0 6 -1 0
0 8 0 3
3
0 0 0 1
0 6 -1 0
0 8 0 6
0
end_operator
begin_operator
put-tower-on-block b5 b2 b4
4
0 0
4 0
8 0
11 2
2
4
0 0 0 1
0 4 0 1
0 6 -1 0
0 8 0 4
3
0 0 0 1
0 6 -1 0
0 8 0 6
0
end_operator
begin_operator
put-tower-on-block b5 b2 b5
4
0 0
5 0
8 0
11 2
2
4
0 0 0 1
0 5 0 1
0 6 -1 0
0 8 0 5
3
0 0 0 1
0 6 -1 0
0 8 0 6
0
end_operator
begin_operator
put-tower-on-block b5 b3 b1
4
0 0
1 0
9 0
11 3
2
4
0 0 0 1
0 1 0 1
0 6 -1 0
0 9 0 1
3
0 0 0 1
0 6 -1 0
0 9 0 6
0
end_operator
begin_operator
put-tower-on-block b5 b3 b2
4
0 0
2 0
9 0
11 3
2
4
0 0 0 1
0 2 0 1
0 6 -1 0
0 9 0 2
3
0 0 0 1
0 6 -1 0
0 9 0 6
0
end_operator
begin_operator
put-tower-on-block b5 b3 b3
4
0 0
3 0
9 0
11 3
2
4
0 0 0 1
0 3 0 1
0 6 -1 0
0 9 0 3
3
0 0 0 1
0 6 -1 0
0 9 0 6
0
end_operator
begin_operator
put-tower-on-block b5 b3 b4
4
0 0
4 0
9 0
11 3
2
4
0 0 0 1
0 4 0 1
0 6 -1 0
0 9 0 4
3
0 0 0 1
0 6 -1 0
0 9 0 6
0
end_operator
begin_operator
put-tower-on-block b5 b3 b5
4
0 0
5 0
9 0
11 3
2
4
0 0 0 1
0 5 0 1
0 6 -1 0
0 9 0 5
3
0 0 0 1
0 6 -1 0
0 9 0 6
0
end_operator
begin_operator
put-tower-on-block b5 b4 b1
4
0 0
1 0
10 0
11 4
2
4
0 0 0 1
0 1 0 1
0 6 -1 0
0 10 0 1
3
0 0 0 1
0 6 -1 0
0 10 0 6
0
end_operator
begin_operator
put-tower-on-block b5 b4 b2
4
0 0
2 0
10 0
11 4
2
4
0 0 0 1
0 2 0 1
0 6 -1 0
0 10 0 2
3
0 0 0 1
0 6 -1 0
0 10 0 6
0
end_operator
begin_operator
put-tower-on-block b5 b4 b3
4
0 0
3 0
10 0
11 4
2
4
0 0 0 1
0 3 0 1
0 6 -1 0
0 10 0 3
3
0 0 0 1
0 6 -1 0
0 10 0 6
0
end_operator
begin_operator
put-tower-on-block b5 b4 b4
4
0 0
4 0
10 0
11 4
2
4
0 0 0 1
0 4 0 1
0 6 -1 0
0 10 0 4
3
0 0 0 1
0 6 -1 0
0 10 0 6
0
end_operator
begin_operator
put-tower-on-block b5 b4 b5
4
0 0
5 0
10 0
11 4
2
4
0 0 0 1
0 5 0 1
0 6 -1 0
0 10 0 5
3
0 0 0 1
0 6 -1 0
0 10 0 6
0
end_operator
9
begin_rule
1
1 0
12 1 0
end_rule
begin_rule
1
5 0
13 1 0
end_rule
begin_rule
1
6 0
14 1 0
end_rule
begin_rule
1
7 6
16 1 0
end_rule
begin_rule
1
8 6
17 1 0
end_rule
begin_rule
1
9 2
18 1 0
end_rule
begin_rule
1
10 3
19 1 0
end_rule
begin_rule
1
11 4
20 1 0
end_rule
begin_rule
8
12 0
13 0
14 0
16 0
17 0
18 0
19 0
20 0
15 1 0
end_rule

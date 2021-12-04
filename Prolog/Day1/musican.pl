musican(p1, guitar).
musican(p2, piano).
musican(p3, drums).
musican(p4, drums).
musican(p5, guitar).
musican(p6, piano).
musican(p7, drums).


style(p1, jazz).
style(p2, jazz).
style(p3, popular).
style(p4, popular).
style(p5, classical).
style(p6, classical).
style(p7, randb).


tool(X, Y) :- musican(Y, X).

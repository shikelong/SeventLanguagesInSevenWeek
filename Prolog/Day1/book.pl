book(myJourney, debroy).
book(book1, narayan).
book(theEarth, debroy).
book(earthquake, debroy).
book(marry, narayan).


author_book(X, Y) :- book(Y, X).
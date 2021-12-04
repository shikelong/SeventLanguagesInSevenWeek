food_type(apple, fruit).
food_type(banana, fruit).
food_type(orange, fruit).
food_type(pear, fruit).
food_type(jolt, soda).
food_type(coke, soda).
food_type(sprite, soda).
food_type(spam, meat).
food_type(egg, meat).
food_type(bacon, meat).


flavor(sweet, fruit).
flavor(savory, meat).
flavor(sweet, soda).

food_flavor(X, Y) :- food_type(X, Z), flavor(Y, Z).
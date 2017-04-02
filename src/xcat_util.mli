val id : 'a -> 'a

val const : 'a -> ('b -> 'a)

val compose : ('b -> 'c) -> ('a -> 'b) -> 'a -> 'c

val flip : ('a -> 'b -> 'c) -> 'b -> 'a -> 'c

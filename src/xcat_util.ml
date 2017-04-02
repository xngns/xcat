let id x = x

let const x _ = x

let compose f g = fun x -> f (g x)

let flip f x y = f y x

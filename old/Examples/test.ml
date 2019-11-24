fun x y -> x+y;;

fun x -> x 1 + 1;;

fun x -> 1+x 1;;

(fun f -> 1+f 1) (fun x -> x*x);;

(fun f -> (fun x -> (fun x -> (fun x -> (fun x -> x)))));;

(fun f -> (fun x -> 1+f(x+1))) (fun x -> x+1);;

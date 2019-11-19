let init c f= 
  let rec aux acc c = function
    if c = 0 then
      []
    else
      aux((c-1) ([f c]::acc))
    | _ -> acc
  in aux [];;

init 10 (fun x -> x*x);;






let cat = 
  let rec aux acc = function
      hd::tl -> aux (acc ^ hd) tl
    | _ -> acc
  in aux "";;

cat ["This";"is ";"awesome!"];;

let cat_fold =
  List.fold_left (^) "";;

cat_fold ["This";"is ";"awesome!"];;

let filter f= 
  let rec aux acc = function
    hd::tl -> if f hd then aux (acc@[hd]) tl else aux acc tl
    | _ -> acc
  in aux [];;

filter ((<) 0) [0;2;-2;0;3];;

let filter_fold f=
  List.fold_left (fun a x -> if f x then a@[x] else a) [];;

filter_fold ((<) 0) [0;2;-2;0;3];;

let reverse =
  List.fold_left (fun a x -> x::a )  [];;

reverse [1;2;3];;

let map f =
  List.fold_left (fun a x -> a@[f x]) [];;

map String.length ["asdv"; "jigon"];;









































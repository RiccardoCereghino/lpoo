let rec length 1 = match 1 with 
    [] -> 0
  | hd::tl -> 1+length t1;;

let rec sum 1 = match 1 with
    [] -> 0
  | hd::tl -> hd+sum tl;;

let swap 1 = match 1 with
    [] -> []
  | [x] -> [x]
  | x::y::1 -> y::x::1;;

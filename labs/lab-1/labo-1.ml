print_endline("prod");;

let rec prod l = match l with
    [] -> 1
    | hd::tl -> hd * prod tl;;


print_endline("gen_sum");;

let rec gen_sum f =
  function [] -> 0 | hd::tl -> f hd + gen_sum f tl;;


print_endline("member");;

let rec member e =
  function [] -> false
    | hd::tl -> if hd=e then true else member e tl;;

print_endline("insert");;

let insert e l =
  if member e l then
    l
  else
    l @ [e];;

print_endline("reverse");;

let rec reverse =
  function [] -> []
    | hd::tl -> reverse tl @ [hd];;

reverse [3;4;5];;


print_endline("odd");;

let rec odd =
  function [] -> []
    | hd::md::tl -> [hd] @ odd tl
    | other -> other;;


print_endline("ord_insert");;

let rec ord_insert e =
  function [] -> [e]
    | hd::tl -> if member e ([hd]@tl) then
        hd::tl
      else if hd < e then
        [hd] @ ord_insert e tl
      else
        [e] @ hd::tl;;

ord_insert 1 [2;5;23;56];;


print_endline("merge");;

let rec merge (l1,l2) =
  match l2 with
  | [] -> l1
  | hd::tl -> ord_insert hd (merge(l1, tl));;


print_endline("curried_merge");;

let rec curried_merge (l1,l2) =
  match l2 with
  | [] -> l1
  | hd::tl -> ord_insert hd (curried_merge(l1, tl));;

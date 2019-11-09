(* accumulators and tail recursion *)

let acc_sum = 
  let rec aux acc = function
      hd::tl -> aux (acc+hd) tl
    | _ -> acc
  in aux 0;; 

let l=List.init 1_000_000 (fun x->x+1) (*creates [1;2;...;1_000_000]*)
in acc_sum l;;

let acc_rev l = (*parameter l needed to get a polymorphic function*)  
  let rec aux acc = function
      hd::tl -> aux (hd::acc) tl
    | _ -> acc
  in aux [] l;;

let l=List.init 10_000 (fun x->x+1) (*creates list [1;2;...;10_000]*)
in acc_rev l;; 

(* strings *)

let s="hello"^" "^"world";;

(^);;

String.length s;;

String.uppercase_ascii s;;

String.lowercase_ascii "HELLO WORLD";;

(* generic functions on lists *)

let map f =
  let rec aux acc = function (* acc contains a list *)
      hd::tl -> aux (f hd::acc) tl (* put f hd on the head of acc*) 
    | _ -> List.rev acc (* reverse the list *)
  in aux [];; 

map ((+)1) [1;2;3];;

map String.length ["apple"; "orange" ];;

map String.uppercase_ascii ["apple"; "orange" ];;

let fold_left f = 
  let rec aux acc = function
      hd::tl -> aux (f acc hd) tl
    | _ -> acc
  in aux;;

let sum_list = fold_left (+) 0;; (* (+):int -> int -> int *)

sum_list [1;2;3;4];;

let prod_list = fold_left ( * ) 1;; (* ( * ):int -> int -> int *)

prod_list [1;2;3;4];;

let square_list = fold_left (fun acc hd -> acc+hd*hd) 0;;

square_list [1;2;3;4];;

(* exceptions *)

exception Fault;; (* constant constructor *)
exception Fault1 of string;; (* a unary constructor *)
exception Fault2 of string*exn;; (* a binary constructor *)
let exc=Fault;;
let exc1=Fault1 "error message";;
let exc2=Fault2 ("msg",exc);;

(* self-explanatory, no additional info *)
exception Division_by_zero;; 
      
(* general exception with an error message *)
exception Failure of string;; 

(* self-explanatory, associated info: function  name *)
exception Invalid_argument of string;; 

(* self-explanatory, associated info: file name, code line and column *)
exception  Match_failure of string*int*int;; 

let failwith msg = raise (Failure msg);; (* failwith : string -> 'a *)

let hd = function 
    hd::_ -> hd
  | _ -> failwith "hd";;

(* variant types *)

type color = Red | Green | Blue;; (* just constant constructors *)

let to_string = function (* to_string : color -> string *)
    Red -> "red"
  | Green -> "green"
  | Blue -> "blue";;

List.map to_string [Red; Blue; Green; Blue];;

type shape = Square of float | Circle of float
      | Rectangle of float * float;; 

let perimeter = function  (* perimeter : shape -> float *)
    Square side -> 4.0 *. side
  | Circle ray -> 2.0 *. Float.pi *. ray
  | Rectangle (width,height) -> 2.0 *. (width +. height);;

perimeter (Square 4.0);;

(* abstract syntax tree implementation *)
type exp_ast = NumLit of int | Sign of exp_ast
      | Mul of exp_ast * exp_ast | Add of exp_ast * exp_ast;; 

let rec eval = function (* eval : exp_ast -> int *)
    NumLit n -> n
  | Sign t -> - eval t
  | Mul (t1,t2) -> (eval t1) * eval t2
  | Add (t1,t2) -> (eval t1) + eval t2;;      

let ast = Sign(Add(NumLit 40,NumLit 2));;
eval ast;;

type 'a option = None | Some of 'a;;

let get = function (* get : 'a option -> 'a *)
    Some v -> v
  | _ -> raise (Invalid_argument "get");;

let find p = (* find : ('a -> bool) -> 'a list -> 'a option *)
    let rec aux = function
        hd::tl -> if p hd then Some hd else aux tl
      | _ -> None
    in aux;;

let v=find ((<) 0) [-1;-2;3];;

get v;;

type 'a btree = Empty | Node of 'a * 'a btree * 'a btree;;

(* member and insert in binary search trees *)

let rec member el = function (* member : 'a -> 'a btree -> bool *)
    Node(label,left,right) ->
        el=label || el<label && member el left || member el right
  | _ -> false;;

let rec insert el = function (* insert : 'a -> 'a btree -> 'a btree *)
    Node(label,left,right) as t -> 
        if el=label then t 
        else if el<label then Node(label,insert el left,right) 
        else Node(label, left, insert el right)
  | _ -> Node(el,Empty,Empty);;

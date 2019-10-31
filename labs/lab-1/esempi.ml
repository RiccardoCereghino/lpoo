let gen_sum f = 
  let rec aux n = if n<=0 then 0 else f n+aux (n-1) 
  in aux;;

let sumsquare = gen_sum (fun x->x*x);;
let sumcube = gen_sum (fun x->x*x*x);; 

let gen_sum2 f min = 
  let rec aux n = if n<min then 0 else f n+aux (n-1) 
  in aux;; 

let sumsquare2 = gen_sum2 (fun x->x*x) 1;;
let sumcube2 = gen_sum2 (fun x->x*x*x) 1;; 

let gen_sum3 f min step = 
  let rec aux x n = if n<=0 then 0 else f x+aux (x+step) (n-1) 
  in aux min;; 

let sumsquare3 = gen_sum3 (fun x->x*x) 1 1;;
let sumcube3 = gen_sum3 (fun x->x*x*x) 1 1;; 

let mynot = function false -> true | _ -> false;; 

let iszero = function 0 -> true | _ -> false;;

let rec length = function 
    _::tl -> 1+length tl 
  | _ -> 0;;

let rec sum = function 
    hd::tl -> hd+sum tl 
  | _ -> 0;;

let swap = function 
    x::y::l -> y::x::l 
  | other -> other;;

let ord_swap = function
    x::y::tl as l -> if x>y then y::x::tl else l
  | other -> other;;



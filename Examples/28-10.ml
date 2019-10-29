let gen_sum f =
  let rec aux n = if n<=0 then 0 else f n+aux (n-1)
  in aux;;

let sumsquare = gen_sum (fun x->x*x);;
let sumcube = gen_sum (fun x->x*x*x);;

let gen_sum2 f min=
  let rec aux n = if n<min then 0 else f n+aux (n-1)
  in aux;;

let sumsquare2 = gen_sum2 (fun x->x*x) 1;;
let sumcube2 = gen_sum2 (fun x->x*x*x) 1;;

sumsquare 5 == sumsquare2 5;;
sumcube 5 == sumcube2 5;;

let gen_sum3 f min step =
  let rec aux x n = if n<=0 then 0 else f x+aux (x+step) (n-1)
  in aux min;;

let sumsquare3 = gen_sum3 (fun x->x*x) 1 1;;
let sumcube3 = gen_sum3 (fun x->x*x*x) 1 1;;

sumsquare 5 == sumsquare3 5;;
sumcube 5 == sumcube3 5;;

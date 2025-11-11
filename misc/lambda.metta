(: apply (-> Expression %Undefined% %Undefined%))
(= (apply (lambda $var $body) $arg)
    (eval (let $var $arg $body)))

;; the above definition assumes that $var is used in $body, 
;; i.e, the function definition contains $var whatever form that could be, a singleton, or an expression of variables
;; these are fake lambdas
(= (applyL1)
    (apply (lambda $x (+ $x 1)) 2))

!(test (applyL1) 3)

(= (applyL2)
    (apply (lambda ($x $y) (+ $x $y)) (2 4)))

!(test (applyL2) 6)


!(maplist (|-> ($a) (+ 1 $a)) (1 2 3)) ;; (2 3 4)
!(cons 1 ()) ;; (1)
!(cons-atom 1 ()) ;; (1)

!((|-> ($acc $e) (or (== 1 $e) $acc)) False 1) ;; True

(= (myfunc $a $b) (cons $a $b))

!(let $f (myfunc 42) ($f (43))) ;; (42 43)
!(let $f (myfunc 42) $f) ;; (partial myfunc (42))

!(let $f (myfunc 13)
    ((|-> ($x) ($f ($x 15 16))) 14)) ;; the same as (myfunc 13 (14 15 16)) -> (13 14 15 16)

!(let $partial ((|-> ($x $y) (14 $x $y)) 15) ($partial 16)) ;;  (14 15 16)
!(((|-> ($x $y) (14 $x $y)) 15) 16) ;;  (14 15 16)

(= (myfunc2 $mylambda) 
    ($mylambda 12 13))

!(let* (($k 14)
        ($lambda (|-> ($x $y) (11 $x $y $k))))
    (myfunc2 $lambda))
;; the above is same as one below
!((|-> ($x $y) (11 $x $y 14)) 12 13)
!(let $a (|-> ($x $y) (11 $x $y 14))
    (myfunc2 $a))



;; forall examples

(= (f) 1)
(= (f) 2)

(= (g 1) 1)
(= (f 2) 2)

(= (P $x) (< $x 2))

!(let $a (collapse (match &self (= (f) $x) $x)) 
    (let $b (map-atom $a $var (< $var 2)) (foldl and $b True)))
    

(= (AN $a $b) (and $a $b))
; !(let $a True  $a (foldall AN $a True))


(= (foldlf $op $acc $list)
    (let* ((($h $t) (decons-atom $list))
            ($carry ($op $h $acc)))
        (if (= $t ())
            $carry
            (foldlf $op $carry $t))))
; !(foldlf + 0 (1 2 3))
!(foldl + (1 2 3) 0 )
!((|-> ($expr) (map-atom $expr $el (> $el 2))) (1 2 3)) ;; (false false true)


!(foldl and (map-atom (1 5 3) $el (> $el 2)) True) ;; false
!(foldl and (map-atom (4 5 3) $el (> $el 2)) True) ;; true
;; how to turn that into a function 
;; the following implementation has issues because the variable used in predicate definition is unrecognizable as internal variable of the map-atom
; (= (forall-list $list $predicate)
;     (foldl and (map-atom $list $el $predicate) True))

; !(forall-list (1 2 3) (> $x 2))    

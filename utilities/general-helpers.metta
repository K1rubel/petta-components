;; a copy-cat of the if-decons-expr utility function in PeTTa
; (: if-decons-expr-custom (-> Expression Grounded Expression $a $b))
; (: if-decons-expr (-> Expression Variable Variable Atom Atom))
(= (if-decons-expr-custom $list $h $t $then $else)
      (if (or (== $list ()) (not (== (get-metatype $list) Expression)))
            $else
            (let* (
                  ($h (car-atom $list))
                  ($t (cdr-atom $list))
                  )
                  $then)))

!(if-decons-expr-custom (1 2 3) $h $t $h else)  
;; the above function appears to not work when the then part involes operations over $h
;; how to fix that?

!(if-decons-expr-custom (1 2 3) $h $t $h ())
;; the defintion below doesnt work in PeTTa -- this is a minimal metta implemented code  
; (= (if-decons-expr $atom $head $tail $then $else)
;   (function (eval (if-equal $atom ()
;     (return $else)
;     (chain (decons-atom $atom) $list
;       (if-unify $list ($head $tail) (return $then) (return $else)) )))))

; !(if-decons-expr (1 2 3) $h $t $h else)      

; !(import! &self ../metta-utilities/lib-he)
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

; !(if-decons-expr-custom (1 2 3) $h $t $h else)  
;; the above function appears to not work when the then part involes operations over $h
;; how to fix that?

; !(if-decons-expr-custom (1 2 3) $h $t $h ())
;; the defintion below doesnt work in PeTTa -- this is a minimal metta implemented code  
; (= (if-decons-expr $atom $head $tail $then $else)
;   (function (eval (if-equal $atom ()
;     (return $else)
;     (chain (decons-atom $atom) $list
;       (if-unify $list ($head $tail) (return $then) (return $else)) )))))

; !(if-decons-expr (1 2 3) $h $t $h else)  

;; appears that some of the conditional utilities are defined as metta function and need to be imported 
;; which appears to have been resolved with the import statement 🔝 
;; but the issue of non-reducability persists
(= (if-decons-expr $atom $head $tail $then $else)
    (if (= $atom ())
                $else
                (chain (decons-atom $atom) $list
                    (if (= $list ($head $tail))
                        $then
                        $else))))

; !(if-decons-expr (1 2 3) $h $t (+ 1 $h) else)   
;; the call to grounded function has issue with variable arguments like the above 
;; but works fine, although useless, for when the passed arguments are gounded themselves like                     
; !(if-decons-expr (1 2 3) $h $t (+ 1 2) else)   

; !(if-equal (1 2) () empty notEmpty)



;; create one to one correspondence between elements of two expression atoms
; (: oneToOne (-> Expression Expression Expression))
(= (zip $a $b)
    (let* ((($h1 $t1) (decons-atom $a))
            (($h2 $t2) (decons-atom $b))
            ($new-head (cons-atom $h1 ($h2)))
            )
            (if (= $t1 ())
                ($new-head)
                (let $rest (zip $t1 $t2)
                    (cons-atom $new-head $rest)))))

                    
!(import! &self ../metta-utilities/lib-he)
; (= (getSubtreePattern $p $t)
;     (if (or (== $t ()) (not (== (get-metatype $t) Expression)))
;         ()
;         (let* ((($head $tail) (decons-atom $t))
;                 ($_ (println! (hhhh $head tttt $tail))))
;             (if (= $p $head)
;                 (let* (($r (getSubtreePattern $p $tail))
;                         ($__ (println (resulttt $r)))) 
;                     (append $head ($r)))
;                 (getSubtreePattern $p $tail)))))

(= (getSubtreePattern $pat $tree $acc)
    (if (or (== $tree ()) (not (== (get-metatype $tree) Expression)))
        $acc
        (let* ((($h $t) (decons-atom $tree))
                ($_ (println! (headtail $h $t)))
                ($pat-copy $pat)
                ($asd (println! (pattern copy $pat-copy))))
            (unify $h $pat
                (let* (($carry (append $acc ($h)))
                        ($__ (println! (carrry $carry)))
                        ($____ (println! (quote (getSubtreePattern $pat-copy $t $carry)))))
                    (getSubtreePattern $pat-copy $t $carry))
                (getSubtreePattern $pat $t $acc)))))
                
;; problem identified in petta unification -- 
;; if I have a pattern (Sth $var1 $var2) and a unification step like 
            ; (unif (Sth $var1 $var2) (Sth 12 13)
            ;     ...
            ;     ...
            ;     )
; and if you have a recursive call to the pattern (Sth $var1 $var2) 
; you will no longer have this but instead the result of unification with the earlier matching patter (Sth 12 13)
; which means subsequent attempts to find a matching pattern wont work
; I tried to copy the original pattern to preserve it but this also doesnt work

!(getSubtreePattern (Hi $a $b) ((Hi C D) (Hi eq 45)) ())
; !(getSubtreePattern (Hi $a $b) ((Hi eq 45)) ((Hi C D)))
; !(decons-atom ((Hi C D) (Hi eq 45)))
; !(append ((Hi C D)) ((Hi eq 45)))
; !(let $a (1 2)
;     (if (or (== $a ()) (not (== (get-metatype $a) Expression)))
;         invalidExpression
;         (let ($h $t) (decons-atom $a) ($h $t))))
    
; !(append ((Hi C D)) ((Hi 34 54)))
; !(append () ((Hi C D)))
; !(= (Hi eq 45) (Hi $a $b))
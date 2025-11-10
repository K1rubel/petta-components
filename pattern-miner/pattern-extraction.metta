; !(import! &self ../metta-utilities/lib-he)
;; extract valuation set of a pattern P over a collection of data trees T
;; let's start with finding subtrees S in a data tree T that satify the pattern P

(= (getSubtreePattern $p $t)
    (if (or (== $t ()) (not (== (get-metatype $t) Expression)))
        ()
        (let* ((($head $tail) (decons-atom $t))
                ($_ (println! (hhhh $head tttt $tail))))
            (if (= $p $head)
                (let* (($r (getSubtreePattern $p $tail))
                        ($__ (println (resulttt $r)))) 
                    (append $head ($r)))
                (getSubtreePattern $p $tail)))))


; !(getSubtreePattern (Hi $a $b) (1 (Hi A B)))                
; !(getSubtreePattern (Hi $a $b) (1 (Hi A B) (Hi S A) (Hi C D) (Hi eq 45)))
!(getSubtreePattern (Hi $a $b) ((Hi C D) (Hi eq 45)))
; !(getSubtreePattern (Hi $a $b) ((Hi eq 45)))
; !(cons-atom (hi C D) ((Hi eq 45)))
; head (Hi C D)
; tail ((Hi eq 45))
; (getSubtreePattern (Hi $a $b) ((Hi eq 45)))

; head (Hi eq 45)
; tail ()

; !(getSubtreePattern (Hi $a $b) ((Hi eq 45)))
; !(let*
;         (($a (1 (Hi A B) (Hi S A) (Hi C D)))
;         (($h $t) (decons-atom $a))
;         (($h2 $t2) (decons-atom $t))) 


;         (sdasd $h $t $h2 $t2 sda)
;     )


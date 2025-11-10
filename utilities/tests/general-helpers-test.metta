!(import! &self ../../utilities/general-helpers)
!(import! &self ../../metta-utilities/lib-he)

; !(if-equal 1 2 yes no) ;; testing imports

;; testing out map-atom

; !(map-atom (1 2 3) $x (+ 1 $x))

!(test (zip (1) (2)) ((1 2)))
!(test (zip (1 2) (1 2)) ((1 1) (2 2)))
!(test (zip (1 2 3) (1 2 3)) ((1 1) (2 2) (3 3)))

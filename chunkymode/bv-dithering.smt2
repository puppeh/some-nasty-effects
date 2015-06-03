(set-option :pp.bv-literals false)

(declare-const pal (Array (_ BitVec 4) (_ BitVec 4)))
(declare-const pixels (Array Int (_ BitVec 8)))

(define-fun p0 ((x Int)) (_ BitVec 4)
  (concat ((_ extract 7 7) (select pixels x))
          ((_ extract 5 5) (select pixels x))
	  ((_ extract 3 3) (select pixels x))
	  ((_ extract 1 1) (select pixels x))))

(define-fun p1 ((x Int)) (_ BitVec 4)
  (concat ((_ extract 6 6) (select pixels x))
          ((_ extract 4 4) (select pixels x))
	  ((_ extract 2 2) (select pixels x))
	  ((_ extract 0 0) (select pixels x))))

(define-fun p2 ((x Int)) (_ BitVec 4)
  (concat ((_ extract 5 5) (select pixels x))
	  ((_ extract 3 3) (select pixels x))
	  ((_ extract 1 1) (select pixels x))
	  #b1))

(define-fun p3 ((x Int)) (_ BitVec 4)
  (concat ((_ extract 4 4) (select pixels x))
	  ((_ extract 2 2) (select pixels x))
	  ((_ extract 0 0) (select pixels x))
	  #b1))

;(define-fun pal_lookup ((x (_ BitVec 8))) (_ BitVec 8)
;  ((_ extract 7 0) (bvlshr pal (concat (_ bv0 120) (bvshl x #x03)))))

(define-fun pal_lookup ((x (_ BitVec 4))) (_ BitVec 4)
  (select pal x))
  
;  (+ (if (= ((_ extract 0 0) x) #b1) 1 0)
;                 (if (= ((_ extract 1 1) x) #b1) 2 0)
;		 (if (= ((_ extract 2 2) x) #b1) 4 0)
;		 (if (= ((_ extract 3 3) x) #b1) 8 0))))

(assert (= (pal_lookup (p0 0)) (_ bv0 4)))
(assert (= (pal_lookup (p1 0)) (_ bv0 4)))
(assert (= (pal_lookup (p2 0)) (_ bv0 4)))
(assert (= (pal_lookup (p3 0)) (_ bv0 4)))

(assert (= (pal_lookup (p0 1)) (_ bv0 4)))
(assert (= (pal_lookup (p1 1)) (_ bv1 4)))
(assert (= (pal_lookup (p2 1)) (_ bv0 4)))
(assert (= (pal_lookup (p3 1)) (_ bv1 4)))

(assert (= (pal_lookup (p0 2)) (_ bv1 4)))
(assert (= (pal_lookup (p1 2)) (_ bv1 4)))
(assert (= (pal_lookup (p2 2)) (_ bv1 4)))
(assert (= (pal_lookup (p3 2)) (_ bv1 4)))

(assert (= (pal_lookup (p0 3)) (_ bv1 4)))
(assert (= (pal_lookup (p1 3)) (_ bv3 4)))
(assert (= (pal_lookup (p2 3)) (_ bv1 4)))
(assert (= (pal_lookup (p3 3)) (_ bv3 4)))

(assert (= (pal_lookup (p0 4)) (_ bv3 4)))
(assert (= (pal_lookup (p1 4)) (_ bv3 4)))
(assert (= (pal_lookup (p2 4)) (_ bv3 4)))
(assert (= (pal_lookup (p3 4)) (_ bv3 4)))

(assert (= (pal_lookup (p0 5)) (_ bv2 4)))
(assert (= (pal_lookup (p1 5)) (_ bv3 4)))
(assert (= (pal_lookup (p2 5)) (_ bv2 4)))
(assert (= (pal_lookup (p3 5)) (_ bv3 4)))

(assert (= (pal_lookup (p0 6)) (_ bv2 4)))
(assert (= (pal_lookup (p1 6)) (_ bv2 4)))
(assert (= (pal_lookup (p2 6)) (_ bv2 4)))
(assert (= (pal_lookup (p3 6)) (_ bv2 4)))

(assert (= (pal_lookup (p0 7)) (_ bv6 4)))
(assert (= (pal_lookup (p1 7)) (_ bv2 4)))
(assert (= (pal_lookup (p2 7)) (_ bv6 4)))
(assert (= (pal_lookup (p3 7)) (_ bv2 4)))

(assert (= (pal_lookup (p0 8)) (_ bv6 4)))
(assert (= (pal_lookup (p1 8)) (_ bv6 4)))
(assert (= (pal_lookup (p2 8)) (_ bv6 4)))
(assert (= (pal_lookup (p3 8)) (_ bv6 4)))

(assert (= (pal_lookup (p0 9)) (_ bv6 4)))
(assert (= (pal_lookup (p1 9)) (_ bv6 4)))
(assert (= (pal_lookup (p2 9)) (_ bv6 4)))
(assert (= (pal_lookup (p3 9)) (_ bv4 4)))

(assert (= (pal_lookup (p0 10)) (_ bv6 4)))
(assert (= (pal_lookup (p1 10)) (_ bv4 4)))
(assert (= (pal_lookup (p2 10)) (_ bv6 4)))
(assert (= (pal_lookup (p3 10)) (_ bv4 4)))

(assert (= (pal_lookup (p0 11)) (_ bv6 4)))
(assert (= (pal_lookup (p1 11)) (_ bv4 4)))
(assert (= (pal_lookup (p2 11)) (_ bv5 4)))
(assert (= (pal_lookup (p3 11)) (_ bv4 4)))

(assert (or (and (= (pal_lookup (p0 12)) (_ bv5 4))
		 (= (pal_lookup (p1 12)) (_ bv4 4))
		 (= (pal_lookup (p2 12)) (_ bv1 4))
		 (= (pal_lookup (p3 12)) (_ bv4 4)))
	    (and (= (pal_lookup (p0 12)) (_ bv1 4))
		 (= (pal_lookup (p1 12)) (_ bv4 4))
		 (= (pal_lookup (p2 12)) (_ bv5 4))
		 (= (pal_lookup (p3 12)) (_ bv4 4)))))

(assert (= (pal_lookup (p0 13)) (_ bv4 4)))
(assert (= (pal_lookup (p1 13)) (_ bv4 4)))
(assert (= (pal_lookup (p2 13)) (_ bv4 4)))
(assert (= (pal_lookup (p3 13)) (_ bv4 4)))

(assert (= (pal_lookup (p0 14)) (_ bv4 4)))
(assert (= (pal_lookup (p1 14)) (_ bv0 4)))
(assert (= (pal_lookup (p2 14)) (_ bv4 4)))
(assert (= (pal_lookup (p3 14)) (_ bv0 4)))

(assert (= (pal_lookup (p0 15)) (_ bv0 4)))
(assert (= (pal_lookup (p1 15)) (_ bv0 4)))
(assert (= (pal_lookup (p2 15)) (_ bv0 4)))
(assert (= (pal_lookup (p3 15)) (_ bv0 4)))

(check-sat)
(get-model)

(echo "pal:")
(eval (pal_lookup #x0))
(eval (pal_lookup #x1))
(eval (pal_lookup #x2))
(eval (pal_lookup #x3))
(eval (pal_lookup #x4))
(eval (pal_lookup #x5))
(eval (pal_lookup #x6))
(eval (pal_lookup #x7))
(eval (pal_lookup #x8))
(eval (pal_lookup #x9))
(eval (pal_lookup #xa))
(eval (pal_lookup #xb))
(eval (pal_lookup #xc))
(eval (pal_lookup #xd))
(eval (pal_lookup #xe))
(eval (pal_lookup #xf))


(echo "colours:")
(eval (select pixels 0))
(eval (select pixels 1))
(eval (select pixels 2))
(eval (select pixels 3))
(eval (select pixels 4))
(eval (select pixels 5))
(eval (select pixels 6))
(eval (select pixels 7))
(eval (select pixels 8))
(eval (select pixels 9))
(eval (select pixels 10))
(eval (select pixels 11))
(eval (select pixels 12))
(eval (select pixels 13))
(eval (select pixels 14))
(eval (select pixels 15))

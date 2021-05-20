(set-logic HORN)
(set-info :source |
    Benchmark: C_VC
    Output by Princess (http://www.philipp.ruemmer.org/princess.shtml)
|)
(set-info :status unknown)
(declare-heap Heap Addr HeapObject
 defObj
 ((HeapObject 0) (parent 0) (child 0)) (
  (
   (O_Int (getInt Int))
   (O_Addr (getAddr Addr))
   (O_parent (getparent parent))
   (O_child (getchild child))
   (defObj)
  )
  (
   (parent (child1 Addr) (child2 Addr))
  )
  (
   (child (p Addr) (data Int))
  )
))
(declare-fun inv_main10 (Heap Addr Addr) Bool)
(declare-fun inv_main11 (Heap Addr Addr Addr) Bool)
(declare-fun inv_main2 (Heap) Bool)
(declare-fun inv_main4 (Heap Addr) Bool)
(declare-fun inv_main5 (Heap Addr Addr) Bool)
(declare-fun inv_main7 (Heap Addr) Bool)
(declare-fun inv_main8 (Heap Addr Addr) Bool)
(declare-fun inv_main9 (Heap Addr) Bool)
(assert (inv_main2 (as emptyHeap Heap)))
(assert (forall ((var0 Heap) (var1 Addr)) (or (not (inv_main9 var0 var1)) (inv_main10 var0 var1 (p (getchild (read var0 (child1 (getparent (read var0 var1))))))))))
(assert (forall ((var0 Heap) (var1 Heap) (var2 Addr)) (or (not (and (inv_main2 var0) (and (= var1 (newHeap (alloc var0 (O_parent (parent nullAddr nullAddr))))) (= var2 (newAddr (alloc var0 (O_parent (parent nullAddr nullAddr)))))))) (inv_main5 (newHeap (alloc var1 (O_child (child nullAddr 0)))) var2 (newAddr (alloc var1 (O_child (child nullAddr 0))))))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Heap) (var3 Addr)) (or (not (and (inv_main4 var2 var3) (and (= var0 (write var2 (child1 (getparent (read var2 var3))) (O_child (child var3 (data (getchild (read var2 (child1 (getparent (read var2 var3)))))))))) (= var1 var3)))) (inv_main8 (newHeap (alloc var0 (O_child (child nullAddr 0)))) var1 (newAddr (alloc var0 (O_child (child nullAddr 0))))))))
(assert (forall ((var0 Heap) (var1 Addr)) (or (not (inv_main7 var0 var1)) (inv_main9 (write var0 (child2 (getparent (read var0 var1))) (O_child (child var1 (data (getchild (read var0 (child2 (getparent (read var0 var1))))))))) var1))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr)) (or (not (inv_main10 var0 var1 var2)) (inv_main11 var0 var1 var2 (p (getchild (read var0 (child2 (getparent (read var0 var1))))))))))
(assert (forall ((var0 Addr) (var1 Heap) (var2 Addr)) (or (not (inv_main8 var1 var2 var0)) (inv_main7 (write var1 var2 (O_parent (parent (child1 (getparent (read var1 var2))) var0))) var2))))
(assert (forall ((var0 Addr) (var1 Heap) (var2 Addr)) (or (not (inv_main5 var1 var2 var0)) (inv_main4 (write var1 var2 (O_parent (parent var0 (child2 (getparent (read var1 var2)))))) var2))))
(assert (forall ((var0 Addr) (var1 Heap) (var2 Addr)) (not (and (inv_main5 var1 var2 var0) (not (is-O_parent (read var1 var2)))))))
(assert (forall ((var0 Heap) (var1 Addr)) (not (and (inv_main4 var0 var1) (not (is-O_parent (read var0 var1)))))))
(assert (forall ((var0 Heap) (var1 Addr)) (not (and (inv_main4 var0 var1) (not (is-O_child (read var0 (child1 (getparent (read var0 var1))))))))))
(assert (forall ((var0 Addr) (var1 Heap) (var2 Addr)) (not (and (inv_main8 var1 var2 var0) (not (is-O_parent (read var1 var2)))))))
(assert (forall ((var0 Heap) (var1 Addr)) (not (and (inv_main7 var0 var1) (not (is-O_parent (read var0 var1)))))))
(assert (forall ((var0 Heap) (var1 Addr)) (not (and (inv_main7 var0 var1) (not (is-O_child (read var0 (child2 (getparent (read var0 var1))))))))))
(assert (forall ((var0 Heap) (var1 Addr)) (not (and (inv_main9 var0 var1) (not (is-O_parent (read var0 var1)))))))
(assert (forall ((var0 Heap) (var1 Addr)) (not (and (inv_main9 var0 var1) (not (is-O_child (read var0 (child1 (getparent (read var0 var1))))))))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr)) (not (and (inv_main10 var0 var1 var2) (not (is-O_parent (read var0 var1)))))))
(assert (forall ((var0 Heap) (var1 Addr) (var2 Addr)) (not (and (inv_main10 var0 var1 var2) (not (is-O_child (read var0 (child2 (getparent (read var0 var1))))))))))
(assert (forall ((var0 Addr) (var1 Heap) (var2 Addr) (var3 Addr)) (not (and (inv_main11 var1 var2 var3 var0) (not (is-O_parent (read var1 var2)))))))
(assert (forall ((var0 Addr) (var1 Heap) (var2 Addr) (var3 Addr)) (not (and (inv_main11 var1 var2 var3 var0) (not (is-O_child (read var1 (child1 (getparent (read var1 var2))))))))))
(assert (forall ((var0 Addr) (var1 Heap) (var2 Addr) (var3 Addr)) (not (and (inv_main11 var1 var2 var3 var0) (not (= (p (getchild (read var1 (child1 (getparent (read var1 var2)))))) var2))))))
(check-sat)
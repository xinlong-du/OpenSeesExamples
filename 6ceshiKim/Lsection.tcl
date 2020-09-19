proc Lsection { secID matID a b t1 t2 nfa nfb nft1 nft2} {
	# ###################################################################
	# Wsection  $secID $matID $a $b $t1 $t2 $nfdw $nftw $nfbf $nftf
	# ###################################################################
	# create a standard L section given the nominal section properties
	# written: Xinlong Du
	# date: 02/19
	# modified: 04/5  (according to the new FiberSection#3D.cpp developed by Kim Rasmussen)
	# input parameters
	# secID - section ID number
	# matID - material ID number 
	# a = leg 1 length
	# b = leg 2 length
	# t1 = leg 1 thickness
	# t2 = leg 2 thickness
	# nfa = number of fibers along leg 1
	# nfb = number of fibers along leg 2
	# nft1 = number of fibers along leg 1 thickness, assume 1 here
	# nft2 = number of fibers along leg 2 thickness, assume 1 here
  	
	set y1 0
	set y2 $t1
	set y3 $b
  
	set z1 0
	set z2 $t2
	set z3 $a
    
    set wn 0
    set y0 -0.67275
    set z0 -1.41375

	section Fiber $secID {
	    fiber [expr $t1/2] [expr $t2/2] [expr $t1*$t2] $matID $wn $y0 $z0; #yLoc, zLoc, Area, materialID, sectorial coordinate, y_coord, and z_coord of shear centre
        fiber [expr $t1+($b-$t1)/($nfb-$nft1)/2] [expr $t2/2] [expr ($b-$t1)/($nfb-$nft1)*$t2] $matID $wn $y0 $z0; 
        for {set i 1} {$i<=[expr $nfb-2]} {incr i 1} {
            fiber [expr $t1+($b-$t1)/($nfb-$nft1)/2+$i*($b-$t1)/($nfb-$nft1)] [expr $t2/2] [expr ($b-$t1)/($nfb-$nft1)*$t2] $matID $wn $y0 $z0;
        }
        fiber [expr $t1/2] [expr $t2+($a-$t2)/($nfa-$nft2)/2] [expr $t1*($a-$t2)/($nfa-$nft2)] $matID $wn $y0 $z0;
        for {set i 1} {$i<=[expr $nfa-2]} {incr i 1} {
            fiber [expr $t1/2] [expr $t2+($a-$t2)/($nfa-$nft2)/2+$i*($a-$t2)/($nfa-$nft2)] [expr $t1*($a-$t2)/($nfa-$nft2)] $matID $wn $y0 $z0;
        }
	}
}

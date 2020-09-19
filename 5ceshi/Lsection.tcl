proc Lsection { secID matID a b t1 t2 nfa nfb nft1 nft2} {
	# ###################################################################
	# Wsection  $secID $matID $a $b $t1 $t2 $nfdw $nftw $nfbf $nftf
	# ###################################################################
	# create a standard L section given the nominal section properties
	# written: Xinlong Du
	# date: 02/19
	# modified: 02/19  (according to the new general modelbuilder)
	# input parameters
	# secID - section ID number
	# matID - material ID number 
	# a = leg 1 length
	# b = leg 2 length
	# t1 = leg 1 thickness
	# t2 = leg 2 thickness
	# nfa = number of fibers along leg 1
	# nfb = number of fibers along leg 2
	# nft1 = number of fibers along leg 1 thickness
	# nft2 = number of fibers along leg 2 thickness
  	
	set y1 0
	set y2 $t1
	set y3 $b
  
	set z1 0
	set z2 $t2
	set z3 $a

	set nfaa [expr $nfa-$nft2]
	set nfbb [expr $nfb-$nft1]
  
	section fiberSec  $secID  {
   		#                     nfIJ  nfJK    yI  zI    yJ  zJ    yK  zK    yL  zL
   		patch quadr  $matID  $nfaa $nft1   $y1 $z3   $y1 $z2   $y2 $z2   $y2 $z3
   		patch quadr  $matID  $nft2 $nft1   $y1 $z2   $y1 $z1   $y2 $z1   $y2 $z2
   		patch quadr  $matID  $nft2 $nfbb   $y2 $z2   $y2 $z1   $y3 $z1   $y3 $z2
	}
}

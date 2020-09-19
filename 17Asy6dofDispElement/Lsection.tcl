proc Lsection { secID matID a b t1 t2 nfa nfb nft1 nft2} {
	# ###################################################################
	# Wsection  $secID $matID $a $b $t1 $t2 $nfdw $nftw $nfbf $nftf
	# ###################################################################
	# create a standard L section given the nominal section properties
	# written: Xinlong Du
	# date: 02/19
	# modified: 06/25  (according to the new FiberSection#3D.cpp developed by Kim Rasmussen)
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
    source LibUnits.tcl;			# define units
    #set wn 0
    #set z0 [expr 0.6385*$in];
	#set y0 [expr -0.6741*$in];

	section Fiber $secID {
		fiber [expr -0.6741*$in] [expr 0.6385*$in] [expr $t1*$t2] $matID; #yLoc, zLoc, Area, materialID, sectorial coordinate, y_coord, and z_coord of shear centre
		fiber [expr -0.5740*$in] [expr 0.4094*$in] [expr $t1*$t2] $matID;
		fiber [expr -0.4739*$in] [expr 0.1803*$in] [expr $t1*$t2] $matID;
		fiber [expr -0.3738*$in] [expr -0.0487*$in] [expr $t1*$t2] $matID;
		fiber [expr -0.2736*$in] [expr -0.2778*$in] [expr $t1*$t2] $matID;
		fiber [expr -0.1735*$in] [expr -0.5069*$in] [expr $t1*$t2] $matID;
		fiber [expr -0.0734*$in] [expr -0.7360*$in] [expr $t1*$t2] $matID;
		fiber [expr 0.0267*$in] [expr -0.9651*$in] [expr $t1*$t2] $matID;
		fiber [expr 0.1268*$in] [expr -1.1941*$in] [expr $t1*$t2] $matID;
		fiber [expr 0.2269*$in] [expr -1.4232*$in] [expr $t1*$t2] $matID;
		fiber [expr 0.3270*$in] [expr -1.6523*$in] [expr $t1*$t2] $matID;
		fiber [expr 0.4271*$in] [expr -1.8814*$in] [expr $t1*$t2] $matID;
		fiber [expr -0.4450*$in] [expr 0.7386*$in] [expr $t1*$t2] $matID;
		fiber [expr -0.2159*$in] [expr 0.8387*$in] [expr $t1*$t2] $matID;
		fiber [expr 0.0132*$in] [expr 0.9388*$in] [expr $t1*$t2] $matID;
		fiber [expr 0.2422*$in] [expr 1.0389*$in] [expr $t1*$t2] $matID;
		fiber [expr 0.4713*$in] [expr 1.1390*$in] [expr $t1*$t2] $matID;
		fiber [expr 0.7004*$in] [expr 1.2392*$in] [expr $t1*$t2] $matID;
		fiber [expr 0.9295*$in] [expr 1.3393*$in] [expr $t1*$t2] $matID;
	}
}

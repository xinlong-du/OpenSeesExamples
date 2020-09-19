proc ISection {secID matID D B tf tw nfbf nfdw nft bfactor} {
# ###################################################################
#ISection $BeamSecTagFiber $IDsteel $D $B $tf $tw $nfbf $nfdw $nft $bfactor
# ###################################################################
# This Program creates the fiber section for thin-walled I-section and assign all relevant information required
# for fiber section
# WARNING: does not account for rounded corners, 
#          may not give accurate result for thick sections as no subdivision allowed through the thickness
#
# Written by: Rinchen  
# Date: 3 Oct 2015
# PhD student: University of Sydney, Sydney NSW, Australia
#
# Input parameters: 
# secID - section ID number 
# matID - material ID number 
# D = Nominal depth 
# B = Nominal width of flange 
# tf = Nominal thickness of flange
# tw = Nominal thickness of web
# nfbf = number of fibers along Top/Bottom flange 
# nfdw = number of fibers along web 
# nft = number of fibers through thickness (=1 as the section is thin)
# bfactor = factor to detrmine the location of web-flange joint (0<bfactor<1)
#--------------------------------------------------------------------------------------------
	source C:/Tcl/lib/tcllib1.17/math/math.tcl; #Address to folder where math function resides
	package require math::linearalgebra
	namespace eval compute {
	namespace import ::math::linearalgebra::*	
	}
	
#load dependent files	
	source sectionData.tcl
	source SectionPropertiesCalculator.tcl
	source Interpolation.tcl
#
#          3--------2--------1
#                   |            
#                   |            
#                   |            
#                   |            
#                   | 
#                   |            
#                   |            
#                   |             
#                   |            
#          4--------5--------6
#              
#        Cross-section of I-section
#
# Calculate section properties
#-------------------------------------------------------------
set data [plainISectionInfo $D $B $tf $tw $bfactor];#prepares data for calculation of section properties
set NodeCoord [lindex [lindex $data] 0]; #NodeInfo
set Segment [lindex [lindex $data] 1]; #SegmentInfo
set corwarpInfo [SectionProperties $NodeCoord $Segment];#Calculates section properties
#
#Extracts centroid, and shear centre 
set xc0 [lindex $corwarpInfo 0 6]; #x-coord from extreme bottom left
set yc0 [lindex $corwarpInfo 1 6]; #y-coord from extreme bottom left
set zo [lindex $corwarpInfo 2 6];  #x-coord of shear center w.r.t centroid of section
set yo [lindex $corwarpInfo 3 6];  #y-coord of shear center w.r.t centroid of section
set J  [lindex $corwarpInfo 4 6];  # Torsional constant J
set alpha [lindex $corwarpInfo 5 6]; #Orientation of principal axes

#Create matrix to store shear centre coordinates for transfer to main file
set shearCentre [math::linearalgebra::mkMatrix 3 1 0.0];
		math::linearalgebra::setrow shearCentre 0 $zo 0 0];
		math::linearalgebra::setrow shearCentre 1 $yo 0 0;
		math::linearalgebra::setrow shearCentre 2 $J 0 0;
#-----------------------------------------------------------------------------------------------------------------------
#Calculate x-coordinate centroid of section as xc0 based on centreline segment is not accurate enough for fiber section
#and fiber section is based on actual section having finite thickness
set webLoc [expr $B*$bfactor];
set Areatrue [expr 2*$B*$tf+($D-2*$tf)*$tw]; #Area of the section
set zbar [expr ($B*$tf*$B+($D-2.0*$tf)*$tw*$webLoc)/$Areatrue]; # x-coord from extreme left

#Create fiber cross-section information
set y1 [expr $D/2.0]; 
set y2 [expr $y1-$tf];
set z1 [expr -$zbar] ;
set z2 [expr $z1+$webLoc-$tw/2.0];
set z3 [expr $z2+$tw];
set z4 [expr $B-$zbar];
  
 #Calculate length of each fiber at each region:  flange and web
	set dbf [expr ($z4-$z1)/$nfbf]; #length of each fiber in flange
	set dwf [expr 2*$y2/$nfdw];#length of each fiber in web
	set NoOfFiber [expr $nfbf*2+$nfdw]; #Number of fibers
#---------------------------------------------------------------------------------   
#Assemble coordinate of centroid, area of each fiber
#----------------------------------------------------------------------------
#create matrix to store fiber information
set Fib [math::linearalgebra::mkMatrix $NoOfFiber 5 0];
 
for {set i 0} {$i<$nfbf} {incr i 1} {#Top flange
	set fibNo $i
	math::linearalgebra::setrow Fib $fibNo $fibNo 0 0;
	math::linearalgebra::setrow Fib $fibNo [expr $z4-($dbf/2.0*(2*$i+1))] 1 1;
	math::linearalgebra::setrow Fib $fibNo [expr ($y1+$y2)/2.0] 2 2;
	math::linearalgebra::setrow Fib $fibNo [expr $dbf*$tf] 3 3;
	}

for {set i 0} {$i<$nfdw} {incr i 1} {#Web
	set fibNo [expr $i+$nfbf]
	math::linearalgebra::setrow Fib $fibNo $fibNo 0 0;
	math::linearalgebra::setrow Fib $fibNo [expr ($z2+$z3)/2.0] 1 1;
	math::linearalgebra::setrow Fib $fibNo [expr $y2-($dwf/2.0*(2*$i+1))] 2 2;
	math::linearalgebra::setrow Fib $fibNo [expr $dwf*$tw] 3 3;
	}
 
 for {set i 0} {$i<$nfbf} {incr i 1} {#Bottom flange
	set fibNo [expr $i+$nfbf+$nfdw]
	math::linearalgebra::setrow Fib $fibNo $fibNo 0 0;
	math::linearalgebra::setrow Fib $fibNo [expr $z1+($dbf/2.0*(2*$i+1))] 1 1;
	math::linearalgebra::setrow Fib $fibNo [expr -($y1+$y2)/2.0] 2 2;
	math::linearalgebra::setrow Fib $fibNo [expr $dbf*$tf] 3 3;
	}
 #------------------------------------------------------------------------------
#fiber x,y
for {set i 0} {$i<$NoOfFiber} {incr i 1} {
	set fId($i) [math::linearalgebra::getelem $Fib $i 0];
	set f_z($i) [math::linearalgebra::getelem $Fib $i 1];
	set f_y($i) [math::linearalgebra::getelem $Fib $i 2];
	set f_A($i) [math::linearalgebra::getelem $Fib $i 3];
}

#Interpolate and assign sectorial coordinates to fiber
set secCoord [Interpolate $Fib $corwarpInfo];

for {set i 0} {$i<$NoOfFiber} {incr i 1} {
	set wn($i) [lindex $secCoord $i 1]
	#puts "$i    $wn($i)"
}
#Creates section fiber and transfers to main program 
section Fiber $secID { 
	for {set i 0} {$i<$NoOfFiber} {incr i 1} {
	fiber $f_y($i) $f_z($i) $f_A($i) $matID $wn($i) $yo $zo;#yLoc, zLoc, Area, materialID, sectorial coordinate, y_coord, and z_coord of shear centre
	}
	}
return $shearCentre	
}
	



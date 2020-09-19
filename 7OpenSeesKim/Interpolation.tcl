proc Interpolate {fiberCoordinate SegmentInfo} {
#This procedure determines the sectorial coordinate at the centroid of each fiber by linearly interpolating between the sectorial coordinates at
#the segment ends
#--------------------------------------------------------------------------
# Written by: Rinchen  
# Date: 12 Oct 2015
# PhD student: University of Sydney, Sydney NSW, Australia
#
# Input parameters:
# fiberCoordinate contains fiberID, x-,y-coordinates of fiber centroid, Area of fiber
# SegmentInfo contains x,y,w coordinates at ith and jth end of segment
#
#-------------------------------------------------------------------------------------
	
set NoOfFiber [llength $fiberCoordinate];
set NoOfElements [llength $SegmentInfo];

#Extract coordinates and warping information at the ends of the segment
for {set i 0} {$i<$NoOfElements} {incr i 1} {
	set j [expr $i+1]
	set xi0($j) [lindex $SegmentInfo $i 0]; 
	set yi0($j) [lindex $SegmentInfo $i 1];
	set w0i($j) [lindex $SegmentInfo $i 2];
	set xj0($j) [lindex $SegmentInfo $i 3];
	set yj0($j) [lindex $SegmentInfo $i 4];
	set w0j($j) [lindex $SegmentInfo $i 5];
}

#Extract x,y coordinates of fiber centroid
for {set i 0} {$i<$NoOfFiber} {incr i 1} {
	set fId($i) [math::linearalgebra::getelem $fiberCoordinate $i 0];
	set fx($i) [math::linearalgebra::getelem $fiberCoordinate $i 1];
	set fy($i) [math::linearalgebra::getelem $fiberCoordinate $i 2];
}

#Determines the sectorial coordinate at centroid of each fiber 

set esp 0.15; #set tolerance for numerical roundoff errors

for {set i 1} {$i<[expr $NoOfElements+1]} {incr i 1} {
	
	for {set j 0} {$j<$NoOfFiber} {incr j 1} {
		
	if {($fx($j)>=[expr $xi0($i)-$esp] && $fx($j)<=[expr $xj0($i)+$esp]) && ($fy($j)>=[expr $yi0($i)-$esp] && $fy($j)<=[expr $yj0($i)+$esp])} {
		set d sqrt(($fx($j)-$xi0($i))*($fx($j)-$xi0($i))+($fy($j)-$yi0($i))*($fy($j)-$yi0($i)))
		set dij sqrt(($xj0($i)-$xi0($i))*($xj0($i)-$xi0($i))+($yj0($i)-$yi0($i))*($yj0($i)-$yi0($i)))
		set w($j) [expr $w0i($i)+$d/$dij*($w0j($i)-$w0i($i))]
		}
		
	if {($fx($j)>=[expr $xi0($i)-$esp] && $fx($j)<=[expr $xj0($i)+$esp]) && ($fy($j)<=[expr $yi0($i)+$esp] && $fy($j)>=[expr $yj0($i)-$esp])} {
		set d sqrt(($fx($j)-$xi0($i))*($fx($j)-$xi0($i))+($fy($j)-$yi0($i))*($fy($j)-$yi0($i)))
		set dij sqrt(($xj0($i)-$xi0($i))*($xj0($i)-$xi0($i))+($yj0($i)-$yi0($i))*($yj0($i)-$yi0($i)))
		set w($j) [expr $w0i($i)+$d/$dij*($w0j($i)-$w0i($i))]
                }	
		
	if {($fx($j)<=[expr $xi0($i)+$esp] && $fx($j)>=[expr $xj0($i)-$esp]) && ($fy($j)>=[expr $yi0($i)-$esp] && $fy($j)<=[expr $yj0($i)+$esp])} {
		set d sqrt(($fx($j)-$xi0($i))*($fx($j)-$xi0($i))+($fy($j)-$yi0($i))*($fy($j)-$yi0($i)))
		set dij sqrt(($xj0($i)-$xi0($i))*($xj0($i)-$xi0($i))+($yj0($i)-$yi0($i))*($yj0($i)-$yi0($i)))
		set w($j) [expr $w0i($i)+$d/$dij*($w0j($i)-$w0i($i))]
		}
		
	if {($fx($j)<=[expr $xi0($i)+$esp] && $fx($j)>=[expr $xj0($i)-$esp]) && ($fy($j)<=[expr $yi0($i)+$esp] && $fy($j)>=[expr $yj0($i)-$esp])} {
		set d sqrt(($fx($j)-$xi0($i))*($fx($j)-$xi0($i))+($fy($j)-$yi0($i))*($fy($j)-$yi0($i)))
		set dij sqrt(($xj0($i)-$xi0($i))*($xj0($i)-$xi0($i))+($yj0($i)-$yi0($i))*($yj0($i)-$yi0($i)))
		set w($j) [expr $w0i($i)+$d/$dij*($w0j($i)-$w0i($i))]
		}	
	}
}

# Assemble sectorial coordinates corresponding to fiber number  
set fiberSectCoord [math::linearalgebra::mkMatrix $NoOfFiber 2 0];

for {set i 0} {$i<$NoOfFiber} {incr i 1} {
    math::linearalgebra::setrow fiberSectCoord $i $i 0 0;
    math::linearalgebra::setrow fiberSectCoord $i $w($i) 1 1;    
}
return $fiberSectCoord; #returns the sectorial coordinates 
}

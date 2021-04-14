section Fiber $ColSecTag $y0 $z0 -GJ $GJ {
	for {set i 1} {$i<9} {incr i 1} {
    	fiber [expr -75.0-18.75/2.0+18.75*$i] [expr -89.55+5.0] 187.5 $matID;
    }

    for {set i 1} {$i<16} {incr i 1} {
    	fiber 0.0 [expr -79.55-10.0+20.0*$i] 120.0 $matID;
    }
}
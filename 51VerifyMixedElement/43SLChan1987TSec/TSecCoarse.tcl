section Fiber $ColSecTag $y0 $z0 -GJ $GJ {
	for {set i 1} {$i<16} {incr i 1} {
    	fiber [expr -80.0+10.0*$i] [expr -89.55+5.0] 100.0 $matID;
    }

    for {set i 1} {$i<31} {incr i 1} {
    	fiber 0.0 [expr -79.55-5.0+10.0*$i] 60.0 $matID;
    }
}
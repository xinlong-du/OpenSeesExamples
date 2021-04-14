section Fiber $ColSecTag $y0 $z0 -GJ $GJ {
	for {set i 1} {$i<9} {incr i 1} {
    	fiber [expr 3.565+0.2175] [expr -4.5+$i] 0.435 $matID;
    }


    for {set i 1} {$i<9} {incr i 1} {
        fiber [expr -3.565-0.89125/2.0+0.89125*$i] 0.0 0.25400625 $matID;
    }


    for {set i 1} {$i<9} {incr i 1} {
        fiber [expr -3.565-0.2175] [expr -4.5+$i] 0.435 $matID;
    }
}
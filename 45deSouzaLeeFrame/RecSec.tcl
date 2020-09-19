section Fiber $ColSecTag $y0 $z0 -GJ $GJ {
	for {set i 1} {$i<21} {incr i 1} {
		for {set j 1} {$j<31} {incr j 1} {
			fiber [expr -10.5+1.0*$i] [expr -15.5+1.0*$j] 1.0 $matID;
		}
    }
}
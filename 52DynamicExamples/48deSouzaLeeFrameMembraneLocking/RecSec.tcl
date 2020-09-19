section Fiber $ColSecTag $y0 $z0 -GJ $GJ {
	for {set i 1} {$i<21} {incr i 1} {
		for {set j 1} {$j<31} {incr j 1} {
			fiber [expr -0.105+0.01*$i] [expr -0.155+0.01*$j] 1.0e-4 $matID;
		}
    }
}
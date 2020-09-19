section Fiber $ColSecTag $y0 $z0 -GJ $GJ {
	for {set i 1} {$i<26} {incr i 1} {
		for {set j 1} {$j<26} {incr j 1} {
			fiber [expr -0.130+0.01*$j] [expr -0.130+0.01*$i] 1.0e-4 $matID;
		}
    }
}
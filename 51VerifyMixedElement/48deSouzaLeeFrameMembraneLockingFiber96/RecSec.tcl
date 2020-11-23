section Fiber $ColSecTag $y0 $z0 -GJ $GJ {
	for {set i 1} {$i<9} {incr i 1} {
		for {set j 1} {$j<13} {incr j 1} {
			fiber [expr -10-1.25+2.5*$i] [expr -15-1.25+2.5*$j] 6.25 $matID;
		}
    }
}
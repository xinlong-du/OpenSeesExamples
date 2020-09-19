section Fiber $ColSecTag $y0 $z0 -GJ $GJ {
	for {set i 1} {$i<101} {incr i 1} {
    	fiber [expr -50.5+1.0*$i] [expr -28.60+1.5] 3.0 $matID;
    }

    for {set i 1} {$i<70} {incr i 1} {
    	fiber -49.5 [expr -28.60+3.0-0.5+1.0*$i] 3.0 $matID;
    	 fiber 49.5 [expr -28.60+3.0-0.5+1.0*$i] 3.0 $matID;
    }

    for {set i 1} {$i<34} {incr i 1} {
    	 fiber [expr -50-0.25+0.5*$i] [expr -28.60+75-1.5] 1.5 $matID;
    	fiber [expr 33.5-0.25+0.5*$i] [expr -28.60+75-1.5] 1.5 $matID;
    }

}
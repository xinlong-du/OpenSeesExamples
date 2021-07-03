section FiberAsym $ColSecTag $y0 $z0 -GJ $GJ {
	for {set i 1} {$i<7} {incr i 1} {
    	fiber [expr -8.65+1.3*$i] 0.0 0.52 $matID;
    }
    for {set i 1} {$i<7} {incr i 1} {
    	fiber [expr 8.65-1.3*$i] 0.0 0.52 $matID;
    }
    for {set i 1} {$i<7} {incr i 1} {
    	fiber 0.0 [expr -8.65+1.3*$i] 0.52 $matID;
    }
    for {set i 1} {$i<7} {incr i 1} {
    	fiber 0.0 [expr 8.65-1.3*$i] 0.52 $matID;
    }
    fiber 0.0 0.0 0.16 $matID;
}
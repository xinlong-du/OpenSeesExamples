section FiberAsym $ColSecTag $y0 $z0 -GJ $GJ {
	for {set i 1} {$i<5} {incr i 1} {
    	fiber 0.047368 [expr -0.1-0.0225/2.0+0.0225*$i] 4.5e-4 $matID;
    }
    for {set i 1} {$i<5} {incr i 1} {
    	fiber 0.047368 [expr 0.1+0.0225/2.0-0.0225*$i] 4.5e-4 $matID;
    }
    fiber 0.047368 0.0 4.0e-4 $matID;

    for {set i 1} {$i<10} {incr i 1} {
    	fiber [expr 0.037368+0.01-0.02*$i] 0.0 4.0e-4 $matID;
    }
}
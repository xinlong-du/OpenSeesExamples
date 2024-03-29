section Fiber $ColSecTag $y0 $z0 -GJ $GJ {
	for {set i 1} {$i<41} {incr i 1} {
    	fiber [expr 17.21/300.0-0.75/300.0] [expr -30.75/300.0+1.5/300.0*$i] 2.5e-5 $matID;
    }
    for {set i 1} {$i<41} {incr i 1} {
    	fiber [expr 17.21/300.0-2.25/300.0] [expr -30.75/300.0+1.5/300.0*$i] 2.5e-5 $matID;
    }
    for {set i 1} {$i<41} {incr i 1} {
    	fiber [expr 17.21/300.0-3.75/300.0] [expr -30.75/300.0+1.5/300.0*$i] 2.5e-5 $matID;
    }
    for {set i 1} {$i<41} {incr i 1} {
    	fiber [expr 17.21/300.0-5.25/300.0] [expr -30.75/300.0+1.5/300.0*$i] 2.5e-5 $matID;
    }


    for {set i 1} {$i<37} {incr i 1} {
    	fiber [expr 11.21/300.0+0.75/300.0-1.5/300.0*$i] [expr -2.25/300.0] 2.5e-5 $matID;
    }
    for {set i 1} {$i<37} {incr i 1} {
    	fiber [expr 11.21/300.0+0.75/300.0-1.5/300.0*$i] [expr -0.75/300.0] 2.5e-5 $matID;
    }
    for {set i 1} {$i<37} {incr i 1} {
    	fiber [expr 11.21/300.0+0.75/300.0-1.5/300.0*$i] [expr 0.75/300.0] 2.5e-5 $matID;
    }
    for {set i 1} {$i<37} {incr i 1} {
    	fiber [expr 11.21/300.0+0.75/300.0-1.5/300.0*$i] [expr 2.25/300.0] 2.5e-5 $matID;
    }

}
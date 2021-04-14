section Fiber $ColSecTag $y0 $z0 -GJ $GJ {
    for {set i 1} {$i<7} {incr i 1} {
    	fiber [expr -15.0-2.5+5.0*$i] -0.2625 0.375 $matID;
    }

    for {set i 1} {$i<7} {incr i 1} {
    	fiber [expr -15.0-2.5+5.0*$i] -0.1875 0.375 $matID;
    }

    for {set i 1} {$i<7} {incr i 1} {
    	fiber [expr -15.0-2.5+5.0*$i] -0.1125 0.375 $matID;
    }

    for {set i 1} {$i<7} {incr i 1} {
    	fiber [expr -15.0-2.5+5.0*$i] -0.0375 0.375 $matID;
    }

    for {set i 1} {$i<7} {incr i 1} {
    	fiber [expr -15.0-2.5+5.0*$i] 0.0375 0.375 $matID;
    }

    for {set i 1} {$i<7} {incr i 1} {
    	fiber [expr -15.0-2.5+5.0*$i] 0.1125 0.375 $matID;
    }

    for {set i 1} {$i<7} {incr i 1} {
    	fiber [expr -15.0-2.5+5.0*$i] 0.1875 0.375 $matID;
    }
    
     for {set i 1} {$i<7} {incr i 1} {
    	fiber [expr -15.0-2.5+5.0*$i] 0.2625 0.375 $matID;
    }
}
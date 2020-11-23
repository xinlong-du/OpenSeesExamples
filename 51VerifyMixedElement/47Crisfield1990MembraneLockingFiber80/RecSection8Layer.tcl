section Fiber $ColSecTag $y0 $z0 -GJ $GJ {
    for {set i 1} {$i<11} {incr i 1} {
    	fiber [expr -15.0-1.5+3.0*$i] -0.2625 0.225 $matID;
    }

    for {set i 1} {$i<11} {incr i 1} {
    	fiber [expr -15.0-1.5+3.0*$i] -0.1875 0.225 $matID;
    }

    for {set i 1} {$i<11} {incr i 1} {
    	fiber [expr -15.0-1.5+3.0*$i] -0.1125 0.225 $matID;
    }

    for {set i 1} {$i<11} {incr i 1} {
    	fiber [expr -15.0-1.5+3.0*$i] -0.0375 0.225 $matID;
    }

    for {set i 1} {$i<11} {incr i 1} {
    	fiber [expr -15.0-1.5+3.0*$i] 0.0375 0.225 $matID;
    }

    for {set i 1} {$i<11} {incr i 1} {
    	fiber [expr -15.0-1.5+3.0*$i] 0.1125 0.225 $matID;
    }

    for {set i 1} {$i<11} {incr i 1} {
    	fiber [expr -15.0-1.5+3.0*$i] 0.1875 0.225 $matID;
    }
    
     for {set i 1} {$i<11} {incr i 1} {
    	fiber [expr -15.0-1.5+3.0*$i] 0.2625 0.225 $matID;
    }
}
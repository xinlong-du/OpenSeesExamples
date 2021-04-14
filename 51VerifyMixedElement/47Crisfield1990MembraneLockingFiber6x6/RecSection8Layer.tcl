section Fiber $ColSecTag $y0 $z0 -GJ $GJ {
    for {set i 1} {$i<7} {incr i 1} {
    	fiber [expr -15.0-2.5+5.0*$i] -0.25 0.5 $matID;
    }

    for {set i 1} {$i<7} {incr i 1} {
    	fiber [expr -15.0-2.5+5.0*$i] -0.15 0.5 $matID;
    }

    for {set i 1} {$i<7} {incr i 1} {
    	fiber [expr -15.0-2.5+5.0*$i] -0.05 0.5 $matID;
    }

    for {set i 1} {$i<7} {incr i 1} {
    	fiber [expr -15.0-2.5+5.0*$i] 0.05 0.5 $matID;
    }

    for {set i 1} {$i<7} {incr i 1} {
    	fiber [expr -15.0-2.5+5.0*$i] 0.15 0.5 $matID;
    }
    
     for {set i 1} {$i<7} {incr i 1} {
    	fiber [expr -15.0-2.5+5.0*$i] 0.25 0.5 $matID;
    }
}
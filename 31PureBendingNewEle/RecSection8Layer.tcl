section Fiber $ColSecTag $y0 $z0 -GJ $GJ {
    for {set i 1} {$i<51} {incr i 1} {
    	fiber [expr -15.3+0.6*$i] -0.2625 0.045 $matID;
    }

    for {set i 1} {$i<51} {incr i 1} {
    	fiber [expr -15.3+0.6*$i] -0.1875 0.045 $matID;
    }

    for {set i 1} {$i<51} {incr i 1} {
    	fiber [expr -15.3+0.6*$i] -0.1125 0.045 $matID;
    }

    for {set i 1} {$i<51} {incr i 1} {
    	fiber [expr -15.3+0.6*$i] -0.0375 0.045 $matID;
    }

    for {set i 1} {$i<51} {incr i 1} {
    	fiber [expr -15.3+0.6*$i] 0.0375 0.045 $matID;
    }

    for {set i 1} {$i<51} {incr i 1} {
    	fiber [expr -15.3+0.6*$i] 0.1125 0.045 $matID;
    }

    for {set i 1} {$i<51} {incr i 1} {
    	fiber [expr -15.3+0.6*$i] 0.1875 0.045 $matID;
    }
    
     for {set i 1} {$i<51} {incr i 1} {
    	fiber [expr -15.3+0.6*$i] 0.2625 0.045 $matID;
    }
}
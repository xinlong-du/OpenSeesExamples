section Fiber $ColSecTag $y0 $z0 -GJ $GJ {
    for {set i 1} {$i<101} {incr i 1} {
    	fiber [expr -15.15+0.3*$i] -0.2625 0.0225 $matID;
    }
    for {set i 1} {$i<101} {incr i 1} {
    	fiber [expr -15.15+0.3*$i] -0.1875 0.0225 $matID;
    }
    for {set i 1} {$i<101} {incr i 1} {
    	fiber [expr -15.15+0.3*$i] -0.1125 0.0225 $matID;
    }
    for {set i 1} {$i<101} {incr i 1} {
    	fiber [expr -15.15+0.3*$i] -0.0375 0.0225 $matID;
    }
    for {set i 1} {$i<101} {incr i 1} {
    	fiber [expr -15.15+0.3*$i] 0.0375 0.0225 $matID;
    }
    for {set i 1} {$i<101} {incr i 1} {
    	fiber [expr -15.15+0.3*$i] 0.1125 0.0225 $matID;
    }
    for {set i 1} {$i<101} {incr i 1} {
    	fiber [expr -15.15+0.3*$i] 0.1875 0.0225 $matID;
    }
    for {set i 1} {$i<101} {incr i 1} {
    	fiber [expr -15.15+0.3*$i] 0.2625 0.0225 $matID;
    }
}
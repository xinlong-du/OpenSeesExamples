section Fiber $ColSecTag $y0 $z0 -GJ $GJ {
    for {set i 1} {$i<101} {incr i 1} {
    	fiber [expr -15.15+0.3*$i] -0.225 0.045 $matID;
    }
    for {set i 1} {$i<101} {incr i 1} {
    	fiber [expr -15.15+0.3*$i] -0.075 0.045 $matID;
    }
    for {set i 1} {$i<101} {incr i 1} {
    	fiber [expr -15.15+0.3*$i] 0.075 0.045 $matID;
    }
    for {set i 1} {$i<101} {incr i 1} {
    	fiber [expr -15.15+0.3*$i] 0.225 0.045 $matID;
    }
}
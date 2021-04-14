section Fiber $ColSecTag $y0 $z0 -GJ $GJ {
    for {set i 1} {$i<11} {incr i 1} {
    	fiber [expr -15.0-1.5+3.0*$i] -0.225 0.45 $matID;
    }
    for {set i 1} {$i<11} {incr i 1} {
    	fiber [expr -15.0-1.5+3.0*$i] -0.075 0.45 $matID;
    }
    for {set i 1} {$i<11} {incr i 1} {
    	fiber [expr -15.0-1.5+3.0*$i] 0.075 0.45 $matID;
    }
    for {set i 1} {$i<11} {incr i 1} {
    	fiber [expr -15.0-1.5+3.0*$i] 0.225 0.45 $matID;
    }
     
}
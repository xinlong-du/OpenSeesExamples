section Fiber $ColSecTag -GJ $GJ {
    for {set i 1} {$i<51} {incr i 1} {
    	fiber [expr -15.3+0.6*$i] -0.15 0.18 $matID;
    }
    for {set i 1} {$i<51} {incr i 1} {
    	fiber [expr -15.3+0.6*$i] 0.15 0.18 $matID;
    } 
}
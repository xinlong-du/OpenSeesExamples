section Fiber $ColSecTag $y0 $z0 -GJ $GJ {
    for {set i 1} {$i<41} {incr i 1} {
    	fiber [expr -5.125+0.25*$i] -0.375 0.0625 $matID;
    }
     for {set i 1} {$i<41} {incr i 1} {
    	fiber [expr -5.125+0.25*$i] -0.125 0.0625 $matID;
    }
     for {set i 1} {$i<41} {incr i 1} {
    	fiber [expr -5.125+0.25*$i] 0.125 0.0625 $matID;
    }
     for {set i 1} {$i<41} {incr i 1} {
    	fiber [expr -5.125+0.25*$i] 0.375 0.0625 $matID;
    }
}
section Fiber $ColSecTag $y0 $z0 -GJ $GJ {
    for {set i 1} {$i<41} {incr i 1} {
    	fiber [expr -102.5+5.0*$i] -3.75 12.5 $matID;
    }
     for {set i 1} {$i<41} {incr i 1} {
    	fiber [expr -102.5+5.0*$i] -1.25 12.5 $matID;
    }
     for {set i 1} {$i<41} {incr i 1} {
    	fiber [expr -102.5+5.0*$i] 1.25 12.5 $matID;
    }
     for {set i 1} {$i<41} {incr i 1} {
    	fiber [expr -102.5+5.0*$i] 3.75 12.5 $matID;
    }
}
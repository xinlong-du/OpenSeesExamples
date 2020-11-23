section Fiber $ColSecTag $y0 $z0 -GJ $GJ {
	for {set i 1} {$i<31} {incr i 1} {
    	fiber [expr -31.0+2.0*$i] [expr -17.21+0.75] 3.0 $matID;
    }
    for {set i 1} {$i<31} {incr i 1} {
    	fiber [expr -31.0+2.0*$i] [expr -17.21+2.25] 3.0 $matID;
    }
    for {set i 1} {$i<31} {incr i 1} {
    	fiber [expr -31.0+2.0*$i] [expr -17.21+3.75] 3.0 $matID;
    }
    for {set i 1} {$i<31} {incr i 1} {
    	fiber [expr -31.0+2.0*$i] [expr -17.21+5.25] 3.0 $matID;
    }

    for {set i 1} {$i<28} {incr i 1} {
    	fiber [expr -2.25] [expr -11.21-1.0+2.0*$i] 3.0 $matID;
    }
    for {set i 1} {$i<28} {incr i 1} {
    	fiber [expr -0.75] [expr -11.21-1.0+2.0*$i] 3.0 $matID;
    }
    for {set i 1} {$i<28} {incr i 1} {
    	fiber [expr 0.75] [expr -11.21-1.0+2.0*$i] 3.0 $matID;
    }
    for {set i 1} {$i<28} {incr i 1} {
    	fiber [expr 2.25] [expr -11.21-1.0+2.0*$i] 3.0 $matID;
    }
}
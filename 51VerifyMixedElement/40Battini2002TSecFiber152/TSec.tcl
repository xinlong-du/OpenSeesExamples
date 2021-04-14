section Fiber $ColSecTag $y0 $z0 -GJ $GJ {
	for {set i 1} {$i<21} {incr i 1} {
    	fiber [expr -31.5+3.0*$i] [expr -17.21+0.75] 4.5 $matID;
    }
    for {set i 1} {$i<21} {incr i 1} {
    	fiber [expr -31.5+3.0*$i] [expr -17.21+2.25] 4.5 $matID;
    }
    for {set i 1} {$i<21} {incr i 1} {
    	fiber [expr -31.5+3.0*$i] [expr -17.21+3.75] 4.5 $matID;
    }
    for {set i 1} {$i<21} {incr i 1} {
    	fiber [expr -31.5+3.0*$i] [expr -17.21+5.25] 4.5 $matID;
    }

    for {set i 1} {$i<19} {incr i 1} {
    	fiber [expr -2.25] [expr -11.21-1.5+3.0*$i] 4.5 $matID;
    }
    for {set i 1} {$i<19} {incr i 1} {
    	fiber [expr -0.75] [expr -11.21-1.5+3.0*$i] 4.5 $matID;
    }
    for {set i 1} {$i<19} {incr i 1} {
    	fiber [expr 0.75] [expr -11.21-1.5+3.0*$i] 4.5 $matID;
    }
    for {set i 1} {$i<19} {incr i 1} {
    	fiber [expr 2.25] [expr -11.21-1.5+3.0*$i] 4.5 $matID;
    }
}
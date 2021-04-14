section Fiber $ColSecTag $y0 $z0 -GJ $GJ {
	for {set i 1} {$i<41} {incr i 1} {
    	fiber [expr 3.565+0.10875/2.0] [expr -4.1+0.2*$i] 0.02175 $matID;
    }
    for {set i 1} {$i<41} {incr i 1} {
        fiber [expr 3.565+0.10875/2.0*3.0] [expr -4.1+0.2*$i] 0.02175 $matID;
    }
    for {set i 1} {$i<41} {incr i 1} {
        fiber [expr 3.565+0.10875/2.0*5.0] [expr -4.1+0.2*$i] 0.02175 $matID;
    }
    for {set i 1} {$i<41} {incr i 1} {
        fiber [expr 3.565+0.10875/2.0*7.0] [expr -4.1+0.2*$i] 0.02175 $matID;
    }


    for {set i 1} {$i<37} {incr i 1} {
        fiber [expr -3.565-0.099+0.198*$i] [expr -0.07125/2.0*3.0] 0.0141075 $matID;
    }
    for {set i 1} {$i<37} {incr i 1} {
        fiber [expr -3.565-0.099+0.198*$i] [expr -0.07125/2.0] 0.0141075 $matID;
    }
    for {set i 1} {$i<37} {incr i 1} {
        fiber [expr -3.565-0.099+0.198*$i] [expr 0.07125/2.0] 0.0141075 $matID;
    }
    for {set i 1} {$i<37} {incr i 1} {
        fiber [expr -3.565-0.099+0.198*$i] [expr 0.07125/2.0*3.0] 0.0141075 $matID;
    }


    for {set i 1} {$i<41} {incr i 1} {
        fiber [expr -3.565-0.10875/2.0] [expr -4.1+0.2*$i] 0.02175 $matID;
    }
    for {set i 1} {$i<41} {incr i 1} {
        fiber [expr -3.565-0.10875/2.0*3.0] [expr -4.1+0.2*$i] 0.02175 $matID;
    }
    for {set i 1} {$i<41} {incr i 1} {
        fiber [expr -3.565-0.10875/2.0*5.0] [expr -4.1+0.2*$i] 0.02175 $matID;
    }
    for {set i 1} {$i<41} {incr i 1} {
        fiber [expr -3.565-0.10875/2.0*7.0] [expr -4.1+0.2*$i] 0.02175 $matID;
    }
}
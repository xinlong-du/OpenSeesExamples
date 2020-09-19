section Fiber $ColSecTag $y0 $z0 -GJ $GJ {
	for {set i 1} {$i<161} {incr i 1} {
    	fiber [expr -8.05+0.1*$i] -0.15 0.01 $matID;
    }
    for {set i 1} {$i<161} {incr i 1} {
    	fiber [expr -8.05+0.1*$i] -0.05 0.01 $matID;
    }
    for {set i 1} {$i<161} {incr i 1} {
    	fiber [expr -8.05+0.1*$i] 0.05 0.01 $matID;
    }
    for {set i 1} {$i<161} {incr i 1} {
    	fiber [expr -8.05+0.1*$i] 0.15 0.01 $matID;
    }

    for {set i 1} {$i<79} {incr i 1} {
    	fiber -0.15 [expr -8.05+0.1*$i] 0.01 $matID;
    }
     for {set i 83} {$i<161} {incr i 1} {
    	fiber -0.15 [expr -8.05+0.1*$i] 0.01 $matID;
    }

    for {set i 1} {$i<79} {incr i 1} {
    	fiber -0.05 [expr -8.05+0.1*$i] 0.01 $matID;
    }
     for {set i 83} {$i<161} {incr i 1} {
    	fiber -0.05 [expr -8.05+0.1*$i] 0.01 $matID;
    }

    for {set i 1} {$i<79} {incr i 1} {
    	fiber 0.05 [expr -8.05+0.1*$i] 0.01 $matID;
    }
     for {set i 83} {$i<161} {incr i 1} {
    	fiber 0.05 [expr -8.05+0.1*$i] 0.01 $matID;
    }

    for {set i 1} {$i<79} {incr i 1} {
    	fiber 0.15 [expr -8.05+0.1*$i] 0.01 $matID;
    }
     for {set i 83} {$i<161} {incr i 1} {
    	fiber 0.15 [expr -8.05+0.1*$i] 0.01 $matID;
    }
}
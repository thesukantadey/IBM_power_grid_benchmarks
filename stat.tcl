global nodes shorts counter
set counter(r) 0
set counter(i) 0
set counter(v) 0
set counter(n) 0
set counter(s) 0

set nodes(G) G
set nodes(0) 0

set fname [lindex $argv 0]
set fid [open $fname r]
regsub -all "\n\\+" [string tolower [read $fid]] "" whole
regsub -all {[\(\)\=]} $whole " " whole
set lines [split $whole "\n"]
close $fid

foreach line $lines {
    set line [string trim $line]
    if {[string match "\\**" $line]} {
	continue
    }
    if {[string match "\\.*" $line]} {
	continue
    }
    while {[regsub -all "  " $line " " line]} { }

    set l [split $line]
    set a	[lindex $l 1]
    set nodes($a) 1
    set b	[lindex $l 2]
    set nodes($b) 1
    set val	[lindex $l 3]
    if {$val == 0.0} {
	incr counter(s)
    }
    case $line in {
	{r*} { incr counter(r) }
	{i*} { incr counter(i) }
	{v*} { incr counter(v) }
    }
}

foreach n [array names nodes]] {
    incr counter(n)
}
puts $fname
parray counter

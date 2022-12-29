set ns [new Simulator]
$ns at 1.0 stop
$ns at 1.0 "puts \"print xgraph\" ; $ns halt"
proc stop {} {
# we save the useful data in tdma and csma file, xgraph plot them in a graph
exec xgraph csma.txt tdma.txt -geometry 800x400 &
exit 0
}
#Call the finish procedure after 5 seconds of simulation time
$ns run

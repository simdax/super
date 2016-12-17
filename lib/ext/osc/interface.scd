
// OSC interface with python (for graph)
~pythonOSC="graph/sc/osc.scd".loadBr;

// TODO un peu sale ??
~pythonPID !? {("kill "++(~pythonPID+2)).unixCmdGetStdOut};
//~pythonPipe=Pipe("python graph/python/osc.py", "r");
~pythonPID="python graph/ext/python/pyqtgraph/osc.py".unixCmd;

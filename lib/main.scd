(

//clear all
s.latency_(0);
Window.closeAll;

//topEnvironment.clear;

// OSC interface with python (for graph)
~pythonOSC="graph/sc/osc.scd".loadBr;

// TODO un peu sale ??
~pythonPID !? {("kill "++(~pythonPID+2)).unixCmdGetStdOut};
//~pythonPipe=Pipe("python graph/python/osc.py", "r");
~pythonPID="python graph/python/osc.py".unixCmd;

~mels=[];
c=Condition();
fork{
	IO.menu(c).play(AppClock);
	s.bootSync(c);
}
)

(

// OSC interface with python (for graph)

~pythonOSC="graph/sc/osc.scd".loadBr;

// TODO un peu sale ??
"killall python".unixCmd;
"python graph/python/osc.py".unixCmd;

//clear all
s.latency_(0);
Window.closeAll;
topEnvironment.clear;

~mels=[];
c=Condition();
fork{
	IO.menu(c).play(AppClock);
	s.bootSync(c);
}
)

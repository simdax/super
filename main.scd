(

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

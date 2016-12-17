// =====================================================================
// SuperCollider Workspace
// =====================================================================


a=Slider2D().front
.action_{arg s;
	b.mtranspose=(7*s.x).round;
	b.stretch=s.y;
};
b=();
Pbind(\degree, [0,3,2,1,0].iter.repeat).trace.play(protoEvent:b)




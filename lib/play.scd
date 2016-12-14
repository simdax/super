(
var esp;
var f=IO.notes;
var pos=0;
var pQ=PriorityQueue();
var time=2;
var now=0;
var durs, notes;
var hook={ 
	var h=f.vue.bounds.height;
	var w=f.vue.bounds.width;

	durs=(f.pts.collect(_.x) / w) * time;
	notes=(h - f.pts.collect(_.y)) / h * f.dic.nb;
	// some lag impression ?
	durs - 0.1;
	// refresh priority queue
	pQ.clear;
	(durs+++notes).do { |x|
		if(x[0]>=now)
		{pQ.put(x[0], x[1])}
	};
	pQ.topPriority;
};
var fps=1/1000;
var routine=Task({
	var b= Ptime().iter;
	thisThread.exceptionHandler.postcs;
	thisThread.exceptionHandler_{"rien".postln};
	loop{
		if(
			(now=b.next);
			if(pQ.topPriority.notNil)
			{ b.next >= pQ.topPriority}
			{false}
		){
			(
				degree:pQ.pop, dur:0.1,
				//	instrument:~instrDic[0]
			).play;
		};
		defer{
			pos=pos+(f.vue.bounds.width*(fps/time));
			if(pos > 500){pos=0};
			f.vue.refresh;
			if(now > time)
			{
				b=Ptime().iter; now=0;
				try(hook,{Error("hook a bougé!").throw});
			}
		};
		fps.wait;
	}	
});
// petite barre
{var ff=f.vue.drawFunc; 
	ff=ff.addFunc{
		Pen.color=Color.black;
		Pen.moveTo(pos@0); Pen.lineTo(pos@400);
		Pen.stroke
	};
}.value;

Button(f.vue.parent).action_{
	if(esp.isPlaying.not){
		hook.value;
		// routine=routine
		// .originalStream
		// .exceptionHandler={"fdsfqs".postln; esp.stop};
		esp=Pprotect(routine.originalStream.asStream,
			{thisProcess.stop}).play
	}{
		esp.pause
	}
};

// garbage here
f.vue.parent.postln.onClose_{ esp.stop; esp.clear};


f.dic.chainDispatch(hook);
f.mels.do(_.chainDispatch(hook));

)
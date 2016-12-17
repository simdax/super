(

// PRIVATE
var esp;
var f=IO.notes;
var pos=0; var now=0; 
var pQ=PriorityQueue();
var self=currentEnvironment.know_(true);

var button;

var hook={ 
	var h=f.vue.bounds.height;
	var w=f.vue.bounds.width;
	var durs=(f.pts.collect(_.x) / w) * ~time;
	var notes=(h - f.pts.collect(_.y)) / h * f.dic.nb;
	// some lag impression ?
	//	durs - 0.1;
	// refresh priority queue
	pQ.clear;
	(durs+++notes).do { |x|
		if(x[0]>=now)
		{pQ.put(x[0], x[1])}
	};
	pQ.topPriority;
}.inEnvir(self);
var routine=Task({
	var b= Ptime().iter;
	// thisThread.exceptionHandler.postcs;
	// thisThread.exceptionHandler_{"rien".postln};
	loop{
		if(
			(now=b.next);
			if(pQ.topPriority.notNil)
			{ b.next >= pQ.topPriority}
			{false}
		){
			(self[\def].value(()) ++ (degree:pQ.pop, dur:0.1)).play;
		};
		defer{
			pos=pos+(f.vue.bounds.width*(self[\fps].reciprocal/self[\time]));
			if(pos > 500){pos=0};
			f.vue.refresh;
			if(now > self[\time])
			{
				b=Ptime().iter; now=0;
				try(hook,{Error("hook a bougué!").throw});
			}
		};
		self[\fps].reciprocal.wait;
	}	
});

f.dic.chainDispatch(hook);
f.mels.do(_.chainDispatch(hook));


// INTERFACE
~def=();  ~time=8; ~fps=1000;
~visible={ arg s, bool; f.vue.parent.parent.visible_(bool)};
~front={self.visible(true)};
~hide={self.visible(false)};
~play={arg a; button.doAction }.inEnvir(self);
~addVoice={arg s;
	self.spectrogramme.vue
	.parent.children[4].children[0].children[0]
	.doAction; s};
~close={esp.stop; f.vue.parent.parent.close};

//GUI adds
// petite barre
{var ff=f.vue.drawFunc; 
	ff=ff.addFunc{
		Pen.color=Color.black;
		Pen.moveTo(pos@0); Pen.lineTo(pos@400);
		Pen.stroke
	};
}.value;

// stop/play Button
button=Button(f.vue.parent).action_{
	if(esp.isPlaying.not){
		hook.value;
		esp=Pprotect(routine.originalStream.asStream,{thisProcess.stop}).play;
		self.changed(\play)
	}{
		esp.pause;
		self.changed(\pause)
	}
};

//close But
Button(f.vue.parent)
.states_([["close"]])
.action_({
	~hide.value
}.inEnvir(self));


// SAVE

f.vue.parent.parent.userCanClose_(false);
// save here
f.vue.parent.onClose_{
	Archive.at(\sup) ?? {Archive.put(\sup, ())};
	Archive.put(\sup, Archive.at(\sup).put(Date.getDate, "rien"));
	esp.stop; esp.clear
};


""

)
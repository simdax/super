{arg c;

	r{ 
	var b,e,f,w;

	b=300@300;
	e=(center:100, innerRadius:50, outerRadius:100, startAngle:2pi.rand, sweepLength:2pi.rand,
		res:{arg s; var copy=s.copy; copy.innerRadius=s.innerRadius.rand; copy;});
	w = Window(nil, 400@400).front.alwaysOnTop_(true);
	~view=UserView(w, w.bounds.extent);
	f=e.gui();
	f.parent.view.mouseUpAction_{~view.refresh};
	~view.background_(Color.white);
	~view.animate_(true).frameRate_(2).drawFunc = {
		1000.do{
			Pen.translate(100.rand2, 100.rand2);
			// set the Color
			Pen.color = Color.green(rrand(0.0, 1), rrand(0.0, 0.5));
			Pen.performWithEnvir(\addAnnularWedge, e.res);
			Pen.perform([\stroke, \fill].choose);
		}
	};
	~view.refresh;

	// wait for Boot;
	c.wait;
	~ww=FlowView(~view, Rect(150.rand,200.rand,180,400));
	~pbind=
	Pbind( \instrument, [\cheappiano, \marimba1].iter.repeat,
		\amp, [0.1, 1].iter.repeat,
		\degree,Pseq([0,2,4,7], inf), \dur,0.12).asStream;
	["melodie", "forme"].do{ arg x, i;
		StaticText(~ww, 180@50)
		.font_(Font("URW Bookman", 40))
		.value_(x)
		.mouseEnterAction_{arg s;
			s.stringColor_(Color.red);
			~pbind.next(()).play
		}
		.mouseLeaveAction_{arg s; 
			s.stringColor_(Color.black)
		}
		.mouseDownAction_{
			switch(i,
				0, {~mels=~mels.add(IO.play)},
				1, { ~pythonOSC.init2},
				{Error("je sais pas quel menu c'est ???").throw
				}
			)
		}
	}
	}
}
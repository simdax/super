(
var s=currentEnvironment;
var fL;
//s.boot;

a=().make{Graph.forme};
a.graphe[\createPlayer]=
{a.graphe.use{
	~rects.do{ arg x;
		fork({
			x.player=
			().make{IO.play}.addVoice;
			x.controller=SimpleController(x.player)
			.put(\play,{ x.playing=true})
			.put(\pause,{x.playing=false})
			;
			
			//x.player.def=(mtranspose:-10);
			// moui, mais une fois sur deux ça déconne donc bon...
			// 0.3.wait;
			// x.player.hide;
			//x.player.play;
		},AppClock)
	}
}
};

~plateau=().make{IO.plateau};
fL=a.window.drawFunc.array.insert(0,{Pen.use(~plateau[\drawFunc])});
a.window.drawFunc = FunctionList(fL);

a.window.addAction({ arg ss, x, y, mod, but, cl;
	var r=~rects.detect{arg xx; xx.area.contains(x@y)};
	if((cl>1)&&(r.notNil)&&(but==1)){
		r.player.front; 
	}
}.inEnvir(a.graphe), \mouseDownAction);

a.window.parent.onClose_(
	{ 
		~rects.do{arg x; x.player !? {x.player.close}}
	}.inEnvir(a.graphe)
)


)




(
var self=currentEnvironment;
var fL;

Window.closeAll;
s.boot;
s.latency_(0);

a=().make{Graph.forme};
a.graphe[\createPlayer]=
{a.graphe.use{
	~rects.do{ arg x;
		x.player=
		().make{IO.play}.addVoice;
		x.player.time=8;
		x.controller=
		SimpleController(x.player)
		.put(\play,{x.playing=true})
		.put(\pause,{x.playing=false})
		;
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




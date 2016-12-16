s.boot




(
var s=currentEnvironment;
a=().make{Graph.forme};

a.graphe.use{
	~rects.do{ arg x;
		x.player=().make{IO.play}.addVoice;
		x.player.def=(mtranspose:-10)//(rien:Pfunc{"io".postln}.asStream)
	}
};

a.window.addAction({ arg ss, x, y, mod, but, cl;
	var r=~rects.detect{arg xx; xx.area.contains(x@y)};
		if((cl>1)&&(r.notNil)&&(but==1)){
			r.put(\mel,().make{IO.play});
		}
	}.inEnvir(a.graphe), \mouseDownAction)
// .addAction(
// 	Pen.use(().make{IO.plateau}[\drawFunc]),
// 	\drawFunc)
// )
)

(
Pbind(
	
).play(pro)
//round?
)


a=().make{IO.play}



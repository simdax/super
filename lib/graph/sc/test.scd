s.boot

(
var s=currentEnvironment;
a=().make{Graph.forme};
a.window.addAction({ arg ss, x, y, mod, but, cl;
	var r=~rects.detect{arg x; x.area.contains(x@y)};
		if((cl>1)&&(r.notNil)&&(but==1)){
			r.put(\mel,().make{IO.play})
		}
	}.inEnvir(a.graphe), \mouseDownAction)
	// .addAction({
	// 	~rects.protoEvent=a.boules;
	// }.inEnvir(a.graphe),\drawFunc)
)

(
Pbind(
	
).play(pro)
//round?
)




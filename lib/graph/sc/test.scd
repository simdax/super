s.boot

(
var s=currentEnvironment;
b=();
topEnvironment.clear;
~players=();
a=().make{Graph.forme};
a.graphe.use{
	~window.addAction({ arg ss, x, y, mod, but, cl;
		var r=~rects.detectIndex( _.contains(x@y));
		if((cl>1)&&(r.notNil)&&(but==1)){
			s.at(\players).put(r.asSymbol,().make{IO.play})
		}
	}.inEnvir(a.graphe), \mouseDownAction)
	.addAction({
		b.root=a.boules;
	},\drawFunc)
}
)

(

//round?
)




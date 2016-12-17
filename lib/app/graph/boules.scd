(
var add;
var i,j;
var t;

~graphe={var res=().make{Graph.base};
	res.window.mouseMoveAction = res.window.mouseMoveAction.inEnvir(res);
	res.window.mouseUpAction = res.window.mouseUpAction.inEnvir(res);
	res.window.mouseDownAction = res.window.mouseDownAction.inEnvir(res);
	res.window.drawFunc = res.window.drawFunc.inEnvir(res);
	res
}.value;

// TODO trying to do beautiful, extract window and leave graph alone
//~graphe
~window=~graphe.window;
~vitesses=(tempo:1);
~vitesses.gui(4, ~window, ~window.bounds.leftTop @ (30@40)  );

i=[];  j=[]; 

t=currentEnvironment;

~graphe.use{
	~window.animate_(true);
	~window.drawFunc=~window.drawFunc.addFunc({
		if(~paths.size>0){
			~paths.do { |path, ind|
				t.use{
					~vitesses[ind.asSymbol]??{~vitesses[ind.asSymbol]=0.02};
				};
				~rects[ind].put(\vitesse, t[\vitesses][ind.asSymbol]);
				i[ind] ?? {i=i.add(0)}; // speed
				j[ind] ?? {j=j.add(0)}; // index
				Pen.use{
					var pos=~rects[path@|@(j[ind])].center;
					var grosseur=(10@10);
					var distance=
					(
						~rects[path@|@(j[ind]+1)].center -
						~rects[path@|@(j[ind])].center
					);
					~rects.collect(_.playing).select(_.notNil)
					.do { |pl| if(pl)
						{i[ind]=i[ind] + ~rects[ind].vitesse * t[\vitesses].tempo}};
					pos=pos + (distance*i[ind]);
					if(i[ind]>1){j[ind]=j[ind]+1; i[ind]=0};
					~rects[ind].pos=pos;

					Pen.color=Color.red;
					Pen.addOval(grosseur.asRect.center_(pos));
					Pen.fill;
				}
			}
		}
	}.inEnvir(~graphe)
	);
};

)


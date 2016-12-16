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
~vitesses=(tempo:1);
~vitesses.gui(4, ~graphe.window, ~graphe.window.bounds.leftTop @ (30@40)  );

i=[];  j=[];
t=currentEnvironment;

~graphe.use{
	~window.animate_(true);
	~window.drawFunc=~window.drawFunc.addFunc({
		if(~connecs.size>0){
			~connecs.do { |connec, ind|
				t.use{
					~vitesses[ind.asSymbol]??{~vitesses[ind.asSymbol]=0.02};
					~rects[ind].put(~vitesses[ind.asSymbol].copy);
				};
				i[ind] ?? {i=i.add(0)};
				j[ind] ?? {j=j.add(-1)};
				Pen.use{
					var grosseur=(10@10);
					var distance=
					(~rects[connec.value].area.center-~rects[connec.key].area.center)
					;
					var pointeur=
					if((i[ind]>1) or: (i[ind]<0)){j[ind]=j[ind].neg};
					var pos;
					t.use{
						i[ind]=i[ind] + (~vitesses[ind.asSymbol] * j[ind] * ~vitesses.tempo)
					};
					pos=(~rects[connec.key].area.center + (distance*i[ind]));
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


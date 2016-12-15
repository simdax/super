(
var add;
b={var res=().make{Graph.base};
	res.window.mouseMoveAction = res.window.mouseMoveAction.inEnvir(res);
	res.window.mouseUpAction = res.window.mouseUpAction.inEnvir(res);
	res.window.mouseDownAction = res.window.mouseDownAction.inEnvir(res);
	res.window.drawFunc = res.window.drawFunc.inEnvir(res);
	res
}.value;

add=(
tempo:1
); add.gui(4, b.window, b.window.bounds.leftTop @ (30@40)  );

i=[];  j=[];

b.use{
	~window.animate_(true);
	~window.drawFunc=~window.drawFunc.addFunc({
		if(~connecs.size>0){
			~connecs.do { |connec, ind|
				add[ind.asSymbol]??{add[ind.asSymbol]=0.02};
				i[ind] ?? {i=i.add(0)};
				j[ind] ?? {j=j.add(-1)};
				Pen.use{
					var grosseur=(10@10);
					var distance=
					(~rects[connec.value].center-~rects[connec.key].center)
					;
					var pointeur=
					if((i[ind]>1) or: (i[ind]<0)){j[ind]=j[ind].neg};
					i[ind]=i[ind] + (add[ind.asSymbol] * j[ind] * add.tempo);

					Pen.translate(*(distance.asArray * i[ind]));
					Pen.color=Color.red;
					Pen.addOval(
						grosseur.asRect.center_(~rects[connec.key].center)
					);
					Pen.fill;
				}
			}
		}
	}.inEnvir(b)
	);
}
)


a=(a:9); a.gui(3)
a[\9]=6
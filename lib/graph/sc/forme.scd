(

b={var res=().make{Graph.base};
	res.window.mouseMoveAction = res.window.mouseMoveAction.inEnvir(res);
	res.window.mouseUpAction = res.window.mouseUpAction.inEnvir(res);
	res.window.mouseDownAction = res.window.mouseDownAction.inEnvir(res);
	res.window.drawFunc = res.window.drawFunc.inEnvir(res);
	res
}.value;


i=0; j=(-1);

b.use{
	~window.animate_(true);
	~window.drawFunc=~window.drawFunc.addFunc({
		if(~lines.size>0){
			~lines.do { |ligne|
				Pen.use{
					var grosseur=(10@10);
					var distance=(ligne.value-ligne.key);
					Pen.translate(*(distance.asArray * (i/200)));
					Pen.color=Color.red;
					Pen.addOval(
						grosseur.asRect.center_(ligne.key)
					);
					Pen.fill;
					if((i==200) or: (i==0)){j=j.neg};
					i=i+j;
				}
			}
		}
	}.inEnvir(b)
	);

}

)



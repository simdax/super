(

//a=().make{IO.spectroPlusR};
var a=IO.spectroPlusR;
var w=TabbedView2(a.vue.parent, 250@180);
var z=[]; 
var melsDics;
var instrDic=[]; 
var size=(-1);
var lView;
var add={
	var bob=IO.mel;
	var inst=10.rand;
	var	i=w.add("io");
	var s=size+1;
	size=s;
	// gui
	i.addFlowLayout;
	bob.gui(7, i);
	EZPopUpMenu(i, label:"son",
		globalAction:{arg self; instrDic[s]=self.item}
	).items_(SynthDefPool.list)
	.value_(inst);
	// main gui refresh
	bob.chainDispatch{ arg res;
		z[s] !? { z[s]=res } ?? { z=z.add(res)};
		a.vue.refresh
	};
	bob.dispatch.value;
	lView.items_(lView.items.asArray++s);
	// adds
	instrDic=(instrDic.insert(s,SynthDefPool.list[inst]));
	melsDics=melsDics.add(bob);
};
var remove={ arg name,ind;
	w.removeAt(ind);
	// TODO grosse flemme
	instrDic[name]=nil; melsDics[name]=nil; z[name]=nil;
	lView.items_(lView.items.removing(name));
	a.vue.refresh
};
// GUI
w.view.background_(Color.rand);
a.vue.background_(Color.white);
FlowView(a.vue.parent, 50@180)
.background_(Color.rand)
.flow{arg w;
Button(w).action_(add);
lView=ListView(w, 30@100)
.mouseDownAction_{arg s, x, y, mod, cl;
	s.doAction;
	defer({cl.switch(1, {remove.(s.item,s.value)})}, 0.2)
};
};
// add refresh
a.vue.drawFunc=a.vue.drawFunc.addFunc({
	a.pts=nil;
	z.reject(_.isNil).do { |mel, ii| 
		var e=(pitch:a.lines[mel[0].wrap(0,a.lines.size-3)], dur:a.lines2[mel[1]]);
		var col=Color(*[0,0,0][ii%3]=1);
		var pitch,rythm;
		e.flop.do{ arg dd, i;
			var larg=8@8;
			var pt=	(dd.dur-(larg.x/2))@(dd.pitch-(larg.y/2));
			var rect=Rect(pt.x, pt.y, larg.x, larg.y);
			if(i>0){Pen.lineTo(rect.center)};
			Pen.color=col;
			Pen.stroke;
			Pen.fillRect(rect);
			a.pts=a.pts.add(rect.center);
			Pen.moveTo(rect.center);
		};
}
});
a.vue.refresh;

// return
a.put(\mels, melsDics);
a.put(\son, )
// debug
//~a=a ; ~z=z;
)


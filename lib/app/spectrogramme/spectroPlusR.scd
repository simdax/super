(
var niouDict;
var spectrogramme="spectrogramme.scd".loadRelative;
niouDict=ER({
	~nb2=30;
	~ss2=6; ~ur2=0;
},
	{ ~vue.refresh }.inEnvir(spectrogramme)
);

niouDict.gui(3,spectrogramme.vue.parent);
spectrogramme.vue.drawFunc = spectrogramme.vue.drawFunc.addFunc({
	var w=spectrogramme.vue.bounds.width;
	var h=spectrogramme.vue.bounds.width;
	Pen.strokeColor = Color.red;
	spectrogramme.lines2=(0, w/niouDict.nb2 .. w)
	.collect({arg x, i;
		x+(	niouDict.use{
			h/~nb2*
			((i+~ur2).div(~ss2))
		})
	});
	spectrogramme.lines2.do{ arg y;
		Pen.moveTo(y@0);
		Pen.lineTo(y@h); 
	};
	Pen.stroke;
});

// return of prog
~spectrogramme=spectrogramme
)
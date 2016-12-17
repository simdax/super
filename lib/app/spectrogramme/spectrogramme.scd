(

var h={(b.y/~nb)};
var a; 

var b=(500@300);
var w=FlowView(nil, 510@600)
//.onClose_{~esp.stop}
;
var z=UserView(w, b).background_(Color.rand);
var lines=(lines:[]);

w.parent.acceptsMouseOver_(true);

ControlSpec.specs.putAll(
	(
		nb:[0,60, 0,1], nb2:[0,40, 0,1],
		ss: [0, 10, 0,1], ss2: [0, 10, 0,1],
		ur: [0, 10, 0,1], ur2: [0, 10, 0,1],
	).collect(_.asSpec)
);

a=ER({
	~nb=30;
	~ss=6; ~ur=0;
},{z.refresh}
);
lines.put(\dic, a);
a.gui(3, w);

z.drawFunc = {
	//	set the Color

	Pen.strokeColor = Color.red;
	a.use{
		lines.lines=(b.y, b.y-h.value .. 0 )
		.collect({arg x, i; x-(h.value*((i+~ur).div(~ss)))})
	};
	lines.lines.do{ arg y;
		Pen.moveTo(0@y);
		Pen.lineTo(b.x@y); 
	};
	Pen.stroke;
};
z.refresh;
lines.put(\vue, z)
)
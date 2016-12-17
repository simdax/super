(
var self=currentEnvironment;

a=ER((
(	([\zoomX, \shearingY, \shearingX,
		\zoomY, \translateX, \translateY]
+++
 [1, 0, 0, 1, 10, 10]).flat.asDict
	++ 
	(size:200, x:10, y:10)).as(Event)
),
	{z.refresh})
;
a.gui();

z=UserView().front.drawFunc_({
	Pen.matrix=[~zoomX, ~shearingY, ~shearingX,
		~zoomY, ~translateX, ~translateY
	];
	(0, ~size/~x .. ~size).do { |pt|
		Pen.line(0@pt,~size@pt)
	};
	(0, ~size/~y .. ~size).do { |pt|
		Pen.line(pt@0,pt@~size)
	};
	Pen.stroke
}.inEnvir(a));


)


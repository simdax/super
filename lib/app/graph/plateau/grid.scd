(
var self=currentEnvironment;
var f;

~size=200;

a=ER((
	(	([\zoomX, \shearingY, \shearingX,
		\zoomY, \translateX, \translateY]
		+++
		[1,0,0, 1, 0, 0]).flat.asDict
		++ 
		(size:200, x:10, y:10,
			vraiZoom:1
		)
		
	).as(Event)
),
	{
		~zoomX=~vraiZoom;
		~zoomY=~vraiZoom;
		z.refresh
	},
	(
		[\zoomX,\zoomY]:[0.05,10,\exp,0.0001],
		[\shearingX,\shearingY]:[-2pi,2pi,\lin,0.0001],
		[\translateX,\translateY]:[-200,200,\lin,1],
	)

)
;
a.gui();

//shearing func
f={arg pt;
	pt+(pt*(~shearingX@~shearingY))
}.inEnvir(a);

z=UserView(nil, ~size@~size).front.drawFunc_({
	Pen.color=Color.red;
	(0, ~size/~x .. ~size).do { |pt|
		Pen.line(0@pt,~size@pt)
	};
	(0, ~size/~y .. ~size).do { |pt|
		Pen.line(pt@0,pt@~size)
	};
	Pen.stroke;
	Pen.color=Color.black;
	Pen.matrix=[
		~zoomX, ~shearingY, ~shearingX,
		~zoomY, ~translateX, ~translateY
	];
	(0, ~size/~x .. ~size).do { |pt|
		Pen.line(0@pt,~size@pt)
	};
	(0, ~size/~y .. ~size).do { |pt|
		Pen.line(pt@0,pt@~size)
	};
	Pen.stroke;
	"vrai pos : ".post;
	p=10@10;
	(
		g.(p)
		* (~zoomX@~zoomY) 
		+ (~translateX@~translateY)
	).postln
}.inEnvir(a)
);


)







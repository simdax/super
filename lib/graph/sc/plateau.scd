(
var self=currentEnvironment;

~plateau=200@200!4;
~plateau.collectInPlace{arg zone;
	zone.asRect.origin_(200.rand@200.rand)
};
~colors=Color.rand.alpha_(0.5) ! 4;
~specs=[\root, \mtranspose, \stretch, \scale];

~drawFunc={
	~plateau.do { |x,i|
		Pen.use{
			Pen.color_(~colors[i]);
			Pen.fillRect(x)
		}
	};
}.inEnvir(self);

""

)


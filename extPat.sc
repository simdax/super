TEST : APP2 {}

+ Pattern {

	!{ arg nb;
		^this.asStream.nextN(nb)
	}
}
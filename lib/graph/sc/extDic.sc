+ Dictionary {
	/*
	*/
	gui { arg  numItems, parent, bounds, options;
		var n = numItems ?? { max(12, this.size) } ;
		^EnvirGui(this, n, parent, bounds, options:options);
	}
}
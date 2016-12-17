{
ER(
	(
		patternH: {3.rand2},
		patternR: {4.xrand},
		seedR:1000.rand,
		seedH:1000.rand,
		firstR: 0,
		firstH: (..40).choose,
		nb: 8,
	), {arg patternH, patternR, firstR, firstH, nb;
		var c=( { [ ~patternH.value, ~patternR.value] } ! ~nb ) ;
		c={
			var r=Pseed(~seedR,Pfunc(~patternR)).fin(~nb).iter.all;
			var h=Pseed(~seedH,Pfunc(~patternH)).fin(~nb).iter.all;
			h +++ r 
		}.value;
		2.collect{arg i;
			[
				{c.slice(nil, i).integrate+~firstH},
				{c.slice(nil, i).drop(-1).addFirst(~firstR).integrate}
			][i].value
		};
	},
	(
		firstR:[0,10,0,1],
		firstH:[0,50,0,1],
		[\seedR, \seedH]:[0,1000,0,1],
		nb:[0,16,0,1]
	)
);
}







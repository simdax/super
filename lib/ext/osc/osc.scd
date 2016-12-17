(
OSCdef(\io, {
	"jksfs".postln
}, \filter);

~adr=["localhost",8000];
a=(
	forward:{ arg s, sel ... args;
		args.isEmpty.if{args=[[]]};
		NetAddr(*~adr).sendMsg("/"++sel, *args).postln
	},
);

)
// test
a.init2
a.testBourrin



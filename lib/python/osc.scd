(
OSCdef(\io, {
	"jksfs".postln
}, \filter);

~adr=["localhost",8000];
a=(
	forward:{ arg s, sel ... args;
		NetAddr(*~adr).sendMsg("/"++sel, *args)
	},
	test: {"salut maman"},
    init:{},
	init2:{}
)
.collect({|v,k|  
	{NetAddr(*~adr).sendMsg("/"++k, v.value)}
});

)


a.init2
a.testBourrin

NetAddr(*~adr).sendMsg("/testBourrin", 0)


(
OSCdef(\io, {
	"jksfs".postln
}, \filter);

~adr=["localhost",8000];
a=(test: {"salut maman"},
    init:{})
.collect({|v,k|  
	{NetAddr(*~adr).sendMsg("/"++k, v.value)}
});

)


a.init



{
arg line,move,ind,origin,mouseCoord,mouseButton;

var protoRect=
(
center:{arg s; s.area.center},
//center_:{arg s,val; s.area.center_(val)}
);


~window
.mouseMoveAction_{arg s, x, y;
    mouseCoord=x@y;
	(move && ind.notNil).if{
		~rects[ind].area=~rects[ind].area.center_(x@y);
	};
    ~window.refresh
}
.mouseUpAction_{arg s, x, y, mod, but, cl;
	// if 
	var sel=~rects.detectIndex({|rect| rect.area.contains(x@y) });
	(sel.notNil && line).if{
		// means create a connection with already existing rect
		~connecs=~connecs.add(ind -> sel);
	}{
        if(but==0) // means creates at fly
        {
			// rect will contain object with music
			~rects=~rects.add(
				protoRect.copy.area=(10@10).asRect.center_(x@y)
			);
			// adds automatic connection
            ~connecs=~connecs.add(ind -> (~rects.size-1));
			// and play
			~rects[ind].player.play;
			~rects[ind].playing=true;
        };
    };
	// sort paths
    ~paths=Graph.path.sot(*
		// dont sort auto-connections
		(~connecs.reject{arg as; as.key==as.value})
	);
	// dont draw line anymore
	line=false; move=false; ind=nil;
    ~window.refresh;
}
.mouseDownAction_{arg s, x, y, mod, bt;
	ind=~rects.detectIndex({|rect| rect.area.contains(x@y) });
	mouseButton=bt;
	if(bt==1){
		ind.notNil.if{
			move=true; 
		}
	}{
		ind.isNil.if
		{
            ~rects=~rects.add(protoRect.copy.area=(10@10).asRect.center_(x@y));
            ind=~rects.size-1;
			"player created".postln;
			// we create a player attached to the first node
			~createPlayer.value(ind);
		};
        line=true;
        mouseCoord=origin=~rects[ind].area.center;
	};
	~window.refresh
};
[line,move,ind,origin,mouseCoord,mouseButton]

}
(

var xxx, yyy;
// modes line-> drawing line, move -> moving rect
var line=false, move=false, ind;
// to help manipulation
var origin, mouseCoord, mouseButton;
~rects=[];
~connecs=[];
~paths=[];

Window.closeAll;
w=Window().front;
~window=UserView(w, w.bounds.extent);

~window
.mouseMoveAction_{arg s, x, y;
    mouseCoord=x@y;
	(move && ind.notNil).if{
		~rects[ind].area=~rects[ind].area.center_(x@y);
	};
    ~window.refresh
}
.mouseUpAction_{arg s, x, y, mod, but, cl; 
	var sel=~rects.detectIndex({|rect| rect.area.contains(x@y) });
	(sel.notNil && line).if{
		~connecs=~connecs.add(ind -> sel)
	}{
        if(but==0)
        {~rects=~rects.add(().area=(10@10).asRect.center_(x@y));
            ~connecs=~connecs.add(ind -> (~rects.size-1));
        };
    };
    ~paths=Graph.path.sot(*(~connecs.reject{arg as; as.key==as.value}));
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
            ~rects=~rects.add(().area=(10@10).asRect.center_(x@y));
            ind=~rects.size-1;
			~createPlayer.value;
		};
        line=true;
        mouseCoord=origin=~rects[ind].area.center;
	};
	~window.refresh
}; 
~window.drawFunc_{
	~rects.do{ arg obj;
		Pen.fillRect(obj.area);
	};
    //Pen.line(~rects[line.key].area.center,~rects[line.value].area.center);
	~paths.do{arg line;
        line.doAdjacentPairs{ arg a,b;
            Pen.line(~rects[a].area.center,~rects[b].area.center)
        };
	};
	if(line){
		Pen.line(origin,mouseCoord);
	};
    Pen.stroke
}
)
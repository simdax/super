(

var xxx, yyy;
// modes line-> drawing line, move -> moving rect
var line=false, move=false, ind;
// to help manipulation
var origin, mouseCoord, mouseButton;
~rects=[];
~connecs=[];


Window.closeAll;
w=Window().front;
~window=UserView(w, w.bounds.extent);

~window
.mouseMoveAction_{arg s, x, y;
    mouseCoord=x@y;
	(move && ind.notNil).if{
		~rects[ind]=~rects[ind].center_(x@y)
	};
    ~window.refresh}
.mouseUpAction_{arg s, x, y; 
	var sel=~rects.detectIndex({|rect| rect.contains(x@y) });
	(sel.notNil && line).if{
		~connecs=~connecs.add(ind -> sel)
	};
	line=false; move=false; ind=nil;
    ~window.refresh;
}
.mouseDownAction_{arg s, x, y, mod, bt;
	ind=~rects.detectIndex({|rect| rect.contains(x@y) });
	mouseButton=bt;
	if(bt==1){
		ind.notNil.if{
			move=true; 
		}
	}{
		ind.isNil.if
		{ 
            ~rects=~rects.add((10@10).asRect.center_(x@y));
		}{ line=true;
            mouseCoord=origin=~rects[ind].center;
        }
	};
	~window.refresh
}; 
~window.drawFunc_{
	//line.postln;
	~rects.do{ arg rect;
		Pen.fillRect(rect);
	};
	~connecs.do{arg line;
		Pen.line(~rects[line.key].center,~rects[line.value].center);
		Pen.stroke
	};
	if(line){
		Pen.line(origin,mouseCoord);
		Pen.stroke
	}
}
)
(
var self=currentEnvironment;

var xxx, yyy;
// modes line-> drawing line, move -> moving rect
var line=false, move=false, ind;
var origin, mouseCoord, mouseButton;


~rects=[];
~connecs=[];
~paths=[];

~distance={arg i,i2;
	~rects[i2].center - ~rects[i].center
};

Window.closeAll;
w=Window().front;
~window=UserView(w, w.bounds.extent);

//self.use(
Graph.mouseActions(line,move,ind,origin,mouseCoord,mouseButton)
//)
;

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
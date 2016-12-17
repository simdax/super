+ EnvirGui{
	// doesNotUnderstand{ arg selector;
	// 	^this.viewForParam(selector)
	// }
	keys{
		^this.paramViews.collect(_.label)
	}
	addAction{arg label,func;
		var v=this.viewForParam(label);
		var a=v.action;
		v.action=v.action.addFunc(func);
		^v
	}
}

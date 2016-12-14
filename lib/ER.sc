ER : EnvironmentRedirect{
	var <win, <>specs;
	*new{ arg f,d,specs,init=false;
		var res=super.new;
		f.class.switch(
			Function, {res.make(f)},
			Event, {res.envir=f},
			{Error("c'est quoi ctruc ? => "++f.class).throw}
		)
		.dispatch_({ arg k,v;
			var r=d.inEnvir(res.envir).value(k,v);
			().make(r).kvdo {arg k,v; this.localPut(k,v) };
			r.value
		}).know_(true);
		specs !? {res.specs=this.expEnv(specs,res)};
		if(init){res.dispatch.value};
		^res
	}
	// stream support
	asStream{
		^envir[\asStream].value(this) ??
		{"no 'asstream'".warn; this}
	}
	// modif
	addDispatch{ arg addF;
		dispatch=dispatch.addFunc(addF)
	}
	chainDispatch{ arg addF;
		dispatch=addF<>dispatch
	}
	// pr
	put { arg key, obj;
		var new=envir[key].isNil;
		if(win.notNil && new)
		{Error("impossible, can't add keys after GUI").throw}
		{^super.put(key,obj)}
	}
	gui{ arg numItems=envir.size,parent,bounds,options;
		var g=EnvirGui(envir,numItems,parent,bounds,options);
		specs !? {g.updateViewSpecs(specs.collect(_.asSpec).asPairs.clump(2))};
		envir.kvdo{arg k,v;
			g.addAction(k,{dispatch.value(k,v)})
		};
		win=g;
		// win.keys.collect(win.viewForParam(_))
		// .do { |x| x.action.postcs};
		^g
	}

}

+ ER {
	// put specs...
	*expEnv{ arg env, envir;
		^env.parent_((cot:{arg s; 
			s.kvdo({ arg k,v;
				if(k==\all){
					^envir.envir.copy.collect(v)
				};
				if(k.isArray){k.do { |key|
					s.put(key,v)
				};
					s.put(k, nil);
				};
				s
			})
		})
		).cot
	}
}

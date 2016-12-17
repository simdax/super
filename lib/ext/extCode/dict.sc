// adds a bunch of cool dictionary manipulation

+ Dictionary{
	kvdo{arg f; ^this.keysValuesDo(f)}

	// send a pack of other dictionary with values flopped
	flop{
		var k=this.keys.asArray;
		var vals=this.values.collect({|x,i| this.at(k[i]) });
		vals=vals.flop;
		^vals.collect( k+++_ ).collect(_.flatten).collect(_.as(this.species))
	}
	// complete a kind of "scripted dic"
	//-> ([\a,\b]:0, [\c, \d]:1).flopArgs ==> (a:0,b:0,c:1,d:1)
	flopArgs{
		var tmp=this.species.new;
		this.kvdo{ |k,v|
			k.asArray.do(tmp.put(_,v))
		};
		^tmp
	}
	complete{
		var size=this.values.collect(_.size).replace(0,1).maxItem;
		^this.collect({|x| size.collect(x.asArray @@ _) });
	}
	completeChange{
		this.putAll(this.complete)
	}
}


(
a:{ arg ... associations;
	var k=associations.postln.collect(_.key);
	k.sort.separate{arg a,b; (b-a) > 1}
},
b:{ arg ... as;
	var associations=as.copy;
	var i=0, j=1;
	while{associations[i+j].notNil}{
		if(associations[i+j].key==(associations[i].value)){
			associations.insert(i, associations[i+1]);
		};
		if(associations[i+j].value==(associations[i].key)){
			associations.insert(i, associations[i+1]); i=i+1;
		};
		j=j+1; if(associations[i+j].isNil){
			j=1; i=i+1;
		}
	};
	associations;
},
c:{ arg ... as;
	// TODO ==> hyper bourrin algo !!
	var f=(_.sort({arg a,b; a.value == b.key}));
	f.(f.(f.(as))); 
},
sot:{ arg s ... as;
	s[\c].value(*as).separate{ arg a,b;
		a.value != b.key
	}
	.collect{ arg x; x.postln.asDict.asPairs.postln}.postln
}
)
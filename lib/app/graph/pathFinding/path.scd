(
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
removeDup:{ arg s, arr;
	var c=[arr[0]];
	(arr.size-1).do { |i|
		if(arr[i+1]==arr[i]){
			
		}{c=c.add(arr[i+1])}
	};
	c
},
sot:{ arg s ... as;
	var res=s[\c].value(*as).separate{ arg a,b;
		a.value != b.key
	}
	//.postln
	.collect{ arg x; x.asDict.asPairs};
	res.collect(s.removeDup(_))
},
)

//Graph.path.removeDup([0,1,1,2])
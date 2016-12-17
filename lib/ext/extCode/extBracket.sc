+ String{

	findLastBrack{
		var a,b,z;
		a=this.findAll($(); b=this.findAll($));
		z=a.copy;// unnecessary?
		b.do({|c|
			var io=z.select(_<c).maxItem; 
			if(io==a.first)
			{^(a.first..c);}
			{z.remove(io)}
		});
		Error("que dalle, il est pourri ton algo mec!").throw
	}
	brackContent{ ^this[this.findLastBrack].join}
	loadBr{
		var e= try({File.open(PathName(this.resolveRelative).absolutePath,"r")}, {^Error("pas de fichier mec !").throw});
		^e.readAllString.brackContent.interpret;
	}
}
(
var aa=[0,0].plot;
var maxrand=20;
ER((list:Array.rand(10,0,maxrand), ambitus:10),{
	var a;
	//	~list=Array.rand(10,0,10);
	a=~wrapList=~list.wrap(*[0,~ambitus]);
	~sign=a.differentiate.sign;
	aa.setValue(~sign)
},(ambitus:[6,maxrand,0,1]),true).gui(4)
)
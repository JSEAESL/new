package Hit.unit
{
	import flash.utils.Dictionary;

	public class ResCase
	{
		public static var ins:ResCase = new ResCase();
		public var ResDic:Dictionary;
		public function ResCase()
		{
			ResDic = new Dictionary();
		}
		
		public function pushCase(key:String,res:*):void
		{
			ResDic[key] = res;
		}
		public function getCase(key:String):*
		{
			if(!ResDic[key]) return null;
			return ResDic[key];
		}
	}
}
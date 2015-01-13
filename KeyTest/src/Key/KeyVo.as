package Key
{

	public class KeyVo
	{
		private var Str:String;
		public var isCD:Boolean;
		private var cost:Number;
		private var func:Function
		private var level:Number
		public function KeyVo()
		{
		}
		
		public static function creatVo(str:String,cost:Number):KeyVo
		{
			var result:KeyVo = new KeyVo();
			result.Str = str;
			result.cost = cost;
			result.isCD = false;
			result.level = 1
			return result;
		}
		
		public function getName():String
		{
			return Str;
		}
		
		public function useKey():String
		{
			ChangeCD(true)
			return Str
		}
		
		public function getStr():String
		{
			return "NAME:" + Str + " isCD:" +isCD +" HeatCost:" +cost   ;
		}
		
		public function getNowCost():Number
		{
			return cost/level
		}
		
		public function cool():void
		{
			ChangeCD(false)
		}
		
		public function ChangeCD(boo:Boolean):void
		{
			isCD = boo;
			KeyView.ins.ChangeKeyDataText(this)
		}
	}
}
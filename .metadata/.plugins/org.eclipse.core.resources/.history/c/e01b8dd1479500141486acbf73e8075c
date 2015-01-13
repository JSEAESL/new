package Key
{
	public class JCallLater
	{
		private static var ins:JCallLater = new JCallLater();
		private var funList:Array;
		private var argList:Array;
		public function JCallLater()
		{
			funList = [];
			argList = [];
		}
		
		public static function add(fun:Function,...args):void
		{
			ins.add(fun,args)
		}
		
		private function add(fun:Function,...args):void
		{
			var index:Number = funList.indexOf(fun);
			if (index!= -1) return;
			var last:Number = funList.length; 
			funList[last] = fun;
			argList[last] = args;
			if(funList.length==1){
				invalidate();
			}
		}
		
		public function invalidate():void
		{
			JRenderManager.addToQueue(this);
		}
		
		public function render():void
		{
			var len:int=funList.length;
			var list:Array=funList.splice(0,len);
			var args:Array=argList.splice(0,len);
			
			for (var i:int=0;i<len;i++){
				list[i].apply(null,args[i]);
			}
			//JRenderManager.removeOutQueue(this);

		}
	}
}
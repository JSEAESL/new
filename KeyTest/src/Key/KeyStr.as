package Key
{

	public class KeyStr
	{
		public function KeyStr()
		{
		}
		
		public var KeyArr:Array;
		public function push(data:Array):void
		{
			var len:Number = data.length;
			KeyArr = [];
			var vo:KeyVo 
			for(var index:int = 0;index<len; index++ )
			{
				vo = KeyVo.creatVo(data[index],15);
				KeyArr.push( vo );
				KeyArr["_" + index] = vo
			}
		}
		
		public function getCanUseKey():KeyVo
		{
			var result:KeyVo
			var len:Number = KeyArr.length
			for(var index:int = 0 ;index<len; index++)
			{
				result = KeyArr[index]; 
				if(!result.isCD)
				{
					return result;
				}
			}
			return null;
		}
		
		public function cool():void
		{
			var len:Number = KeyArr.length;
			var vo:KeyVo 
			for(var index:int = 0;index<len; index++ )
			{
				KeyArr[index].cool();
			}
		}
	}
}
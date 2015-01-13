package Pools
{
	/**
	 * 类创建器,可延迟类的创建时间;
	 * 
	 */	
	public class ClassFactory 
	{
		/**
		 *  
		 * @param generator 将要延时初始化的类定义;
		 * 
		 */		
		public function ClassFactory(generator:Class = null)
		{
			super();
			
			this.generator = generator;
		}
		
		public var generator:Class;
		
		/**
		 * 类初始化时自动初始化的额外属性 ;
		 */		
		public var properties:Object = null;
		
		
		public function newInstance():*
		{
			var instance:Object = new generator();
			
			if (properties != null)
			{
				for (var p:String in properties)
				{
					instance[p] = properties[p];
				}
			}
			
			return instance;
		}
	}
	
}

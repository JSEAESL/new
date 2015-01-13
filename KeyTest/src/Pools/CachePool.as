package Pools
{
	import flash.utils.Dictionary;
	
	import Particle.IDestory;
	
	/**
	 * 缓存池
	 * @author crl
	 * 
	 */	
	public class CachePool 
	{
		/**
		 * 缓存列表; 
		 */		
		protected var cache:Array;
		
		/**
		 * 最大缓存数; 
		 */		
		private var cacheMax:int;
		
		
		/**
		 * 项生产工产抽像类 
		 */		
		private var factory:ClassFactory;
		
		/**
		 *  
		 * @param max 缓存最大数目
		 * 
		 */
		public function CachePool(factory:ClassFactory,max:int=10)
		{
			cache=new Array();
			cacheMax=max;
			this.factory=factory;
			PoolDic[factory.generator] = this;
		}
		
		public static var PoolDic:Dictionary = new Dictionary();
		
		/**
		 * 重设最大缓存数; 
		 * @param value
		 * 
		 */		
		public function resetCacheMax(value:int):void{
			cacheMax=value;
		}
		
		/**
		 * 取得当前设置的最大缓存数; 
		 * 
		 */		
		public function getCacheMax():int{
			return cacheMax;
		}
		
		/**
		 * 回收; 
		 * 
		 */		
		public function dispose():void{
			var i:int=cache.length-1;
			
			var item:IDestory
			for(;i>=0;i--){
				item=cache[i];
				cache.splice(i,1);
			}

			cache=null;
		}
		
		/**
		 * 取得当前缓存数量; 
		 * @return 
		 * 
		 */		
		public function get length():int{
			return cache.length;
		}
		
		/**
		 * 存入缓存池; 
		 * @param item
		 * @return 
		 * 
		 */		
		public function add(item:IDestory):Boolean{
			if(cache.length>=cacheMax){
				cache.push(item);
				return false;
			}
			cache.unshift(item);
			return true;
		} 
		
		/**
		 * 取得一个项; 
		 * @return 
		 * 
		 */		
		public function pop():*{
			var item:IDestory;
			if(length){
				item=cache.pop();
			}else{
				item=factory.newInstance();
			}
			
			return item;
		}
		
		/**
		 * 获得当前缓存的项列表(没有必要时,不提倡调用此方法);
		 * @return 
		 * 
		 */		
		public function getCacheList():Array{
			return cache;
		}
	}
}
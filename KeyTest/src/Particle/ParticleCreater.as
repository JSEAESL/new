package Particle
{
	import flash.display.BitmapData;
	
	import P___H.BaseNeedHit;
	
	import Pools.CachePool;
	import Pools.ClassFactory;
	

	public class ParticleCreater
	{
		public static var ins:ParticleCreater = new ParticleCreater();
		public static var _glowParticle_bds:Array
		
		public static var ParticleBD:BitmapData;
		public function ParticleCreater()
		{
			var Pool3:CachePool = new CachePool(new ClassFactory(BaseNeedHit),5000);
		}
		
		public function creatParticle():BaseParticle
		{
			var result:BaseParticle = new BaseParticle()
			
			return result;
		}
		
		public function creatBaseNeedHitByXY(x,y,bitData:BitmapData):BaseNeedHit
		{
			var result:BaseNeedHit = CachePool.PoolDic[BaseNeedHit].pop()
			result.setData(bitData)
			result.Base();

			
			

			
			return result;
		}
		

	}
}
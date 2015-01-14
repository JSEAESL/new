package Particle
{
	import P___H.PHView;

	public class ParticleManager
	{
		public static var ins:ParticleManager = new ParticleManager();
		public function ParticleManager()
		{
			init();
		}
		private var particList:Array;
		private function init():void
		{
			particList = [];
		}
		
		public function get Length():Number
		{
			return particList.length
		}
		
		public function live():void
		{
			for each(var i:IParticle in particList)
			{
				if(i.isLive)
				{
					i.Liveing();
				}else
				{
					var index:int = particList.indexOf(i);
					particList.splice(index,1);
					i.Destory();
				}
			}
		}
				
		public function addPartic(partic:IParticle):void
		{
			particList.push(partic)
		}
		
		
		
	}
}
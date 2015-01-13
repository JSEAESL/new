package P___H
{
	import com.greensock.plugins.VolumePlugin;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	
	import Hit.I.IHit;
	
	import Particle.BaseParticle;
	import Particle.IParticle;
	import Particle.ParticleCreater;
	
	public class BaseNeedHit extends Sprite implements IHit, IParticle
	{
		private var bitData:BitmapData
		private var bit:Bitmap;
		private var particleData:BaseParticle;
		public function BaseNeedHit()
		{
		}
		public function Base():void
		{
			if(!particleData) particleData = new BaseParticle();
			if(!bit && bitData ) 
			{
				bit  = new Bitmap(bitData);
				addChild(bit)
			}
			
		}
		
		public function setData(data:BitmapData):void
		{
			bitData = data;
		}
		
		public function getHit():*
		{
			return null;
		}
		
		public function Hit(...arg):Boolean
		{
			return false;
		}
		
		public function HitChange(otherHit:*):void
		{
		}
		
		public function getHitRect():Rectangle
		{
			return null;
		}
		
		

		
		public function Liveing():void
		{
			
		}
		
		public function get isLive():Boolean
		{
			return particleData.isLive;
		}
		
		public function Destory():void
		{
		}
	}
}
package Particle
{

	
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	
	import Hit.I.IHit;
	
	import P___H.INeedHit;
	
	import Pools.CachePool;

	public class ParticleBitmap  implements IParticle,INeedHit
	{
		private var Data:BaseParticle
		//private var bitmap:Bitmap;
		//private var finaBitData:BitmapData;
		public function ParticleBitmap()
		{
			
		}
		
		private function init():void
		{
			//finaBitData = new BitmapData(50,50,false,0x000000);
			//finaBitData.floodFill(0,0,0xff0000);
			//bitmap = new Bitmap(finaBitData);
		}
		
		public function Base():void
		{
			//if(!bitmap) init();
			//bitmap.x = Data.x;
			//bitmap.y = Data.y;
		}
		
	/*	public function getBitmap():Bitmap
		{
			if(!bitmap) init();
			return bitmap;
		}*/
		
		public function setData(data:BaseParticle):void
		{
			Data = data;
			Base()
		}
		
		 public function Liveing():void
		{
			if(!Data) return;

			Data.Liveing();
			//bitmap.x = Data.x;
			//bitmap.y = Data.y;
			//bitmap.rotation = Data.rotation
			//bitmap.alpha = Data.alpha
			
		}
		 
		 public  function get isLive():Boolean
		 {
			 if(!Data) return false;
			 return Data.isLive;
		 }

		 public function Destory():void
		 {
			 Data.Destory();
		 }
		 
		public function get m_x():Number
		{
			return Data.x;
		}
		
		public function get m_y():Number
		{
			return Data.y;
		}
		public function getBitData():BitmapData
		{
			return null
		}

		public function get Rect():Rectangle
		{
			return new Rectangle();
		}
	}
}
package Particle
{
	public class AParticle implements IParticle
	{

		public var x:Number;
		public var y:Number;
		public var alpha:Number;
		public var scaleX:Number;
		public var scaleY:Number;
		public var rotation:Number;
		public var speedX:Number;
		public var speedY:Number;
		public var accelerationX:Number;
		public var accelerationY:Number;
		public var color:uint;	
		public function AParticle()
		{
			Base()
		}
		
		public function Base():void
		{
			x = 0;
			y = 0;
			alpha = 1;
			scaleX = 1;
			scaleY = 1;
			rotation = 0;
			speedX = 0;
			speedY = 0;
			accelerationX = 0;
			accelerationY = 0;
		}
		
		public function Destory():void
		{
		}
		
		public function Liveing():void
		{
		}
		
		public function get isLive():Boolean
		{
			return false
		}
	}
}
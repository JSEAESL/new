package Hit
{
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	import Hit.I.IHit;

	public class BaseHit extends Sprite implements IHit
	{
		public var m_shin:Sprite;
		public var bitData:BitmapData;
		public function BaseHit(skin:Sprite)
		{
			m_shin = skin
			bitData = new BitmapData(400,400,true,0x00000000);
			bitData.draw(m_shin);
			addChild(skin)
		}
		
		public function getHit():*
		{
			return null;
		}
		
		public function HitChange(otherHit:*):void
		{
			trace("Hit    " + otherHit)
		}
		
		public function Hit(...arg):Boolean
		{
			return  bitData.hitTest(arg[0],arg[1],arg[2],arg[3])
		}
		
		public function getHitRect():Rectangle
		{
			if(! bitData) return new Rectangle();
			var rect:Rectangle = bitData.rect;
			rect.x = this.x
			rect.y = this.y
			return rect;
		}
	}
}
package P___H
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	
	import Hit.I.IHit;
	
	public class BaseBitmapHit extends Sprite implements IHit
	{
		private var _BitmapData:BitmapData;
		private var _Bitmap:Bitmap;
		public function BaseBitmapHit(bitmapData:BitmapData)
		{
			_BitmapData = bitmapData
			_Bitmap = new Bitmap(_BitmapData)
			addChild(_Bitmap);
		}
		
		public function getHit():*
		{
			return null;
		}
		
		public function Hit(...arg):Boolean
		{
			return  _BitmapData.hitTest(arg[0],arg[1],arg[2],arg[3])
		}
		
		public function HitChange(otherHit:*):void
		{
			trace("  Hit  ")
		}
		
		public function getHitRect():Rectangle
		{
			var t:Rectangle = this.getBounds(this)
				t.x = this.x;
				t.y = this.y;
			return t;
		}
	}
}
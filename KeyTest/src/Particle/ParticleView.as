package Particle
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	

	public class ParticleView extends Sprite
	{
		public static var ins:ParticleView = new ParticleView();
		private var ViewBitmap:BitmapData;
		private var ViewBit:Bitmap;
		private var ViewMainRect:Rectangle;
		
		private var _glow_bd:BitmapData;
		private var _fireworks_bd:BitmapData;

		private var _0pt:Point
		public function ParticleView()
		{
			//init()
			//addEventListener(Event.ENTER_FRAME,onEnter);
		}
		private function init():void
		{
			ViewBitmap = new BitmapData(KeyTest.T_W,KeyTest.T_H,false,0x000000)
			_fireworks_bd = new BitmapData(KeyTest.T_W, KeyTest.T_H, false, 0x000000);
			_glow_bd = new BitmapData(KeyTest.T_W, KeyTest.T_H, true, 0x00000000);
			
			ViewBit = new Bitmap(ViewBitmap);
			
			ViewMainRect = new Rectangle(0, 0, KeyTest.T_W, KeyTest.T_H);
			_0pt = new Point();
			
			ParticleCreater.ins.setBG(ViewBitmap,_glow_bd)
			addChild(ViewBit);
			
			//var state:Stats = new Stats()
			//addChild(state);
		}
		public function setDown(e:MouseEvent):void
		{
			for(var count:Number = 0; count<5000; count++)
			{
				var Data:BaseParticle = ParticleCreater.ins.creatBaseParticleByXY(e.localX,e.localY,_glow_bd,ViewMainRect)
				ParticleManager.ins.addPartic(Data)				
			}
		}
		
		private function onEnter(e:Event):void
		{
			ViewBitmap.lock()
			_glow_bd.fillRect(_glow_bd.rect,0xff000000);
			ParticleManager.ins.live();
			ViewBitmap.copyPixels(_glow_bd, ViewMainRect, _0pt);
			ViewBitmap.unlock();
		}
	}
}
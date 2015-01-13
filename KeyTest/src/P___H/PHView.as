package P___H
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import Hit.HitRect;
	
	import Key.KeyStage;
	
	import Particle.BaseParticle;
	import Particle.ParticleCreater;
	import Particle.ParticleManager;

	public class PHView extends Sprite
	{
		public static var ins:PHView = new PHView()
			
		private var ViewBitmap:BitmapData;
		private var ViewBit:Bitmap;
		private var ViewMainRect:Rectangle;
		
		private var bitbd:BitmapData;
		
		private var _0pt:Point
		
		public function PHView()
		{
			ParticleInit();
			init();
			
			addEventListener(Event.ENTER_FRAME,onEnter);

		}
		
		private function ParticleInit():void
		{
			ViewBitmap = new BitmapData(KeyTest.T_W,KeyTest.T_H,false,0x000000)
			bitbd = new BitmapData(KeyTest.T_W, KeyTest.T_H, true, 0x000000);
			
			ViewBit = new Bitmap(ViewBitmap);
			
			ViewMainRect = new Rectangle(0, 0, KeyTest.T_W, KeyTest.T_H);
			_0pt = new Point();
			
			ParticleCreater.ins.setBG(ViewBitmap,bitbd)
			addChild(ViewBit);
		}
		
		public  var mHitRect:HitRect;
		private function init():void
		{
			var hit:BaseBitmapHit = new BaseBitmapHit(new Pmc());
			KeyStage.ins.setEasyDraw(hit);
			addChild(hit);
			mHitRect = new HitRect();
			mHitRect.setDimHit(hit);
			addChild(mHitRect);
			//Hitr.addHit(BaseHit1)
		}
		
		
		private function onEnter(e:Event):void
		{
			if(ParticleManager.ins.Length == 0)
			{
				for(var count:Number = 0; count<1; count++)
				{
					var Data:BaseParticle = ParticleCreater.ins.creatBaseParticleByXY(0,0,null,ViewMainRect)
					ParticleManager.ins.addPartic(Data)				
				}
			}

			
			ViewBitmap.lock()
			bitbd.fillRect(bitbd.rect,0xff000000);
			ParticleManager.ins.live();
			ViewBitmap.copyPixels(bitbd, ViewMainRect, _0pt);
			mHitRect.updata(e);
			ViewBitmap.unlock();
		}
	}
}
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
			

		
		private var _0pt:Point
		
		public function PHView()
		{
			ParticleInit();
			init();
			
			addEventListener(Event.ENTER_FRAME,onEnter);

		}
		
		private function ParticleInit():void
		{

			
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
					
				}
			}

			
			ParticleManager.ins.live();
			mHitRect.updata(e);
		}
	}
}
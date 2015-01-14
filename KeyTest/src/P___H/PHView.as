package P___H
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.TimerEvent;
	import flash.geom.Point;
	import flash.utils.Timer;
	
	import Hit.HitRect;
	
	import Key.KeyStage;
	
	import Particle.ParticleCreater;
	import Particle.ParticleManager;

	public class PHView extends Sprite
	{
		public static var ins:PHView = new PHView()
			

		
		
		private var time:Timer;
		public function PHView()
		{
			init();
			
			addEventListener(Event.ENTER_FRAME,onEnter);
			//time = new Timer(1000);
			//time.addEventListener(TimerEvent.TIMER,onTime);
			//time.start();
		}
		
		private function onTime(e:TimerEvent):void
		{
			if(ParticleManager.ins.Length == 0)
			{
				for(var count:Number = 0; count<1; count++)
				{
					var Data:BaseNeedHit = ParticleCreater.ins.creatBaseNeedHitByXY(0,0,new DDmc())
					KeyStage.ins.setEasyDraw(Data);
					ParticleManager.ins.addPartic(Data)
					addChild(Data);
				}
			}
			
			
			ParticleManager.ins.live();
			mHitRect.updata(e);
			
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
				for(var count:Number = 0; count<5000; count++)
				{
					var Data:BaseNeedHit = ParticleCreater.ins.creatBaseNeedHitByXY(0,0,new DDmc())
					KeyStage.ins.setEasyDraw(Data);
					ParticleManager.ins.addPartic(Data)
					addChild(Data);
				}
			}

			
			ParticleManager.ins.live();
			mHitRect.updata(e);
		}
	}
}
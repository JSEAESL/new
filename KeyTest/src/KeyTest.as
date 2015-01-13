package
{
	import flash.display.Sprite;
	import flash.events.Event;
	
	import Hit.View.HitView;
	
	import Key.KeyStage;
	
	import P___H.PHView;
	
	import Particle.ParticleView;
	
	
	[SWF(backgroundColor="#000000", width="1024", height="840", frameRate="30")]
	public class KeyTest extends Sprite
	{
		public static const T_W:Number = 1024;
		public static const T_H:Number = 840;
		
		public function KeyTest()
		{
			if(stage) 
				init();
			else 
				addEventListener(Event.ADDED_TO_STAGE,init);
		}
		
		private function init():void
		{
			removeEventListener(Event.ADDED_TO_STAGE,init);
			KeyStage.ins.setStage(this.stage);
			
			//KeyStage.ins.addtoStage(KeyView.ins);
			//KeyStage.ins.addtoStage(HitView.ins);
			//KeyStage.ins.addtoStage(ParticleView.ins);
			KeyStage.ins.addtoStage(PHView.ins);
			
		}
	}
}
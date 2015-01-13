package Key
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	public class JTimeManager
	{
		public static var ins:JTimeManager = new JTimeManager();
		public function JTimeManager()
		{
			initClass();
		}
		
		private var m_time:Timer;
		
		private var timeList:Vector.<JTimeVo>;
		private function initClass():void
		{
			timeList = new Vector.<JTimeVo>();
			m_time = new Timer(10)
			m_time.addEventListener(TimerEvent.TIMER,onTime);
		}
		
		private function addTimer():void
		{
			
		}
		
		private function onTime(e:Timer):void
		{
			if(timeList.length == 0) return;
			
			for each(var i:JTimeVo in timeList)
			{
				
			}
		}
		
		
	}
}
class JTimeVo
{
	private var m_id:Number;
	private var m_comFun:Function;
	private var m_dealFun:Function;
	
	private var m_isRun:Boolean;
	private var m_interval:Number;
	private var proTime:Number;
	public function JTimeVo()
	{
	}
	
	public static function creatVo(id:Number,interval:Number,comFun:Function,dealFun:Function):JTimeVo
	{
		var result:JTimeVo = new JTimeVo();
		result.m_id = id;
		result.m_interval = interval;
		result.m_comFun = comFun;
		result.m_dealFun = dealFun;
		result.m_isRun = false;
		
		return result;
	}
	
	public function setProTime(time:Number):void
	{
		proTime = time;
	}
	
	
}
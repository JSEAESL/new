package Hit
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import Hit.I.IHit;
	
	import P___H.INeedHit;
	

	public class HitRect extends Sprite
	{
		private var needHitList:Array;
		private var hitRect:Rectangle;
		private var m_w:int = 500;
		private var m_h:int = 500;
		private var m_x:int = 0;
		private var m_y:int = 0;
		
		private var mRoot:IHit;
		
	
		private var mShow:Sprite;
		public function HitRect()
		{
			hitRect = new Rectangle(0,0,0,0)
			needHitList  = [];
		}
		//_____________________private
		private function delHit(Hit:INeedHit):void
		{
			var index:Number = needHitList.indexOf(Hit);
			if(index != -1 )
			{
				needHitList.splice(index,1);
			}
		}
		private function checkFun():void
		{
			if(needHitList.length == 0)return;
			for each(var i:INeedHit in needHitList)
			{
				var rect:Rectangle =  mRoot.getHitRect()
				var hRect:Rectangle = i.Rect;
				if( !rect.union(hRect) )
				{
					delHit(i)
					return;
				}
				var point1:Point = new Point(rect.x, rect.y);  //top-left pixel of tree
				var point2:Point = new Point(i.m_x, i.m_y);  //top-left pixel of hook
		
				if( i.getBitData() && mRoot.Hit(point1, 255, i.getBitData(), point2, 255) )
				{
					mRoot.HitChange(i);
					i.Hit = true;
				}else
				{
					i.Hit = false;
				}

			}
		}
		public function updata(e:Event = null):void
		{
			render()
			checkFun();
			
		}
		
		private function creatmShow():void
		{
			if(mShow) return ;
			mShow = new Sprite();
			addChild(mShow);
		}
		
		private function render():void
		{
			if(!mRoot) return;
			var rect:Rectangle =  mRoot.getHitRect()
			m_w = rect.width
			m_h = rect.height
			m_x = rect.x
			m_y = rect.y

			hitRect.x = m_x;
			hitRect.y = m_y;
			hitRect.width = m_w;
			hitRect.height = m_h;
			creatmShow()
			mShow.graphics.clear();
			mShow.graphics.lineStyle(1,0x666666);
			mShow.graphics.moveTo(m_x,m_y);
			mShow.graphics.lineTo(m_x+ m_w,m_y);
			mShow.graphics.lineTo(m_x+ m_w,m_y + m_h);
			mShow.graphics.lineTo(m_x,m_y + m_h);
			mShow.graphics.lineTo(m_x,m_y);
			
		}
		
		//_____________________public
		public function getHitRect():Rectangle
		{
			return new Rectangle()
		}	
		public function addHit(_Hit:INeedHit):void
		{			
			if(!mRoot) return;
			var rect:Rectangle = mRoot.getHitRect();
			var hRect:Rectangle = _Hit.Rect;

			if( rect.union(hRect) )
			{
				var index:Number = needHitList.indexOf(_Hit);
				if(index == -1)
				{
					//trace("addHit")
					//trace(needHitList.length)
					
					needHitList.push(_Hit);	
				}
			}else
			{
				delHit(_Hit)

			}
			
			return;

		}

		public function setDimHit(DimHit:IHit):void
		{
			mRoot = DimHit;
			updata()
		}
		

		
	}
}
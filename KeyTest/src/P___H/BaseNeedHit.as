package P___H
{
	import com.greensock.plugins.VolumePlugin;
	
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.geom.Rectangle;
	import flash.net.dns.AAAARecord;
	
	import Hit.I.IHit;
	
	import Particle.BaseParticle;
	import Particle.IParticle;
	import Particle.ParticleCreater;
	
	public class BaseNeedHit extends Sprite implements INeedHit, IParticle
	{
		private var bitData:BitmapData
		private var bit:Bitmap;
		private var particleData:BaseParticle;
		public function BaseNeedHit()
		{
		}
		public function Base():void
		{
			if(!particleData) particleData = new BaseParticle();
			if(!bit && bitData ) 
			{
				bit  = new Bitmap(bitData);
				addChild(bit)
			}
			
		}
		
		public function setData(data:BitmapData):void
		{
			bitData = new BitmapData(0,0,true,0x00000000);
			bitData.draw(data);
		}
		
		public function getBitData():BitmapData
		{
			return bitData
		}
		public function get m_x():Number
		{
			return x
		}
		public function get m_y():Number
		{
			return y
		}
		
		
		public function get Rect():Rectangle
		{
			var t:Rectangle = this.getBounds(this)
			t.x = this.x;
			t.y = this.y;
			return t;
		}
		
		public function Liveing():void
		{
			/*抛物线运动公式计算x和y坐标，水平方向：匀速直线运动，竖直方向：匀加速直线运动*/
			x += particleData.speedX;
			y += particleData.speedY;
			
			/*每次都要为y方向的速度添加重力加速度*/
			particleData.speedY += particleData.accelerationY;	
			particleData.speedX += particleData.accelerationX;				
			
			//让粒子的旋转角度与速度方向一致，用反三角函数进行计算，不懂的可以重温第二章跟Math类有关的内容
			rotation = Math.atan2(particleData.speedX, particleData.speedY) / Math.PI * 180;
			//通过改变alpha值实现淡出
			//alpha -= 0.02;
			
			PHView.ins.mHitRect.addHit(this);
		}
		
		public function get isLive():Boolean
		{
			if(!particleData)return false

			return particleData.isLive;
		}
		
		public function Destory():void
		{
		}
	}
}
package Particle
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import P___H.INeedHit;
	import P___H.PHView;
	
	import Pools.CachePool;

	public class BaseParticle extends AParticle implements IParticle,INeedHit
	{
		public function BaseParticle()
		{
			super();
		}
		
		override public function Base():void
		{
			super.Base();
		}
		
		override public function Liveing():void
		{
			super.Liveing();
			/*抛物线运动公式计算x和y坐标，水平方向：匀速直线运动，竖直方向：匀加速直线运动*/
			x += speedX;
			y += speedY;

			/*每次都要为y方向的速度添加重力加速度*/
			speedY += accelerationY;	
			speedX += accelerationX;				

			//让粒子的旋转角度与速度方向一致，用反三角函数进行计算，不懂的可以重温第二章跟Math类有关的内容
			rotation = Math.atan2(speedY, speedX) / Math.PI * 180;
			//通过改变alpha值实现淡出
			alpha -= 0.02;
			
			PHView.ins.mHitRect.addHit(this);
		}
		
		override public function Destory():void
		{
		}
		
		override public function get isLive():Boolean
		{

			return ( !(x>KeyTest.T_W || y>KeyTest.T_H || x<0 ||y<0) ) ;
		}
		

		
		public function get m_x():Number
		{
			return x;
		}
		
		public function get m_y():Number
		{
			return y;
		}
		public function getBitData():BitmapData
		{
			return ParticleCreater.ParticleBD;
		}
		
		public function get Rect():Rectangle
		{
			return new Rectangle();
		}
	}
}
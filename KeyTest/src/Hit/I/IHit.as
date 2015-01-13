package Hit.I
{
	import flash.geom.Rectangle;

	public interface IHit
	{
		function getHit():*
		function Hit(...arg):Boolean
		function HitChange(otherHit:*):void
		function getHitRect():Rectangle
			
		
	}
}
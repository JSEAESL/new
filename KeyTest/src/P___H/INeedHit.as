package P___H
{
	import flash.display.BitmapData;
	import flash.geom.Rectangle;

	public interface INeedHit
	{
		function getBitData():BitmapData
		function get m_x():Number
		function get m_y():Number
		
		
		function get Rect():Rectangle
	}
}
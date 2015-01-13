package Particle
{
	public interface IParticle extends IDestory
	{
		function Base():void
		function Liveing():void
		function get isLive():Boolean
	}
}
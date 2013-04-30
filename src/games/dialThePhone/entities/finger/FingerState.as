package games.dialThePhone.entities.finger 
{
	import core.util.Updateable;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public interface FingerState extends Updateable
	{
		function enter():void;
		function leave():void;
	}
	
}
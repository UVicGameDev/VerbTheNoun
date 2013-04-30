package games.dialThePhone.states 
{
	import core.util.Updateable;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public interface GameState extends Updateable
	{
		function enter():void;
		function leave():void;
	}
	
}
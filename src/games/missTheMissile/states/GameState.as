package games.missTheMissile.states 
{
	
	/**
	 * ...
	 * @author beyamor
	 */
	public interface GameState 
	{
		function enter():void;
		function update():void;
		function leave():void;
	}
	
}
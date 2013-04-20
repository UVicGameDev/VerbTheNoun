package games.missTheMissile.states 
{
	
	/**
	 * ...
	 * @author beyamor
	 */
	public interface GameState 
	{
		function begin():void;
		function update():void;
		function end():void;
	}
	
}
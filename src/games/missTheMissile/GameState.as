package games.missTheMissile 
{
	/**
	 * ...
	 * @author beyamor
	 */
	public class GameState 
	{
		private var	playerKilled:Boolean = false;
		
		public function GameState() 
		{
			
		}
		
		public function killPlayer():void {
			
			playerKilled = true;
		}
		
		public function get playerIsDead():Boolean {
			
			return playerKilled;
		}
	}

}
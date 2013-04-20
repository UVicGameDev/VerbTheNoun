package games.missTheMissile 
{
	/**
	 * ...
	 * @author beyamor
	 */
	public class GameData 
	{
		private var	playerKilled:Boolean = false;
		
		public function GameData() 
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
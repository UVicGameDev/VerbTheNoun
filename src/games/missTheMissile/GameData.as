package games.missTheMissile 
{
	/**
	 * ...
	 * @author beyamor
	 */
	public class GameData 
	{
		private var	playerKilled:Boolean	= false,
					_score:uint				= 0;
		
		public function GameData() 
		{
			
		}
		
		public function get score():uint {
			
			return _score;
		}
		
		public function incrementScore():void {
			
			_score += 100;
		}
		
		public function killPlayer():void {
			
			playerKilled = true;
		}
		
		public function get playerIsDead():Boolean {
			
			return playerKilled;
		}
	}

}
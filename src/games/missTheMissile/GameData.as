package games.missTheMissile 
{
	import games.missTheMissile.entities.Player;
	/**
	 * ...
	 * @author beyamor
	 */
	public class GameData 
	{
		private var	_score:uint		= 0;
		public var	player:Player;
		
		public function GameData() 
		{
			
		}
		
		public function get score():uint {
			
			return _score;
		}
		
		public function incrementScore():void {
			
			_score += 10;
		}
		
		public function killPlayer():void {
			
			player = null;
		}
		
		public function get playerIsDead():Boolean {
			
			return (player == null);
		}
		public function get playerIsAlive():Boolean { return !playerIsDead; } // for readability
	}

}
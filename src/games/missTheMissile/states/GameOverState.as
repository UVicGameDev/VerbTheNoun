package games.missTheMissile.states 
{
	import games.missTheMissile.MissTheMissile;
	import games.missTheMissile.windows.GameOverScreen;
	/**
	 * ...
	 * @author beyamor
	 */
	public class GameOverState implements GameState 
	{
		private var game:MissTheMissile;
		
		public function GameOverState(game:MissTheMissile)
		{
			this.game = game;
		}
		
		/* INTERFACE games.missTheMissile.states.GameState */
		
		public function begin():void 
		{
			game.windows.push(new GameOverScreen(game));
		}
		
		public function update():void 
		{
			game.viewSystem.update();
		}
		
		public function end():void 
		{
			// Whatever.
		}
		
	}

}
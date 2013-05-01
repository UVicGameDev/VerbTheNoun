package games.missTheMissile.states 
{
	import core.context.ELUState;
	import games.missTheMissile.MissTheMissile;
	import games.missTheMissile.windows.GameOverScreen;
	/**
	 * ...
	 * @author beyamor
	 */
	public class GameOverState implements ELUState 
	{
		private var game:MissTheMissile;
		
		public function GameOverState(game:MissTheMissile)
		{
			this.game = game;
		}
		
		/* INTERFACE games.missTheMissile.states.GameState */
		
		public function enter():void 
		{
			game.windows.push(new GameOverScreen(game));
		}
		
		public function update():void 
		{
			game.viewSystem.update();
		}
		
		public function leave():void 
		{
			// Whatever.
		}
		
	}

}
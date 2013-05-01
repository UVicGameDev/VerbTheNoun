package games.missTheMissile.states 
{
	import core.context.ELUState;
	import games.missTheMissile.MissTheMissile;
	import games.missTheMissile.windows.PauseMenu;
	/**
	 * ...
	 * @author beyamor
	 */
	public class PausedState implements ELUState 
	{
		private var game:MissTheMissile;
		
		public function PausedState(game:MissTheMissile) 
		{
			this.game = game;
		}
		
		/* INTERFACE games.missTheMissile.states.GameState */
		
		public function enter():void 
		{
			game.windows.push(new PauseMenu(game));
		}
		
		public function update():void 
		{
			// Shwatevs
		}
		
		public function leave():void 
		{
			// Just going to let the closing of the pause menu take us back to the play state.
		}
		
	}

}
package games.missTheMissile.states 
{
	import core.context.ELUState;
	import core.ui.windows.PauseScreen;
	import games.missTheMissile.MissTheMissile;
	import games.missTheMissile.ui.MtmPauseScreenDecorator;
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
			var pauseScreen:PauseScreen = new PauseScreen(game, new MtmPauseScreenDecorator);
			pauseScreen.onClose = function():void {
				game.state.switchTo("play");
			}
			
			game.windows.push(pauseScreen);
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
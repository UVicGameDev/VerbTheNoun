package games.missTheMissile.states 
{
	import core.context.ELUState;
	import core.ui.windows.decorators.GameOverScreenDecorator;
	import core.ui.windows.GameOverScreen;
	import games.missTheMissile.MissTheMissile;
	import games.missTheMissile.ui.MtmGameOverScreenDecorator;
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
			game.windows.push(new GameOverScreen(game, new MtmGameOverScreenDecorator));
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
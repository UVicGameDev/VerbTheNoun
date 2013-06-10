package games.missTheMissile.states 
{
	import core.context.ELUState;
	import core.ui.windows.decorators.GameOverScreenDecorator;
	import core.ui.windows.GameOverScreen;
	import games.missTheMissile.MissTheMissileWorld;
	import games.missTheMissile.ui.MenuOption;
	import games.missTheMissile.ui.MtmGameOverScreenDecorator;
	import games.missTheMissile.ui.MtmPauseScreenDecorator;
	import games.missTheMissile.ui.MtmScreenDecorator;
	/**
	 * ...
	 * @author beyamor
	 */
	public class GameOverState implements ELUState 
	{
		private var world:MissTheMissileWorld;
		
		public function GameOverState(world:MissTheMissileWorld)
		{
			this.world = world;
		}
		
		/* INTERFACE games.missTheMissile.states.GameState */
		
		public function enter():void 
		{
			var gameOverScreen:GameOverScreen = GameOverScreen.description
													.restart(MenuOption.lablled("restart"))
													.quit(MenuOption.lablled("quit"))
													.buildFor(world);
			(new MtmScreenDecorator).decorate(gameOverScreen.view, gameOverScreen.options, "game over");
			
			world.windows.push(gameOverScreen);
		}
		
		public function update():void 
		{
			world.viewSystem.update();
		}
		
		public function leave():void 
		{
			// Whatever.
		}
		
	}

}
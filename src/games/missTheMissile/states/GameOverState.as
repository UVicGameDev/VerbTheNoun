package games.missTheMissile.states 
{
	import core.context.ELUState;
	import core.ui.windows.decorators.GameOverScreenDecorator;
	import core.ui.windows.GameOverScreen;
	import games.missTheMissile.MissTheMissileWorld;
	import games.missTheMissile.ui.MtmGameOverScreenDecorator;
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
			world.windows.push(new GameOverScreen(world, new MtmGameOverScreenDecorator));
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
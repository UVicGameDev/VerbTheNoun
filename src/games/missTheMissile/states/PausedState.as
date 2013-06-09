package games.missTheMissile.states 
{
	import core.context.ELUState;
	import core.games.Game;
	import core.ui.windows.PauseScreen;
	import games.missTheMissile.MissTheMissile;
	import games.missTheMissile.MissTheMissileWorld;
	import games.missTheMissile.ui.MtmPauseScreenDecorator;
	/**
	 * ...
	 * @author beyamor
	 */
	public class PausedState implements ELUState 
	{
		private var world:MissTheMissileWorld;
		
		public function PausedState(world:MissTheMissileWorld) 
		{
			this.world = world;
		}
		
		/* INTERFACE games.missTheMissile.states.GameState */
		
		public function enter():void 
		{
			var pauseScreen:PauseScreen = new PauseScreen(world, new MtmPauseScreenDecorator);
			pauseScreen.onClose = function():void {
				world.state.switchTo("play");
			}
			
			world.windows.push(pauseScreen);
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
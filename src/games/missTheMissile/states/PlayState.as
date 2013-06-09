package games.missTheMissile.states 
{
	import core.context.ELUState;
	import core.Keys;
	import core.util.Timer;
	import games.missTheMissile.GameData;
	import games.missTheMissile.MissTheMissileWorld;
	import net.flashpunk.utils.Input;
	/**
	 * ...
	 * @author beyamor
	 */
	public class PlayState implements ELUState 
	{
		private var world:MissTheMissileWorld,
					scoreIncrementer:Timer;
		
		public function PlayState(world:MissTheMissileWorld) 
		{
			this.world = world;
			
			scoreIncrementer = new Timer(0.5);
			scoreIncrementer.loops = true;
			scoreIncrementer.addCallback(function():void {
				world.data.incrementScore();
			});
		}
		
		/* INTERFACE games.missTheMissile.states.GameState */
		public function enter():void {
			
			// Eh.
		}
		
		public function update():void 
		{
			world.viewSystem.update();
			
			if (world.data.playerIsDead)			world.state.switchTo("gameOver");
			else if (Input.pressed(Keys.PAUSE))	world.state.switchTo("paused");
			
			scoreIncrementer.update();
		}
		
		public function leave():void {
			
			// Ehhh.
		}
	}

}
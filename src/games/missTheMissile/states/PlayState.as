package games.missTheMissile.states 
{
	import core.Keys;
	import core.util.Timer;
	import games.missTheMissile.GameData;
	import games.missTheMissile.MissTheMissile;
	import net.flashpunk.utils.Input;
	/**
	 * ...
	 * @author beyamor
	 */
	public class PlayState implements GameState 
	{
		private var game:MissTheMissile,
					scoreIncrementer:Timer;
		
		public function PlayState(game:MissTheMissile) 
		{
			this.game = game;
			
			scoreIncrementer = new Timer(0.5);
			scoreIncrementer.loops = true;
			scoreIncrementer.addCallback(function():void {
				game.data.incrementScore();
			});
		}
		
		/* INTERFACE games.missTheMissile.states.GameState */
		public function enter():void {
			
			// Eh.
		}
		
		public function update():void 
		{
			game.viewSystem.update();
			
			if (game.data.playerIsDead)			game.switchTo(game.gameOverState);
			else if (Input.pressed(Keys.START))	game.switchTo(game.pausedState);
			
			scoreIncrementer.update();
		}
		
		public function leave():void {
			
			// Ehhh.
		}
	}

}
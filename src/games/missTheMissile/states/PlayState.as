package games.missTheMissile.states 
{
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
		}
		
		/* INTERFACE games.missTheMissile.states.GameState */
		public function begin():void {
			
			scoreIncrementer = new Timer(0.5);
			scoreIncrementer.loops = true;
			scoreIncrementer.addCallback(function():void {
				game.data.incrementScore();
			});
		}
		
		public function update():void 
		{
			if (game.data.playerIsDead)			game.state = new GameOverState(game);
			else if (Input.pressed(Keys.START))	game.state = new PausedState(game);
			
			scoreIncrementer.update();
		}
		
		public function end():void {
			
			// Ehhh.
		}
	}

}
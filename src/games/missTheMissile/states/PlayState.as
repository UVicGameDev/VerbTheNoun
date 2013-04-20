package games.missTheMissile.states 
{
	import games.missTheMissile.GameData;
	import games.missTheMissile.MissTheMissile;
	import net.flashpunk.utils.Input;
	/**
	 * ...
	 * @author beyamor
	 */
	public class PlayState implements GameState 
	{
		private var game:MissTheMissile;
		
		public function PlayState(game:MissTheMissile) 
		{
			this.game = game;
		}
		
		/* INTERFACE games.missTheMissile.states.GameState */
		public function begin():void {
			
			// Eh.
		}
		
		public function update():void 
		{
			if (game.data.playerIsDead)			game.state = new GameOverState(game);
			else if (Input.pressed(Keys.START))	game.state = new PausedState(game);
		}
		
		public function end():void {
			
			// Ehhh.
		}
	}

}
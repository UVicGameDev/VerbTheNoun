package games.missTheMissile 
{
	import core.Debug;
	import core.Game;
	import games.missTheMissile.windows.GameOverScreen;
	import games.missTheMissile.windows.PauseMenu;
	import games.missTheMissile.windows.PlayWindow;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class MissTheMissile extends Game 
	{
		private var pauseMenuUp:Boolean;
		
		public function MissTheMissile() 
		{
			if (Debug.isEnabled) addGraphic(new Text("Miss the Missile"));
			
			windows.push(
				new PlayWindow(this)
			);
		}
		
		override public function update():void 
		{
			// Hm.
			// This has to happen before the pause menu updates so that we don't pop the menu, then immediately push it back.
			// It's a little awkward. I'll see if I can think of something better.
			if (Input.pressed(Keys.START) && !(windows.top is PauseMenu)) windows.push(new PauseMenu(this));
			
			super.update();
		}
		
		public function playKilled():void {
			
			windows.push(new GameOverScreen(this));
		}
	}

}
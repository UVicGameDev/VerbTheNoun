package games.missTheMissile.windows 
{
	import core.Game;
	import core.ui.windows.sub.SubWindow;
	import games.missTheMissile.ui.MenuOption;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class GameOverScreen extends MissTheMissilePopup 
	{
		
		public function GameOverScreen(game:Game)
		{
			super("Game Over", game);
			
			canBeClosed = false;
		}
		
		override protected function createOptions():Vector.<MenuOption> 
		{
			return new <MenuOption>[
				createRestartOption(),
				createQuitOption()
			];
		}
	}

}
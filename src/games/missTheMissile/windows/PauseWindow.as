package games.missTheMissile.windows 
{
	import core.Game;
	import core.ui.windows.sub.SubWindow;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class PauseWindow extends SubWindow
	{
		private var game:Game;
		
		public function PauseWindow(game:Game) 
		{
			super(600, 400);
			
			this.game = game;
			
			clearColor = 0xFFFF0000;
			centerOnParent();
			
			blocksUpdates = true;
		}
		
	}

}
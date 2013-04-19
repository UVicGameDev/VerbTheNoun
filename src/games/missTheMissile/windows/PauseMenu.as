package games.missTheMissile.windows 
{
	import core.Game;
	import core.ui.windows.sub.Popup;
	import core.ui.windows.sub.SubWindow;
	import net.flashpunk.utils.Input;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class PauseMenu extends Popup
	{
		private var game:Game;
		
		public function PauseMenu(game:Game) 
		{
			super(600, 400, game.windows);
			
			this.game = game;
			
			clearColor = 0xFFFF0000;
			centerOnParent();
			
			blocksUpdates = true;
		}
		
		override public function update():void 
		{
			super.update();
			
			if (Input.pressed(Keys.START) && !isFirstUpdate) close();
		}
	}

}
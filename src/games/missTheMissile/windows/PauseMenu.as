package games.missTheMissile.windows 
{
	import core.Game;
	import core.ui.menus.SelectionList;
	import core.ui.menus.VerticalSelectionList;
	import core.ui.windows.sub.Popup;
	import core.ui.windows.sub.SubWindow;
	import games.missTheMissile.MissTheMissile;
	import games.missTheMissile.states.PlayState;
	import games.missTheMissile.ui.MenuOption;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import vtn.gallery.GalleryPage;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class PauseMenu extends MissTheMissilePopup
	{
		public function PauseMenu(game:MissTheMissile) 
		{
			super("Pause", game)
		}
		
		override protected function createOptions():Vector.<MenuOption> 
		{
			return new <MenuOption>[
				new MenuOption('resume', function():void {
					close();
				}),
				createRestartOption(),
				createQuitOption()
			];
		}
		
		override public function update():void 
		{
			super.update();
			
			if (isFirstUpdate) return;
			
			if (Input.pressed(Keys.START)) close();
		}
		
		override public function close():void 
		{
			super.close();
			game.state = new PlayState(game);
		}
	}

}
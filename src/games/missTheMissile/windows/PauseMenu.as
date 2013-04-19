package games.missTheMissile.windows 
{
	import core.Game;
	import core.ui.menus.SelectionList;
	import core.ui.menus.VerticalSelectionList;
	import core.ui.windows.sub.Popup;
	import core.ui.windows.sub.SubWindow;
	import games.missTheMissile.MissTheMissile;
	import games.missTheMissile.ui.MenuOption;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import vtn.gallery.GalleryPage;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class PauseMenu extends Popup
	{
		private var game:Game,
					options:SelectionList;
		
		public function PauseMenu(game:Game) 
		{
			super(600, 400, game.windows);
			
			this.game = game;
			
			clearColor = 0xFFFF0000;
			centerOnParent();
			
			blocksUpdates = true;
			
			var	restart:MenuOption = new MenuOption(100, 40, "restart", function():void {
					FP.world = new MissTheMissile;
				}),
				
				quit:MenuOption = new MenuOption(100, 80, "quit", function():void {
					FP.world = new GalleryPage();
				});
				
			world.addList(restart, quit);			
			options = new VerticalSelectionList(restart, quit);
		}
		
		override public function update():void 
		{
			super.update();
			
			if (isFirstUpdate) return;
			
			options.update();
			
			if (Input.pressed(Keys.START)) close();
		}
	}

}
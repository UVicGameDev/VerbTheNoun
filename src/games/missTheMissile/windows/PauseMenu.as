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
			
			clearColor = 0x33FFFFFF;
			centerOnParent();
			
			blocksUpdates = true;
			
			var	resume:MenuOption = new MenuOption(40, 'resume', function():void {
					close();
				}),
			
				restart:MenuOption = new MenuOption(80, "restart", function():void {
					FP.world = new MissTheMissile;
				}),
				
				quit:MenuOption = new MenuOption(120, "quit", function():void {
					FP.world = new GalleryPage();
				});
				
			// Ugh. Do something about positioning.
			resume.x	= width / 2 - resume.width / 2;
			restart.x	= width / 2 - restart.width / 2;
			quit.x		= width / 2 - quit.width / 2;
				
			world.addList(resume, restart, quit);			
			options = new VerticalSelectionList(resume, restart, quit);
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
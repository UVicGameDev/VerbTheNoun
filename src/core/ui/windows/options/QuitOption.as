package core.ui.windows.options 
{
	import core.games.Game;
	import core.ui.menus.Hightlightable;
	import core.ui.menus.HighlightableSelector;
	import net.flashpunk.FP;
	import vtn.gallery.GalleryPage;
	
	/**
	 * Selecting the quit option takes the player from a game back to the gallery.
	 * @author beyamor
	 */
	public class QuitOption extends HighlightableSelector 
	{
		private var game:Game;
		
		public function QuitOption(game:Game, highlightable:Hightlightable) 
		{
			super(highlightable);
			this.game = game;
		}
		
		override public function select():void 
		{
			game.quit();
		}
	}

}
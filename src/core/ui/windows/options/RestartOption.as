package core.ui.windows.options 
{
	import core.ui.menus.HighlightableSelector;
	import core.ui.menus.Hightlightable;
	import net.flashpunk.FP;
	
	/**
	 * The restart option restarts whatever game the player is currently playing.
	 * @author beyamor
	 */
	public class RestartOption extends HighlightableSelector 
	{
		private var game:Class;
		
		public function RestartOption(game:Class, highlightable:Hightlightable) 
		{
			super(highlightable);
			this.game = game;
		}
		
		override public function select():void 
		{
			FP.world = new game;
		}
	}

}
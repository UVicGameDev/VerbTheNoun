package core.ui.menus.pause 
{
	import core.ui.menus.HighlightableSelector;
	import core.ui.menus.Hightlightable;
	import net.flashpunk.FP;
	
	/**
	 * ...
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
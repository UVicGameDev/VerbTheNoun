package core.ui.windows.options 
{
	import core.ui.menus.HighlightableSelector;
	import core.ui.menus.Hightlightable;
	import core.ui.windows.PauseScreen;
	import core.ui.windows.Popup;
	import core.ui.windows.Window;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class ResumeOption extends HighlightableSelector 
	{
		private var pauseScreen:Popup;
		
		public function ResumeOption(pauseScreen:Popup, highlightable:Hightlightable) 
		{
			super(highlightable);
			this.pauseScreen = pauseScreen;
		}
		
		override public function select():void 
		{
			pauseScreen.close();
		}
	}

}
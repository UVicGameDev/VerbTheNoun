package core.ui.menus 
{
	/**
	 * ...
	 * @author beyamor
	 */
	public class HighlightableSelector implements Selectable 
	{
		private var highlightable:Hightlightable;
		
		public function HighlightableSelector(highlightable:Hightlightable) 
		{
			this.highlightable = highlightable;
		}
		
		/* INTERFACE core.ui.menus.Selectable */
		
		public function highlight():void 
		{
			highlightable.highlight();
		}
		
		public function removeHighlight():void 
		{
			highlightable.removeHighlight();
		}
		
		public function select():void 
		{
			throw new Error("Implement in subclass");
		}
		
	}

}
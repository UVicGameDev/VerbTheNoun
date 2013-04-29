package core.ui.menus 
{
	
	/**
	 * Something which can be selected.
	 * @author beyamor
	 */
	public interface Selectable 
	{
		function highlight():void;
		function removeHighlight():void;
		function select():void;
	}
	
}
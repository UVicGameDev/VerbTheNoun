package core.ui.menus 
{
	import net.flashpunk.utils.Input;
	/**
	 * ...
	 * @author beyamor
	 */
	public class VerticalSelectionList extends SelectionList 
	{
		
		public function VerticalSelectionList(... selectables)
		{
			super();
			addAll(selectables);
		}
		
		override public function update():void 
		{
			super.update();
			
			if (Input.pressed(Keys.DOWN))		moveToNext();
			if (Input.pressed(Keys.UP))			moveToPrevious();
			if (Input.pressed(Keys.CONFIRM))	selectCurrent();
		}
	}

}
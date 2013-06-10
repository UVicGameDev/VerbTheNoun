package core.ui.menus 
{
	import core.Keys;
	import core.util.Updateable;
	import net.flashpunk.utils.Input;
	/**
	 * Moves through a selection list with the up and down keys.
	 * @author beyamor
	 */
	public class VerticalSelectionList implements Updateable
	{
		private var selectables:SelectionCycle = new SelectionCycle;
		
		public function VerticalSelectionList(... initialSelectables)
		{
			selectables.addAll(initialSelectables);
		}
		
		public function addAll(selectablesToAdd:*):void {
			
			selectables.addAll(selectablesToAdd);
		}
		
		public function add(selectableToAdd:Selectable):void {
			
			selectables.addAll([selectableToAdd]);
		}
		
		public function update():void 
		{
			if (Input.pressed(Keys.DOWN))		selectables.moveToNext();
			if (Input.pressed(Keys.UP))			selectables.moveToPrevious();
			if (Input.pressed(Keys.CONFIRM))	selectables.selectCurrent();
		}
	}

}
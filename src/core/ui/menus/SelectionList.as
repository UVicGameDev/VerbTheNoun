package core.ui.menus 
{
	/**
	 * A list of selectable objects.
	 * The list can be traversed backwards and forwards in a cycle.
	 * @author beyamor
	 */
	public class SelectionList
	{
		private var	selectables:Vector.<Selectable> = new Vector.<Selectable>,
					_currentIndex:uint				= 0;
					
		private function get currentSelection():Selectable {
			
			return selectables[_currentIndex];
		}
	
		private function get currentIndex():uint { return _currentIndex; }
		private function set currentIndex(newIndex:uint):void {
			
			currentSelection.removeHighlight();
			_currentIndex = newIndex;
			currentSelection.highlight();
		}
					
		/**
		 * Creates a new selection list containing the given selectables.
		 */
		public function SelectionList(... selectables)
		{
			addAll(selectables);
		}
		
		/**
		 * Adds a collection of selectables to the list.
		 */
		public function addAll(selectablesToAdd:*):void {
			
			var pendingHighlight:Boolean = (selectables.length == 0 && selectablesToAdd.length > 0);
			
			for each (var selectable:Selectable in selectablesToAdd) selectables.push(selectable);
			
			if (pendingHighlight) selectables[0].highlight();
		}
		
		/**
		 * Focuses on the next selectable.
		 */
		public function moveToNext():void {
			
			currentIndex = (currentIndex + 1) % selectables.length;
		}
		
		/**
		 * Focuses on the previous selectable.
		 */
		public function moveToPrevious():void {
			
			currentIndex = (currentIndex > 0)? (currentIndex - 1) : (selectables.length - 1);
		}
		
		/**
		 * Calls the current selection's select method.
		 */
		public function selectCurrent():void {
			
			currentSelection.select();
		}
		
		public function update():void {
			
			// Do nothing
		}
	}

}
package core.util 
{
	/**
	 * Often, you want to update something which is not, conceptually, an entity.
	 * As a convenience, rather than manually updating each of these updateable things manually,
	 * you can add them to an update list (available in things like a game, a window, or a view)
	 * and have the updating taken care.
	 * If you find yourself overriding an update method just to call update on other objects,
	 * see if you can make use of one of these lists.
	 * 
	 * Note that, if you require a more definite ordering to updates,
	 * it is recommended that you do not use a list like this and instead make the update order explicit.
	 * @author beyamor
	 */
	public class UpdateList implements Updateable
	{
		private var updateables:Vector.<Updateable> = new Vector.<Updateable>;
		
		public function UpdateList(... updateablesToAdd)
		{
			for each (var updateable:Updateable in updateablesToAdd) updateables.push(updateable);
		}
		
		public function add(... updateablesToAdd):void {
			
			for each (var updateable:Updateable in updateablesToAdd) updateables.push(updateable);
		}
		
		public function remove(updateable:Updateable):void {
			
			var indexOfUpdateable:int = updateables.indexOf(updateable);
			
			if (indexOfUpdateable < 0) return;
			
			updateables.splice(indexOfUpdateable, 1);
		}
		
		public function update():void {
			
			// Defensively copying here we can modify the updateable list while iterating through it
			var updateablesCopy:Vector.<Updateable> = updateables.concat();
			for each (var updateable:Updateable in updateablesCopy) updateable.update();
		}
	}

}
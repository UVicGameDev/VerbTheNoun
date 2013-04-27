package games.missTheMissile.views 
{
	import core.ui.View;
	import games.missTheMissile.entities.SpaceEntity;
	
	/**
	 * This view contains some game-specific logic.
	 * @author beyamor
	 */
	public class PlayView extends View 
	{
		
		public function PlayView(width:Number, height:Number)
		{
			super(width, height);
		}
		
		override public function update():void 
		{
			super.update();
			
			checkCollisions();
		}
		
		/**
		 * Letting each entity check for collisions itself led to missed collisions.
		 * Explicitly checking each pair works much better.
		 */
		private function checkCollisions():void {
			
			var spaceEntities:Vector.<SpaceEntity> = new Vector.<SpaceEntity>;
			getClass(SpaceEntity, spaceEntities);
			
			for (var firstIndex:int = 0; firstIndex < spaceEntities.length - 1; ++firstIndex) {
				for (var secondIndex:int = firstIndex + 1; secondIndex < spaceEntities.length; ++secondIndex) {
					
					var	first:SpaceEntity	= spaceEntities[firstIndex],
						second:SpaceEntity	= spaceEntities[secondIndex];
						
					if (first.collideWith(second, first.x, first.y)) {
						
						first.collided(second);
						second.collided(first);
					}
				}
			}
		}
	}

}
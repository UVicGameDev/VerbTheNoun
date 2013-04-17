package games.missTheMissile.ui 
{
	import games.missTheMissile.util.camera.Camera;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class IncomingAlert extends Entity 
	{
		private var	entity:Entity,
					camera:Camera;
		
		public function IncomingAlert(description:String, color:uint, entity:Entity, camera:Camera) 
		{
			this.entity	= entity;
			this.camera	= camera;
			
			visible = false; // Going to turn this off until the first positioning has been made
			
			var text:Text = new Text(description);
			text.color = color;
			text.centerOO();
			
			graphic = text;
		}
		
		override public function update():void 
		{
			super.update();
			
			reposition();
			visible = true;
			
			if (entityIsOnscreen) {
				
				if (world) world.remove(this);
			}
		}
		
		private function reposition():void {
			
			// Okay. Let's see.
			// If we're onscreen in the y, but not the x
			if (entity.y >= camera.top && entity.y <= camera.bottom) {
				
				y = entity.y;
				
				if (entity.x < camera.left)	x = camera.left;
				else						x = camera.right;
			}
			
			// Otherwise, if we're onscreen in the x, but not the y
			else if (entity.x >= camera.left && entity.x <= camera.right) {
				
				x = entity.x;
				
				if (entity.y < camera.top)	y = camera.top;
				else						y = camera.bottom;
			}
			
			// Otherwise, we're off in one of the (literal) corner cases
			else {
				
				// Eh. We'll deal with this later.
			}
		}
		
		private function get entityIsOnscreen():Boolean {
			
			if (entity.x + entity.halfWidth < camera.left ||
				entity.y + entity.halfHeight < camera.top ||
				entity.x - entity.halfWidth > camera.right ||
				entity.y - entity.halfHeight > camera.bottom) return false;
				
			return true;
		}
	}

}
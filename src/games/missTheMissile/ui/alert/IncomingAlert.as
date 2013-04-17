package games.missTheMissile.ui.alert 
{
	import games.missTheMissile.util.camera.Camera;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Text;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class IncomingAlert extends Entity 
	{
		private static const MARGIN:Number = 24;
		
		private var	entity:Entity,
					camera:Camera,
					arrow:AlertArrow;
		
		public function IncomingAlert(description:String, color:uint, entity:Entity, camera:Camera) 
		{
			this.entity	= entity;
			this.camera	= camera;
			
			arrow = new AlertArrow(color);
			graphic = new Graphiclist(arrow);
		}
		
		override public function update():void 
		{
			super.update();
			
			reposition();
			
			if (entityIsOnscreen) {
				
				if (world) world.remove(this);
			}
		}
		
		private function boundVertically():void {
			
			if (y < camera.top + MARGIN)	y = camera.top + MARGIN;
			if (y > camera.bottom - MARGIN)	y = camera.bottom - MARGIN;
		}
		
		private function boundHorizontally():void {
			
			if (x < camera.left + MARGIN)	x = camera.left + MARGIN;
			if (x > camera.right - MARGIN)	x = camera.right - MARGIN;
		}
		
		private function reposition():void {
			
			const	belowLeft:Boolean	= (entity.x < camera.left),
					aboveRight:Boolean	= (entity.x > camera.right),
					belowTop:Boolean	= (entity.y < camera.top),
					aboveBottom:Boolean	= (entity.y > camera.bottom),
					xIsInCamera:Boolean	= !(belowLeft || aboveRight),
					yIsInCamera:Boolean = !(belowTop || aboveBottom);
			
			// Okay. Let's see.
			// If we're onscreen in the y, but not the x
			if (yIsInCamera) {
				
				y = entity.y;
				
				if (entity.x < camera.left) {
					
					y = entity.y;
					x = camera.left;
					arrow.faceLeft();
					boundVertically();
				}
				
				else {
					
					y = entity.y;
					x = camera.right;
					arrow.faceRight();
					boundVertically();					
				}
			}
			
			// Otherwise, if we're onscreen in the x, but not the y
			else if (xIsInCamera) {
				
				x = entity.x;
				
				if (entity.y < camera.top) {
					
					x = entity.x;
					y = camera.top;
					arrow.faceUp();
					boundHorizontally();				
				}
				
				else {
					
					x = entity.x
					y = camera.bottom;
					arrow.faceDown();
					boundHorizontally();				
				}
			}
			
			// Otherwise, we're off in one of the (literal) corner cases
			else {
				
				if (belowLeft && belowTop) {
					
					x = camera.left;
					y = camera.top;
					arrow.faceUpLeft();
				}
				
				else if (aboveRight && belowTop) {
					
					x = camera.right;
					y = camera.top;
					arrow.faceUpRight();
				}
				
				else if (belowLeft && aboveBottom) {
					
					x = camera.left;
					y = camera.bottom;
					arrow.faceDownLeft();
				}
				
				else {
					
					x = camera.right;
					y = camera.bottom;
					arrow.faceDownRight();
				}
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
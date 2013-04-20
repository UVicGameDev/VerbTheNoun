package games.missTheMissile.ui.alert 
{
	import core.ui.windows.Window;
	import core.util.camera.Camera;
	import games.missTheMissile.graphics.AlertArrow;
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
					entityCamera:Camera,
					ownCamera:Camera,
					arrow:AlertArrow;
		
		public function IncomingAlert(description:String, color:uint, entity:Entity, entityCamera:Camera, ownCamera:Camera)
		{
			this.entity			= entity;
			this.entityCamera	= entityCamera;
			this.ownCamera		= ownCamera;
			
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
			
			if (y < ownCamera.top + MARGIN)	y = ownCamera.top + MARGIN;
			if (y > ownCamera.bottom - MARGIN)	y = ownCamera.bottom - MARGIN;
		}
		
		private function boundHorizontally():void {
			
			if (x < ownCamera.left + MARGIN)	x = ownCamera.left + MARGIN;
			if (x > ownCamera.right - MARGIN)	x = ownCamera.right - MARGIN;
		}
		
		private function reposition():void {
			
			const	belowLeft:Boolean	= (entity.x < entityCamera.left),
					aboveRight:Boolean	= (entity.x > entityCamera.right),
					belowTop:Boolean	= (entity.y < entityCamera.top),
					aboveBottom:Boolean	= (entity.y > entityCamera.bottom),
					xIsInCamera:Boolean	= !(belowLeft || aboveRight),
					yIsInCamera:Boolean = !(belowTop || aboveBottom);
			
			// Okay. Let's see.
			// If we're onscreen in the y, but not the x
			if (yIsInCamera) {
				
				y = entity.y;
				
				if (entity.x < entityCamera.left) {
					
					y = entity.y - entityCamera.y + ownCamera.y;
					x = ownCamera.left;
					arrow.faceLeft();
					boundVertically();
				}
				
				else {
					
					y = entity.y - entityCamera.y + ownCamera.y;
					x = ownCamera.right;
					arrow.faceRight();
					boundVertically();					
				}
			}
			
			// Otherwise, if we're onscreen in the x, but not the y
			else if (xIsInCamera) {
				
				x = entity.x;
				
				if (entity.y < entityCamera.top) {
					
					x = entity.x - entityCamera.x + ownCamera.x;
					y = ownCamera.top;
					arrow.faceUp();
					boundHorizontally();				
				}
				
				else {
					
					x = entity.x - entityCamera.x + ownCamera.x;
					y = ownCamera.bottom;
					arrow.faceDown();
					boundHorizontally();				
				}
			}
			
			// Otherwise, we're off in one of the (literal) corner cases
			else {
				
				if (belowLeft && belowTop) {
					
					x = ownCamera.left;
					y = ownCamera.top;
					arrow.faceUpLeft();
				}
				
				else if (aboveRight && belowTop) {
					
					x = ownCamera.right;
					y = ownCamera.top;
					arrow.faceUpRight();
				}
				
				else if (belowLeft && aboveBottom) {
					
					x = ownCamera.left;
					y = ownCamera.bottom;
					arrow.faceDownLeft();
				}
				
				else {
					
					x = ownCamera.right;
					y = ownCamera.bottom;
					arrow.faceDownRight();
				}
			}
		}
		
		private function get entityIsOnscreen():Boolean {
			
			if (entity.x + entity.halfWidth < entityCamera.left ||
				entity.y + entity.halfHeight < entityCamera.top ||
				entity.x - entity.halfWidth > entityCamera.right ||
				entity.y - entity.halfHeight > entityCamera.bottom) return false;
				
			return true;
		}
	}

}
package games.missTheMissile.entities 
{
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class SpaceEntity extends Entity 
	{
		public var velocity:Point = new Point(0, 0);	
		
		public function SpaceEntity(x:Number, y:Number, graphic:Graphic) 
		{
			super(x, y, graphic);
			
			type = "spaceEntity";
		}
		
		override public function update():void 
		{
			super.update();
			
			x += velocity.x * FP.elapsed;
			y += velocity.y * FP.elapsed;
			
			checkCollisions();
		}
		
		private function checkCollisions():void {
			
			var collisionResult:SpaceEntity = collide("spaceEntity", x, y) as SpaceEntity;
			
			if (!collisionResult) return;
			
			collided(collisionResult);
		}
		
		public function collided(other:SpaceEntity):void {
			
			// Override in subclass
		}
		
		public function get direction():Number {
			
			return Math.atan2(velocity.y, velocity.x);
		}
		
		public function set direction(direction:Number):void {
			
			var speed:Number = velocity.length;
			
			velocity.x = speed * Math.cos(direction);
			velocity.y = speed * Math.sin(direction);
		}
		
		public function get speed():Number {
			
			return velocity.length;
		}
		
		public function set speed(speed:Number):void {
			
			var direction:Number = this.direction;
			
			velocity.x = speed * Math.cos(direction);
			velocity.y = speed * Math.sin(direction);
		}
	}

}
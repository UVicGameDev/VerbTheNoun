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
		private var _direction:Number = 0;
		
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
			
			if (velocity.x != 0 || velocity.y != 0) {
				
				_direction = Math.atan2(velocity.y, velocity.x);
			}
			return _direction;
		}
		
		public function set direction(direction:Number):void {
			
			_direction = direction;
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
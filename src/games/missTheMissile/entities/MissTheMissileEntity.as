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
	public class MissTheMissileEntity extends Entity 
	{
		public var velocity:Point = new Point(0, 0);	
		
		public function MissTheMissileEntity(x:Number, y:Number, graphic:Graphic) 
		{
			super(x, y, graphic);
		}
		
		override public function update():void 
		{
			super.update();
			
			x += velocity.x * FP.elapsed;
			y += velocity.y * FP.elapsed;
		}
		
		public function collided(other:MissTheMissileEntity):void {
			
			// Override in subclass
		}
		
		public function get direction():Number {
			
			if (!velocity) return 0;
			
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
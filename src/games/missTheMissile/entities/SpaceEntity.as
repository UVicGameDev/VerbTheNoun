package games.missTheMissile.entities 
{
	import core.motion.Velocity;
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
		public var velocity:Velocity;
		
		public function SpaceEntity(x:Number, y:Number, graphic:Graphic) 
		{
			super(x, y, graphic);
			
			type = "spaceEntity";
		}
		
		override public function update():void 
		{
			super.update();
			
			x += velocity.dx;;
			y += velocity.dy;
		}
		
		public function collided(other:SpaceEntity):void {
			
			// Override in subclass
		}
	}

}
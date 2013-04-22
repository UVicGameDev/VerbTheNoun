package games.missTheMissile.entities 
{
	import core.Random;
	import flash.geom.Rectangle;
	import games.missTheMissile.graphics.explosions.ExplosionSprite;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Canvas;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Star extends Entity 
	{
		
		public function Star(x:Number, y:Number)
		{
			const	size:uint		= Random.choose(1, 2),
					sprite:Canvas	= new Canvas(size, size),
					color:uint		= 0xFFFFFF;
				
			sprite.drawRect(new Rectangle(0, 0, size, size), color);
			
			super(x, y, sprite);
		}
	}

}
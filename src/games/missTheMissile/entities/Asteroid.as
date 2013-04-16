package games.missTheMissile.entities 
{
	import core.Random;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Canvas;
	/**
	 * ...
	 * @author beyamor
	 */
	public class Asteroid extends MissTheMissileEntity 
	{
		private static const	WIDTH:Number			= 72,
								HEIGHT:Number			= 72,
								SPEED:Number			= 200;
		
		private var sprite:Canvas;
		
		public function Asteroid(x:Number, y:Number)
		{
			width	= WIDTH;
			height	= HEIGHT;
			centerOrigin();
			
			sprite		= new Canvas(width, height);
			sprite.x	= -sprite.width / 2;
			sprite.y	= -sprite.height / 2;
			sprite.drawRect(new Rectangle(0, 0, width, height), 0x0000FF);
			
			super(x, y, sprite);
			
			var	direction:Number = Random.inRange(0, Math.PI * 2);
			velocity = new Point(SPEED * Math.cos(direction), SPEED * Math.sin(direction));
		}
		
	}

}
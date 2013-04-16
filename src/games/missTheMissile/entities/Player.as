package games.missTheMissile.entities 
{
	import flash.geom.Rectangle;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Canvas;
	
	/**
	 * This guy moves it moves it.
	 * @author beyamor
	 */
	public class Player extends Entity 
	{
		private var sprite:Canvas;
		
		public function Player(x:Number, y:Number)
		{
			sprite		= new Canvas(48, 48);
			sprite.x	= -sprite.width / 2;
			sprite.y	= -sprite.height / 2;
			
			sprite.drawRect(new Rectangle(1, 1, 47, 47), 0xFFFFFF);
			
			super(x, y, sprite);
		}
		
	}

}
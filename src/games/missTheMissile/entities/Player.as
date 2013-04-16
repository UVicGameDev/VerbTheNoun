package games.missTheMissile.entities 
{
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Canvas;
	import net.flashpunk.utils.Input;
	
	/**
	 * This guy moves it moves it.
	 * @author beyamor
	 */
	public class Player extends Entity 
	{
		private static const	MAX_VELOCITY:Number		= 400,
								ACCELERATION:Number		= 80;
		
		private var	sprite:Canvas,
					velocity:Point		= new Point(0, 0);				
		
		public function Player(x:Number, y:Number)
		{
			sprite		= new Canvas(48, 48);
			sprite.x	= -sprite.width / 2;
			sprite.y	= -sprite.height / 2;
			
			sprite.drawRect(new Rectangle(1, 1, 47, 47), 0xFFFFFF);
			
			super(x, y, sprite);
		}
		
		override public function update():void 
		{
			super.update();
			
			checkMotion();
			
			x += velocity.x * FP.elapsed;
			y += velocity.y * FP.elapsed;
		}
		
		private function checkMotion():void {
			
			var	dx:Number	= 0,
				dy:Number	= 0;
				
			if (Input.check(Keys.LEFT))		dx -= 1;
			if (Input.check(Keys.RIGHT))	dx += 1;
			if (Input.check(Keys.UP))		dy -= 1;
			if (Input.check(Keys.DOWN))		dy += 1;
			
			if (dx != 0 && dy != 0) {
				
				dx *= Math.SQRT1_2;
				dy *= Math.SQRT1_2;
			}
			
			velocity.x += dx * ACCELERATION;
			velocity.y += dy * ACCELERATION;
			
			if (velocity.length > MAX_VELOCITY) {
				
				var clampRatio:Number = MAX_VELOCITY / velocity.length;
				
				velocity.x *= clampRatio;
				velocity.y *= clampRatio;
			}
		}
	}

}
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
	public class Player extends MissTheMissileEntity 
	{
		private static const	MAX_VELOCITY:Number		= 400,
								ACCELERATION:Number		= 80,
								WIDTH:Number			= 48,
								HEIGHT:Number			= 48,
								FRICTION:Number			= 8;
		
		private var	sprite:Canvas;			
		
		public function Player(x:Number, y:Number)
		{
			sprite		= new Canvas(WIDTH, HEIGHT);
			sprite.x	= -sprite.width / 2;
			sprite.y	= -sprite.height / 2;
			
			width		= WIDTH;
			height		= HEIGHT;
			centerOrigin();
			
			sprite.drawRect(new Rectangle(0, 0, width, height), 0xFFFFFF);
			
			super(x, y, sprite);
		}
		
		override public function update():void 
		{
			super.update();
			
			checkMotion();
		}
		
		private function applyFriction():void {
			
			if (speed == 0) return;
			
			speed	= Math.max(0, speed - FRICTION);
		}
		
		private function checkMotion():void {
			
			var	dx:Number	= 0,
				dy:Number	= 0,
				tryingToMove:Boolean = false;
				
			if (Input.check(Keys.LEFT))		{ dx -= 1; tryingToMove = true; }
			if (Input.check(Keys.RIGHT))	{ dx += 1; tryingToMove = true; }
			if (Input.check(Keys.UP))		{ dy -= 1; tryingToMove = true; }
			if (Input.check(Keys.DOWN))		{ dy += 1; tryingToMove = true; }
			
			if (dx != 0 && dy != 0) {
				
				dx *= Math.SQRT1_2;
				dy *= Math.SQRT1_2;
			}
			
			if (!tryingToMove) applyFriction();
			
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
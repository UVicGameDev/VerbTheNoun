package games.dialThePhone.entities 
{
	import core.GameConsts;
	import core.Keys;
	import flash.geom.Point;
	import games.dialThePhone.entities.keys.Key;
	import games.dialThePhone.graphics.FingerSprite;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Finger extends Entity 
	{
		private var	ACCELERATION:Number	= 50,
					MAX_SPEED:Number	= 600,
					FRICTION:Number		= 7;
		
		private var	velocity:Point		= new Point,
					sprite:FingerSprite;
		
		public function Finger(initialX:Number, initialY:Number) 
		{
			sprite = new FingerSprite;
			
			super(initialX, initialY, sprite);
		}
		
		private function tryKeyPress():void {
			
			var	pressedKey:Key = collide("key", x, y) as Key;
			
			if (!pressedKey) return;
			
			pressedKey.press();
		}
		
		override public function update():void 
		{
			super.update();			
			
			if (Input.pressed(Keys.ACTION1)) {
				
				sprite.tap(function():void {
					
					tryKeyPress();
				});
			}
			
			if (!sprite.isTapping) {
				
				move();
			}
			
			else {
				
				velocity.x = velocity.y = 0;
			}
		}
		
		private function move():void {
			
			// I'm copying this almost wholesale from missTheMissile's Player.
			// Consider factoring it out into something.
			var	dx:Number				= 0,
				dy:Number				= 0,
				tryingToMove:Boolean	= false;
				
			if (Input.check(Keys.LEFT))		{ dx -= 1; tryingToMove = true; }
			if (Input.check(Keys.RIGHT))	{ dx += 1; tryingToMove = true; }
			if (Input.check(Keys.UP))		{ dy -= 1; tryingToMove = true; }
			if (Input.check(Keys.DOWN))		{ dy += 1; tryingToMove = true; }
			
			if (dx != 0 && dy != 0) {
				
				dx *= Math.SQRT1_2;
				dy *= Math.SQRT1_2;
			}
			
			if (!tryingToMove) {
				
				var	speed:Number		= Math.sqrt(velocity.x * velocity.x + velocity.y * velocity.y),
					reducedSpeed:Number = Math.max(0, speed - FRICTION),
					direction:Number	= Math.atan2(velocity.y, velocity.x);
					
				velocity.x = Math.cos(direction) * reducedSpeed;
				velocity.y = Math.sin(direction) * reducedSpeed;
			}
			
			velocity.x += dx * ACCELERATION;
			velocity.y += dy * ACCELERATION;
			
			x += velocity.x * FP.elapsed;
			y += velocity.y * FP.elapsed;
			
			// Probably also want to factor out this bounding logic.
			if (x < 0)						{ x = 0;						velocity.x = 0; }
			if (x > GameConsts.WIDTH)		{ x = GameConsts.WIDTH;			velocity.x = 0; }
			if (y < 0)						{ y = 0;						velocity.y = 0; }
			if (y > GameConsts.HALF_HEIGHT)	{ y = GameConsts.HALF_HEIGHT;	velocity.y = 0; }
		}
	}

}
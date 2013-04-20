package games.missTheMissile.entities 
{
	import flash.filters.DisplacementMapFilterMode;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import games.missTheMissile.arena.Arena;
	import games.missTheMissile.GameData;
	import games.missTheMissile.graphics.PlayerSprite;
	import games.missTheMissile.MissTheMissile;
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
		
		private var	sprite:PlayerSprite,
					arena:Arena,
					game:GameData;
		
		public function Player(x:Number, y:Number, game:GameData, arena:Arena)
		{
			this.arena	= arena;
			this.game	= game;
			
			width	= WIDTH;
			height	= HEIGHT;
			sprite	= new PlayerSprite(this);
			
			super(x, y, sprite);
		}
		
		override public function update():void 
		{
			super.update();
			sprite.update();
			
			checkMotion();
			boundToArena();
		}
		
		private function boundToArena():void {
			
			if (x - halfWidth < 0)				{ x = halfWidth;					velocity.x = 0; }
			if (x + halfWidth > arena.width)	{ x = arena.width - halfWidth;		velocity.x = 0; }
			if (y - halfHeight < 0)				{ y = halfHeight;					velocity.y = 0; }
			if (y + halfHeight > arena.height)	{ y = arena.height - halfHeight;	velocity.y = 0; }
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
		
		override public function collided(other:MissTheMissileEntity):void 
		{
			super.collided(other);
			
			game.killPlayer();
		}
	}

}
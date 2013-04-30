package games.missTheMissile.entities 
{
	import core.Debug;
	import core.input.TopDownKeyInterpreter;
	import core.Keys;
	import flash.filters.DisplacementMapFilterMode;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	import games.missTheMissile.arena.Arena;
	import games.missTheMissile.GameData;
	import games.missTheMissile.graphics.explosions.ExplosionSprite;
	import games.missTheMissile.graphics.PlayerSprite;
	import games.missTheMissile.MissTheMissile;
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	
	/**
	 * This guy moves it moves it.
	 * @author beyamor
	 */
	public class Player extends SpaceEntity 
	{
		private static const	MAX_SPEED:Number		= 400,
								ACCELERATION:Number		= 80,
								WIDTH:Number			= 48,
								HEIGHT:Number			= 48,
								FRICTION:Number			= 8;
		
		private var	sprite:PlayerSprite,
					arena:Arena,
					data:GameData,
					moveIntention:TopDownKeyInterpreter	= new TopDownKeyInterpreter;
		
		public function Player(x:Number, y:Number, data:GameData, arena:Arena)
		{
			this.arena	= arena;
			this.data	= data;
			
			width	= WIDTH;
			height	= HEIGHT;
			sprite	= new PlayerSprite(this);
			
			super(x, y, sprite);
		}
		
		override public function update():void 
		{
			super.update();
			
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
			
			speed = Math.max(0, speed - FRICTION);
		}
		
		private function checkMotion():void {
			
			moveIntention.update();
			
			if (!moveIntention.tryingToMove) applyFriction();
			
			velocity.x += moveIntention.dx * ACCELERATION;
			velocity.y += moveIntention.dy * ACCELERATION;
			
			if (speed > MAX_SPEED) speed = MAX_SPEED;
		}
		
		override public function collided(other:SpaceEntity):void 
		{
			super.collided(other);
			
			if (Debug.invincibilityEnabled) return;
			
			data.killPlayer();
			if (world) {
				
				world.add(new Explosion(x, y));
				world.remove(this);
			}
		}
	}

}
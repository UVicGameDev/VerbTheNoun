package games.missTheMissile.entities 
{
	import core.motion.BoundedVelocity;
	import core.motion.Velocity;
	import flash.external.ExternalInterface;
	import flash.geom.Rectangle;
	import games.missTheMissile.GameData;
	import games.missTheMissile.graphics.MissileSprite;
	/**
	 * ...
	 * @author beyamor
	 */
	public class Missile extends SpaceEntity 
	{
		private static const	MAX_SPEED:Number		= 450,
								ACCELERATION:Number		= 10,
								WIDTH:Number			= 32,
								HEIGHT:Number			= 32;
		
		private var	data:GameData;
		private function get player():Player { return data.player; }
		
		public function Missile(x:Number, y:Number, data:GameData)
		{
			this.data = data;
			
			width	= WIDTH;
			height	= HEIGHT;
			centerOrigin();
			
			super(x, y, new MissileSprite(this));
			
			velocity = new BoundedVelocity(MAX_SPEED, directionToPlayer, MAX_SPEED);
		}
		
		private function get directionToPlayer():Number {
			
			return Math.atan2(player.y - y, player.x - x);
		}
		
		override public function update():void 
		{
			super.update();
			
			if (data.playerIsAlive) {
				
				velocity.accelerate(directionToPlayer, ACCELERATION);
			}
		}
		
		override public function collided(other:SpaceEntity):void 
		{
			super.collided(other);
			
			var wasHit:Boolean = false;
			
			if (other is Missile) {
				
				var	velocityDot:Number					= velocity.x * other.velocity.x + velocity.y * other.velocity.y,
					movingInOppositeDirection:Boolean	= (velocityDot < 0);
					
				if (movingInOppositeDirection) wasHit = true;
			}
			
			else {
				
				wasHit = true;
			}
			
			if (wasHit && world) {
				
				world.add(new Explosion(x, y));
				world.remove(this);
			}
		}
	}

}
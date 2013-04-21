package games.missTheMissile.entities 
{
	import flash.external.ExternalInterface;
	import flash.geom.Rectangle;
	import games.missTheMissile.graphics.MissileSprite;
	/**
	 * ...
	 * @author beyamor
	 */
	public class Missile extends MissTheMissileEntity 
	{
		private static const	MAX_SPEED:Number		= 450,
								ACCELERATION:Number		= 10,
								WIDTH:Number			= 32,
								HEIGHT:Number			= 32;
		
		private var	player:Player;
		
		public function Missile(x:Number, y:Number, player:Player)
		{
			this.player = player;
			
			width	= WIDTH;
			height	= HEIGHT;
			centerOrigin();
			
			super(x, y, new MissileSprite(this));
			
			speed		= MAX_SPEED;
			direction	= directionToPlayer;
		}
		
		private function get directionToPlayer():Number {
			
			return Math.atan2(player.y - y, player.x - x);
		}
		
		override public function update():void 
		{
			super.update();
			
			var intendedDirection:Number = directionToPlayer;
			velocity.x += ACCELERATION * Math.cos(intendedDirection);
			velocity.y += ACCELERATION * Math.sin(intendedDirection);
			
			speed = Math.min(MAX_SPEED, speed);
		}
		
		override public function collided(other:MissTheMissileEntity):void 
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
package games.missTheMissile.entities 
{
	import flash.geom.Rectangle;
	import net.flashpunk.graphics.Canvas;
	/**
	 * ...
	 * @author beyamor
	 */
	public class Missile extends MissTheMissileEntity 
	{
		private static const	MAX_SPEED:Number		= 450,
								ACCELERATION:Number		= 30,
								WIDTH:Number			= 32,
								HEIGHT:Number			= 32;
		
		private var	sprite:Canvas,
					player:Player;
		
		public function Missile(x:Number, y:Number, player:Player)
		{
			this.player = player;
			
			width	= WIDTH;
			height	= HEIGHT;
			centerOrigin();
			
			sprite		= new Canvas(width, height);
			sprite.x	= -sprite.width / 2;
			sprite.y	= -sprite.height / 2;
			sprite.drawRect(new Rectangle(0, 0, width, height), 0xFF0000);
			
			super(x, y, sprite);
			
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
	}

}
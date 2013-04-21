package games.missTheMissile.entities 
{
	import games.missTheMissile.graphics.explosions.ExplosionSprite;
	import net.flashpunk.Entity;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class Explosion extends Entity 
	{
		private var sprite:ExplosionSprite;
		
		public function Explosion(x:Number, y:Number)
		{
			sprite = new ExplosionSprite();
			super(x, y, sprite);
		}
		
		override public function update():void 
		{
			super.update();
			
			if (sprite.completed) {
				
				if (world) world.remove(this);
			}
		}
	}

}
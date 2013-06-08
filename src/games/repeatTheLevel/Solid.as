package games.repeatTheLevel
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author Lambwatt
	 */
	public class Solid extends Entity 
	{
		
		public function Solid(x:int, y:int, image:Image, hit_x:int, hit_y:int, width:int, height:int, type:String) 
		{
			super();
			setHitbox(width, height, hit_x, hit_y);
			graphic = image;
			this.x = x;
			this.y = y;
			this.type = type;
			layer = 2;
		}
	}
}
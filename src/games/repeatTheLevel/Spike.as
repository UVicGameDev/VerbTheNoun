package games.repeatTheLevel 
{
	
	import games.repeatTheLevel.common.Assets;
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author Lambwatt
	 */
	public class Spike extends Solid 
	{
		
		public function Spike(x:int, y:int) 
		{
			var picture:Image = new Image(Assets.IMG_SPIKE);
			super (x, y, picture, 0, -picture.height / 2, picture.width, picture.height / 2, "threat");
			layer = 0;
		}
	}

}
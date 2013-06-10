package games.repeatTheLevel 
{
	import games.repeatTheLevel.common.Assets;
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author Lambwatt
	 */
	public class PhantomSpike extends Solid 
	{
		
		public function PhantomSpike(x:int, y:int) 
		{
			var picture:Image = new Image(Assets.IMG_PHANTOMSPIKE);
			super (x, y, picture, 0, picture.height / 2, picture.width, picture.height / 2, "phantom");
			layer = 0;
		}
		
	}

}
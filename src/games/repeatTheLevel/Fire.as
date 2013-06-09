package games.repeatTheLevel 
{
	import games.repeatTheLevel.common.Assets;
	/**
	 * ...
	 * @author Lambwatt
	 */
	public class Fire extends Solid 
	{
		public function Fire(x, y) 
		{
			var picture:Image = new Image(Assets.IMG_FIRE);
			super (x, y, picture, 0, picture.height - 8, picture.width,8,"threat");		
			layer = 0;
		}
	}
}
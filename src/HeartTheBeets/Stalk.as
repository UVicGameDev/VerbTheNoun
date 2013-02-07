package HeartTheBeets 
{
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author Lambwatt
	 */
	public class Stalk extends HeartTheBeetsEntity
	{
		[Embed(source = 'HTB_assets/BeetStalk.png')] private const BEET_STALK:Class;
		private var beet_stalk:Image = new Image(BEET_STALK);
		
		public function Stalk(x:int,y:int) 
		{
			super(x, y);
		}
		
		public function get_image():Image
		{
			beet_stalk.y = y;
			beet_stalk.x = 24;
			return beet_stalk;
		}
	}

}
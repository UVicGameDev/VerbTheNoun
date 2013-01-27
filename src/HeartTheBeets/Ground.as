package HeartTheBeets 
{
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author Lambwatt
	 */
	public class Ground extends HeartTheBeetsEntity
	{
		[Embed(source = 'HTB_assets/Dirt.png')] private const DIRT:Class;
		
		public function Ground(y:int) 
		{
			super(0, y);
		}
		
		public override function get_graphic_list():Graphiclist
		{
			var myImage:Image = new Image(DIRT);
			myImage.y = y;
			return new Graphiclist(myImage);
		}
	}

}
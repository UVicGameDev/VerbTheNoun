package HeartTheBeets 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Graphiclist;
	/**
	 * ...
	 * @author Lambwatt
	 */
	public class SkyDrawer extends Entity
	{
		
		public function SkyDrawer() 
		{
			super(0, 0);
		}
		
		public function set_graphic(list:Graphiclist)
		{
			graphic = list;
		}
	}

}
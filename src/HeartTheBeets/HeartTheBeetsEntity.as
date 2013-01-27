package HeartTheBeets 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Graphiclist;
	/**
	 * ...
	 * @author Lambwatt
	 */
	public class HeartTheBeetsEntity extends Entity
	{
		private var graphic_list:Graphiclist = new Graphiclist();
		
		public function HeartTheBeetsEntity(x:int, y:int) 
		{
			super(x, y);
		}
		
		public function get_graphic_list():Graphiclist
		{
			return graphic_list;
		}
		
	}

}
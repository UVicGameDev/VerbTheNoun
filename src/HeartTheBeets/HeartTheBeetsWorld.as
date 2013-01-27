package HeartTheBeets 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.World;
	//import mx.utils;
	/**
	 * ...
	 * @author Lambwatt
	 */
	public class HeartTheBeetsWorld extends World
	{
		//private var object_list:LinkedList = new LinkedList;
		private var cloud_list:Array = new Array();
		private var rain_list:Array = new Array();
		private var permanent_list:Array = new Array();
		private var render_list:Graphiclist = new Graphiclist();
		
		public function HeartTheBeetsWorld() 
		{
			//create stuff
			add(new Ground(240));
			add(new Player(0,180));
		}
		
		override public function update():void 
		{
			render_list.removeAll();
			super.update();
			for (var i:int = 0; i<permanent_list.length; i++)
			{
				render_list.add(((HeartTheBeetsEntity)(permanent_list[i])).get_graphic_list());
			}
			/*for (var i:int = 0; i<permanent_list.length; i++)
			{
				render_list.add(((HeartTheBeetsEntity)(permanent_list[i])).get_image_list());
			}
			for (var i:int = 0; i<permanent_list.length; i++)
			{
				render_list.add(((HeartTheBeetsEntity)(permanent_list[i])).get_image_list());
			}*/
		} 
		
		override public function add(e:Entity):Entity 
		{
			permanent_list.push(e);
			return super.add(e);
		}
	}

}
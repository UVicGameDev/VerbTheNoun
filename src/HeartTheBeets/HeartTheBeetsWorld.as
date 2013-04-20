package HeartTheBeets 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	//import mx.utils;
	/**
	 * ...
	 * @author Lambwatt
	 */
	public class HeartTheBeetsWorld extends World
	{
		
		
		//private var object_list:LinkedList = new LinkedList;
		public var cloud_list:Array = new Array();
		public var rain_list:Array = new Array();
		private var permanent_list:Array = new Array();
		private var render_list:Graphiclist = new Graphiclist();
		public var beet_list:Array = new Array();
		public var points:int = 0;
		public var net_happiness:int = 0;
		public var drawer:SkyDrawer = new SkyDrawer();
		public var playing:Boolean = false;
		
		public function HeartTheBeetsWorld() 
		{
			FP.screen.color = 0x7070FF;
			add(new Ground(240));
			//add(new HTB_menu(false));
			//create stuff
			/*
			add(new Player(300, 170));
			add(new Beet(10, 210));
			add(new Beet(110, 210));
			add(new Beet(210, 210));
			add(new Beet(310, 210));
			add(new Beet(410, 210));
			add(new Beet(510, 210));
			add(new Sun());
			//add(new Beet(300, 210));
			
			add(drawer);*/
			//reset_game();
			
			
		}
		
		public function reset_game():void
		{
			removeList(permanent_list);
			
			add(new Player(300, 170));
			add(new Beet(10, 210));
			add(new Beet(110, 210));
			add(new Beet(210, 210));
			add(new Beet(310, 210));
			add(new Beet(410, 210));
			add(new Beet(510, 210));
			add(new Sun());
			add(drawer);
			
			playing = false;
		}
		
		override public function update():void 
		{
			super.update();
			if (playing)
			{
				
			
				if ((Math.random() * 1000.0) > 985)
				{
					add(new Cloud());
				}
				render_list.removeAll();
				/*for (var i:int = 0; i<permanent_list.length; i++)
				{
					render_list.add(((HeartTheBeetsEntity)(permanent_list[i])).get_graphic_list());
				}*/
				//graphic = render_list;
				for (var i:int = 0; i<rain_list.length; i++)
				{
					render_list.add(((HeartTheBeetsEntity)(rain_list[i])).get_graphic_list());
				}
				for (i = 0; i<cloud_list.length; i++)
				{
					render_list.add(((HeartTheBeetsEntity)(cloud_list[i])).get_graphic_list());
				}
				drawer.set_graphic(render_list);
			}else
			{
				//add(new HTB_menu(false));
				reset_game();
				playing = true;
			}
		} 
		
		override public function add(e:Entity):Entity 
		{
			if (e is Cloud)
			{
				cloud_list.push(e);
			}
			else if (e is Raindrop)
			{
				rain_list.push(e);
			}
			else if (e is Beet)
			{
				beet_list.push(e);
			}
			else if(e is Ground){}
			else 
			{
				permanent_list.push(e);
			}
			return super.add(e);
		}
		
		public function end_game():void
		{
			
			net_happiness = 0;
			for (var i:int = 0; i<beet_list.length; i++)
			{
				net_happiness += (beet_list[i] as Beet).happiness;//render_list.add(((HeartTheBeetsEntity)(cloud_list[i])).get_graphic_list());
			}
			//drawer.set_graphic(render_list);
			
			removeList(cloud_list);
			removeList(rain_list);
			removeList(beet_list);
			removeList(permanent_list);
			
			add(new HTB_menu(true));
		}
	}

}
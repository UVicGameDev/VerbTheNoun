package HeartTheBeets 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author Lambwatt
	 */
	public class Raindrop extends HeartTheBeetsEntity
	{
		
		[Embed(source = 'HTB_assets/RainDrop.png')] private const RAIN:Class;
		
		//private var graphic_list:Graphiclist = new Graphiclist(new Image(RAIN));
		private var image:Image = new Image(RAIN);
		private var gravity:int = 4;
		private var target:Beet = null;
		
		public function Raindrop(x:int, y:int) 
		{
			super(x, y);
			setHitbox(16, 16);
		}
	
		public override function update():void
		{
			//super();
			y+=4
			target = (collide("Beet", x, y)) as Beet;
			if (target)
			{
				target.get_rained_on();
				die();
			}
			else if (y>280)
			{
				die();
			}
		}
		
		public override function get_graphic_list():Graphiclist
		{
			image.x = x;
			image.y = y;
			return new Graphiclist(image);
		}
		
		private function die()
		{
			var index:int = (FP.world as HeartTheBeetsWorld).rain_list.indexOf(this);
			(FP.world as HeartTheBeetsWorld).rain_list.splice(index, 1);
			FP.world.remove(this);
		}
	}

}
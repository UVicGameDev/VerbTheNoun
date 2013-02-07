package HeartTheBeets 
{
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Graphiclist;
	/**
	 * ...
	 * @author Lambwatt
	 */
	public class Cloud extends HeartTheBeetsEntity
	{
		
		[Embed(source = 'HTB_assets/Cloud.png')] private const CLOUD:Class;
		
		private var image:Image = new Image(CLOUD);
		private var drift_speed:Number;
		private var drop_sample_range:Number;
		private var success_range:Number;
		private var delay:int;
		
		public function Cloud() 
		{
			super( -80, -60);
			var start_y = Math.random() * 90;
			if (Math.random() * 100 > 50)
			{
				x = -90; 
				y = start_y;
				drift_speed = 3 * Math.random();
				drift_speed *= 1;
			}
			else
			{
				x = 630;
				y = start_y;
				drift_speed = 3 * Math.random();
				drift_speed *= -1;
			}
			
			drop_sample_range = (50 * Math.random())+350;
			success_range = 10 * Math.random();
		}
		
		public override function update():void
		{
			x += drift_speed;
			if (Math.random() * drop_sample_range < success_range)
			{
				drop_rain();
			}
			
			if (x<-100 || x>650)
			{
				die();
			}
		}
		
		private function die()
		{
			var index:int = (FP.world as HeartTheBeetsWorld).cloud_list.indexOf(this);
			(FP.world as HeartTheBeetsWorld).cloud_list.splice(index, 1);
			FP.world.remove(this);
		}
		
		private function drop_rain():void
		{
			FP.world.add(new Raindrop(x + 40, y + 32));
		}
		
		public override function get_graphic_list():Graphiclist
		{
			image.x = x;
			image.y = y;
			return new Graphiclist(image);
		}
	}

}
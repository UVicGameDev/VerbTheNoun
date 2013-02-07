package HeartTheBeets 
{
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author Lambwatt
	 */
	public class Sun extends HeartTheBeetsEntity
	{
		[Embed(source = 'HTB_assets/Sun.png')] private const SUN:Class;
		public var sun_steps:int = 3;
		
		public function Sun() 
		{
			super( -20, 0);
			graphic = new Image(SUN);
		}
	
		public override function update():void
		{
			sun_steps--;
			if (sun_steps <= 0)
			{
				x += 1;
				sun_steps = 3;
			}
			if (x >= 590)
			{
				(FP.world as HeartTheBeetsWorld).end_game();
			}
		}
	}

}
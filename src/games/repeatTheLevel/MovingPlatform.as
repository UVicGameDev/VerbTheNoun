package games.repeatTheLevel 
{
	import games.repeatTheLevel.common.Assets;
	import missTheMissile.entities.Player;
	/**
	 * ...
	 * @author Lambwatt
	 */
	public class MovingPlatform extends Solid 
	{
		private var rider:Player;
		
		private var startX:int = 0;
		private var endX:int = 0;
		
		private var max_speed:int = 0;
		
		private var accel:Number = 0;
		private var vel:Number = 0;
		
		private var dir:int = 1;
		private var time:int = 0;
		
		public function MovingPlatform(x, y, end_x) 
		{
			var picture:Image = new Image(Assets.IMG_PLATFORM);
			super (x, y, picture, 0, 0, picture.width,picture.height,"solid");		
			layer = 0;
		}
		
		public override function update()
		{
			
			
			for (var i:int; i < Math.abs(vel); i++ )
			{
				x += dir;
				rider.x += dir;
			}
		}
		
	}

}
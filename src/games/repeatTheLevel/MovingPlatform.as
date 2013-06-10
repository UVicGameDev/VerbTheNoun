package games.repeatTheLevel 
{
	import games.repeatTheLevel.common.Assets;
	import games.repeatTheLevel.Player;
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author Lambwatt
	 */
	public class MovingPlatform extends Solid 
	{
		private var rider:Player;
		
		private var startX:int = 0;
		private var endX:int = 0;
		/*private var halfX:int = 0;
		
		private var max_speed:int = 0;
		
		private var accel:Number = 0;*/
		private var vel:Number = 4;
		
		private var dir:int = 1;
		/*private var time:int = 0;
		private var totalTime:int = 0;*/
		
		public function MovingPlatform(x:int, y:int, end_x:int) 
		{
			var picture:Image = new Image(Assets.IMG_PLATFORM);
			super (x, y, picture, 0, 0, picture.width, picture.height, "solid");
			startX = x;
			endX = end_x;
			layer = 0;
		}
		
		public override function update():void
		{ 	
			for (var i:int; i < Math.abs(vel); i++ )
			{
				x += dir;
				var player:Player = collide("player", x, y) as Player;
				if (player)
				{
					(player as Player).push(dir);
				}
				
				if (rider != null)
				{
					rider.push(dir);
				}
				
				if (x == endX)
				{
					turn();
					break;
				}
			}
		}
		
		
		private function turn():void
		{
			var tmp:int = startX;
			startX = endX;
			endX = tmp;
			
			dir *= -1;
		}
		
		public function mount(dude:Player):void
		{
			rider = dude;
		}
		
		public function dismount():void
		{
			rider = null;
		}
		
		public function applyOffset(offset:int):void
		{
			startX -= offset;
			endX -= offset;
		}
	}

}
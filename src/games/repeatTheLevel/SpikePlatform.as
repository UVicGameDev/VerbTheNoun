package games.repeatTheLevel 
{
	import games.repeatTheLevel.common.Assets;
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author Lambwatt
	 */
	public class SpikePlatform extends Solid 
	{
		private var startX:int = 0;
		private var endX:int = 0;

		private var vel:Number = 4;
		
		private var dir:int = 1;
		
		public function SpikePlatform(x:int, y:int, end_x:int) 
		{
			var picture:Image = new Image(Assets.IMG_SPIKEPLATFORM);
			super (x, y, picture, 0, 0, picture.width, picture.height, "threat");
			startX = x;
			endX = end_x;
			layer = 0;
		}
		
		
		public override function update():void
		{ 	
			for (var i:int; i < Math.abs(vel); i++ )
			{
				x += dir;

				if (x == endX)
				{
					turn();
					break;
				}
			}
			//trace("spiked platform at " + x +"looking for endX of "+endX);
		}
		
		private function turn():void
		{
			var tmp:int = startX;
			startX = endX;
			endX = tmp;
			
			dir *= -1;
		}
		
		public function applyOffset(offset:int):void
		{
			startX -= offset;
			endX -= offset;
		}
	}

}
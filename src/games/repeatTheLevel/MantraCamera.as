package games.repeatTheLevel
{
	import flash.geom.Point;
	import net.flashpunk.Entity;
	import net.flashpunk.Screen;
	import net.flashpunk.FP;
	import games.repeatTheLevel.Player;
	/**
	 * ...
	 * @author Lambwatt
	 */
	public class MantraCamera 
	{
		private var target:Player;
		private var min_x:int;
		private var max_x:int;
		
		public function MantraCamera(p:Player) 
		{
			target = p;
			min_x = 0;
		}
		
		public function update(max_x:int, camera:Point):void
		{
			var dir:int = target.dir;
			//trace(dir);
			if (target.x > 400 && target.x < 1000)
			{
				if (dir > 0)
				{
					if (camera.x < max_x)
					{
						if (camera.x  + dir < max_x)
							camera.x += dir;
						else
							camera.x  = max_x;
					}
				}
				else if (dir < 0)
				{
					if (camera.x  > min_x)
					{
						if (camera.x  + dir > min_x)
							camera.x  += dir;
						else
							camera.x  = min_x;
					}
				}
			}
		}
	}

}
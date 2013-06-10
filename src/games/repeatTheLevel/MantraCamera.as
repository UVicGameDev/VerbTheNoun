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
		private var verticalFollow:Boolean = false;
		
		public function MantraCamera(p:Player) 
		{
			target = p;
			min_x = 0;
		}
		
		public function update(max_x:int, camera:Point):void
		{
			//horizontal movement
			var h_dir:int = target.h_dir;
			if (target.x > 400 && target.x < max_x+400)
			{
				if (h_dir > 0)
				{
					if (camera.x < max_x)
					{
						if (camera.x  + h_dir < max_x)
							camera.x += h_dir;
						else
							camera.x  = max_x;
					}
				}
				else if (h_dir < 0)
				{
					if (camera.x  > min_x)
					{
						if (camera.x  + h_dir > min_x)
							camera.x  += h_dir;
						else
							camera.x  = min_x;
					}
				}
			}
			
			//vertical movement
			var v_dir:int = target.v_dir;
			if (target.x < 600)
			{
				verticalFollow = true;
			}
			if (verticalFollow)
			{
				if (camera.y < 0)
					camera.y  += target.v_dir;
				else
					camera.y  = 0;
			}
			
			target.h_dir = 0;
			target.v_dir = 0;
		}
	}

}
package games.missTheMissile.arena 
{
	import core.Random;
	import flash.geom.Point;
	/**
	 * ...
	 * @author beyamor
	 */
	public class BoundaryPositioner 
	{
		private var	arena:Arena,
					bounds:Number;
		
		public function BoundaryPositioner(arena:Arena, bounds:Number)
		{
			this.arena	= arena;
			this.bounds	= bounds;
		}
		
		public function getNextPosition():Point {
			
			var x:Number, y:Number;
			
			switch (Random.any(["left", "right", "top", "bottom"])) {
				
				case "left":
					x = -bounds;
					y = Random.inRange(0, arena.height);
					break;
					
				case "right":
					x = arena.width + bounds;
					y = Random.inRange(0, arena.height);
					break;
					
				case "top":
					x = Random.inRange(0, arena.width);
					y = -bounds;
					break;
					
				case "bottom":
					x = Random.inRange(0, arena.width);
					y = arena.height + bounds;
					break;
			}
			
			return new Point(x, y);
		}
	}

}
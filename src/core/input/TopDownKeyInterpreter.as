package core.input 
{
	import core.Keys;
	import core.util.Updateable;
	import net.flashpunk.utils.Input;
	/**
	 * This interpreter interprets keyboard input as the player's intention to move in a top-down plane.
	 * @author beyamor
	 */
	public class TopDownKeyInterpreter implements Updateable
	{
		private var	x:Number			= 0,
					y:Number			= 0,
					triedToMove:Boolean	= false;
		
		/**
		 * The distance the player tried to move along the x axis in the last update, [-1, 1].
		 */
		public function get	dx():Number { return x; }
		
		/**
		 * The distance the player tried to move along the y axis in the last update, [-1, 1].
		 */
		public function get dy():Number { return y; }
		
		/**
		 * Whether the player tried to move during the last update.
		 */
		public function get tryingToMove():Boolean { return triedToMove; }
		
		public function TopDownKeyInterpreter() 
		{
			
		}
		
		public function update():void {
			
			x			= 0;
			y			= 0;
			triedToMove	= false;
			
			if (Input.check(Keys.LEFT))		{ x -= 1; triedToMove = true; }
			if (Input.check(Keys.RIGHT))	{ x += 1; triedToMove = true; }
			if (Input.check(Keys.UP))		{ y -= 1; triedToMove = true; }
			if (Input.check(Keys.DOWN))		{ y += 1; triedToMove = true; }
			
			if (x != 0 && y != 0) {
				
				x *= Math.SQRT1_2;
				y *= Math.SQRT1_2;
			}
		}
	}

}
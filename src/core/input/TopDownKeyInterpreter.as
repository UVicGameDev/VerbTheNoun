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
		private var	_dx:Number				= 0,
					_dy:Number				= 0,
					_tryingToMove:Boolean	= false,
					_direction:Number		= 0;
		
		/**
		 * The distance the player tried to move along the x axis in the last update, [-1, 1].
		 */
		public function get	dx():Number { return _dx; }
		
		/**
		 * The distance the player tried to move along the y axis in the last update, [-1, 1].
		 */
		public function get dy():Number { return _dy; }
		
		/**
		 * Whether the player tried to move during the last update.
		 */
		public function get tryingToMove():Boolean { return _tryingToMove; }
		
		/**
		 * The interpreted direction of the player's last move attempt.
		 */
		public function get direction():Number { return _direction; }
		
		public function TopDownKeyInterpreter() 
		{
			
		}
		
		public function update():void {
			
			_dx			= 0;
			_dy			= 0;
			_tryingToMove	= false;			
			
			if (Input.check(Keys.LEFT))		{ _dx -= 1; _tryingToMove = true; }
			if (Input.check(Keys.RIGHT))	{ _dx += 1; _tryingToMove = true; }
			if (Input.check(Keys.UP))		{ _dy -= 1; _tryingToMove = true; }
			if (Input.check(Keys.DOWN))		{ _dy += 1; _tryingToMove = true; }
			
			if (_dx != 0 && _dy != 0) {
				
				_dx *= Math.SQRT1_2;
				_dy *= Math.SQRT1_2;
			}
			
			_direction = Math.atan2(dy, dx);
		}
	}

}
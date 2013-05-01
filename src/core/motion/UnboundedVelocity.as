package core.motion 
{
	/**
	 * In contrast to bounded velocity, unbounded velocity has no maximum speed.
	 * @author beyamor
	 */
	public class UnboundedVelocity extends Velocity
	{
		
		public function UnboundedVelocity(speed:Number = 0, direction:Number = 0)
		{
			_direction	= direction;
			_x			= Math.cos(direction) * speed;
			_y			= Math.sin(direction) * speed;
		}
		
		override public function get speed():Number {
			
			return Math.sqrt(_x * _x + _y * _y);
		}
		
		override public function set speed(newSpeed:Number):void {
			
			var currentDirection:Number = direction;
			
			_x = Math.cos(currentDirection) * newSpeed;
			_y = Math.sin(currentDirection) * newSpeed;
		}
		
		override public function get direction():Number {
			
			// Use cached direction if speed is 0
			if (_x != 0 || _y != 0) {
				
				_direction = Math.atan2(_y, _x);
			}
			
			return _direction;
		}
		
		override public function set direction(newDirection:Number):void {
			
			_direction	= newDirection;
			
			var currentSpeed:Number = speed;
			
			_x = Math.cos(newDirection) * currentSpeed;
			_y = Math.sin(newDirection) * currentSpeed;
		}
		
		override public function get x():Number {
			
			return _x;
		}
		
		override public function set x(newX:Number):void {
			
			_x = newX;
		}
		
		override public function get y():Number {
			
			return _y;
		}
		
		override public function set y(newY:Number):void {
			
			_y = newY;
		}
		
		private var	_x:Number,
					_y:Number,
					_direction:Number;
	}

}
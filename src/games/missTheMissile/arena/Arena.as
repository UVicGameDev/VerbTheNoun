package games.missTheMissile.arena 
{
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author beyamor
	 */
	public class Arena 
	{
		private var	_width:Number,
					_height:Number,
					_bounds:Rectangle;
					
		public function get width():Number { return _width; }
		public function get height():Number { return _height; }
		
		public function Arena(width:Number, height:Number)
		{
			_width	= width;
			_height	= height;
			_bounds = new Rectangle(0, 0, width, height);
		}
		
		public function get bounds():Rectangle {
			
			return _bounds;
		}
	}

}
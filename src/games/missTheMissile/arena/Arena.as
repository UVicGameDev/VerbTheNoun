package games.missTheMissile.arena 
{
	/**
	 * ...
	 * @author beyamor
	 */
	public class Arena 
	{
		private var	_width:Number,
					_height:Number;
					
		public function get width():Number { return _width; }
		public function get height():Number { return _height; }
		
		public function Arena(width:Number, height:Number)
		{
			_width	= width;
			_height	= height;
		}
		
	}

}
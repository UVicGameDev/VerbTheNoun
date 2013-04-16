package core 
{
	/**
	 * ...
	 * @author beyamor
	 */
	public class Random 
	{
		public static function inRange(min:Number, max:Number):Number {
			
			return min + Math.random() * (max - min);
		}
	}

}
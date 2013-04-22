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
		
		public static function intInRange(min:int, max:int):int {
			
			return min + Math.floor(Math.random() * (max - min));
		}
		
		public static function any(coll:*):* {
			
			if (coll.length == 0) return null;
			
			var index:uint = Math.floor(Math.random() * coll.length);
			return coll[index];
		}
		
		public static function trueOrFalse():Boolean {
			
			return (Math.random() < 0.5);
		}
		
		public static function get angle():Number {
			
			return inRange(0, Math.PI * 2);
		}
		
		public static function choose(... options):* {
			
			return any(options);
		}
	}

}
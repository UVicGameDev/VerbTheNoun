package core 
{
	/**
	 * Helper functions for randomness.
	 * @author beyamor
	 */
	public class Random 
	{
		/**
		 * Returns a number in the range [min, max).
		 */
		public static function inRange(min:Number, max:Number):Number {
			
			return min + Math.random() * (max - min);
		}
		
		/**
		 * Returns an int in the range [min, max).
		 */
		public static function intInRange(min:int, max:int):int {
			
			return min + Math.floor(Math.random() * (max - min));
		}
		
		/**
		 * Returns a random element of the collection (vector or array).
		 */
		public static function any(coll:*):* {
			
			if (coll.length == 0) return null;
			
			var index:uint = Math.floor(Math.random() * coll.length);
			return coll[index];
		}
		
		/**
		 * Returns one of true or false.
		 */
		public static function trueOrFalse():Boolean {
			
			return (Math.random() < 0.5);
		}
		
		/**
		 * Returns an angle, in radians, between 0 and Tau (two Pi).
		 */
		public static function get angle():Number {
			
			return inRange(0, Math.PI * 2);
		}
		
		/**
		 * Returns one of the supplied arguments.
		 * Note, this takes a variadic list of options.
		 * Call is like so:
		 * 		Random.choose(thing1, thing2, thing3)
		 */
		public static function choose(... options):* {
			
			return any(options);
		}
	}

}
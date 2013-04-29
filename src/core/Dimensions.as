package core 
{
	/**
	 * Dunno, dude. I'm just sick of dividing crap by two.
	 * 
	 * I've been thinking about this a bit and I think the best solution might be to create
	 * an actual Dimensions object with x/y/width/height/top/bottom/left/right, rather than
	 * re-coding that sort of logic all over the place.
	 * 
	 * However, there's tradeoffs - for example, not everything has an x/y, right? So, it's cluttered.
	 * And not every Dimension is writeable.
	 * Still, it's something to think about.
	 * 
	 * For the time being though, this class provides these dimension functions.
	 * 
	 * @author beyamor
	 */
	public class Dimensions 
	{
		/**
		 * Get something's width, defaulting to 0.
		 */
		public static function width(thing:*):Number {
			
			return thing.hasOwnProperty('width')? thing.width : 0;
		}
		
		/**
		 * Get something's half width, defaulting to 0.
		 */
		public static function halfWidth(thing:*):Number {
			
			return width(thing) / 2;
		}
		
		/**
		 * Get something's height, defaulting to 0.
		 */
		public static function height(thing:*):Number {
			
			return thing.hasOwnProperty('height')? thing.height : 0;
		}
		
		/**
		 * Get something's half height, defaulting to 0.
		 */
		public static function halfHeight(thing:*):Number {
			
			return height(thing) / 2;
		}
	}

}
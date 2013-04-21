package core 
{
	/**
	 * Dunno, dude. I'm just sick of dividing crap by two.
	 * @author beyamor
	 */
	public class Dimensions 
	{
		public static function width(thing:*):Number {
			
			return thing.hasOwnProperty('width')? thing.width : 0;
		}
		
		public static function halfWidth(thing:*):Number {
			
			return width(thing) / 2;
		}
		
		public static function height(thing:*):Number {
			
			return thing.hasOwnProperty('height')? thing.height : 0;
		}
		
		public static function halfHeight(thing:*):Number {
			
			return height(thing) / 2;
		}
	}

}
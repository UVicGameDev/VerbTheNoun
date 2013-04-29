package core 
{
	/**
	 * Top-level debug configuration stuff.
	 * Where possible, check to make sure core.Debug.isEnabled is true when adding debug stuff.
	 * We should be able to turn off core.Debug.isEnabled and have a production-ready game.
	 * @author beyamor
	 */
	public class Debug 
	{
		/**
		 * Whether core debugging is enabled.
		 */
		public static const isEnabled:Boolean = true;
		
		/**
		 * Whether player invincibility is enabled (i.e., the game cannot be lost)
		 */
		public static function get invincibilityEnabled():Boolean { return isEnabled && false; }
	}

}
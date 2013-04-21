package core 
{
	/**
	 * ...
	 * @author beyamor
	 */
	public class Debug 
	{
		public static const isEnabled:Boolean = true;
		
		public static function get invincibilityEnabled():Boolean { return isEnabled && false; }
	}

}
package games.dialThePhone.entities.keys 
{
	/**
	 * ...
	 * @author beyamor
	 */
	public class NumericKey extends Key 
	{
		[Embed(source = '/games/dialThePhone/assets/numeric-key.png')]
		private static const KEY:Class;
		
		public function NumericKey(label:String, x:Number, y:Number) 
		{
			super(label, KEY, x, y);
			
			width	= 48;
			height	= 48;
		}
		
	}

}
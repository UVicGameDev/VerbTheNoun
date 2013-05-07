package games.dialThePhone.entities.keys 
{
	import core.Debug;
	import games.dialThePhone.entities.InputDisplay;
	import games.dialThePhone.graphics.NumericKeySprite;
	import games.dialThePhone.numbers.Entry;
	/**
	 * ...
	 * @author beyamor
	 */
	public class NumericKey extends Key 
	{	
		private var digit:uint,
					entry:Entry;
		
		public function NumericKey(digit:uint, x:Number, y:Number, entry:Entry) 
		{
			this.digit 	= digit;
			this.entry	= entry;;
			
			super(x, y, new NumericKeySprite(digit));
			
			width	= 48;
			height	= 48;
		}
		
		override public function press():void 
		{
			super.press();
			
			entry.addDigit(digit);
			
			Debug.log("Pressed number: " + digit);
		}
	}

}
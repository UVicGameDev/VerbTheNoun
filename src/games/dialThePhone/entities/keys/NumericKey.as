package games.dialThePhone.entities.keys 
{
	import core.Debug;
	import games.dialThePhone.entities.InputDisplay;
	import games.dialThePhone.graphics.NumericKeySprite;
	/**
	 * ...
	 * @author beyamor
	 */
	public class NumericKey extends Key 
	{	
		private var digit:uint,
					inputDisplay:InputDisplay;
		
		public function NumericKey(digit:uint, x:Number, y:Number, inputDisplay:InputDisplay) 
		{
			this.digit 			= digit;
			this.inputDisplay	= inputDisplay;
			
			super(x, y, new NumericKeySprite(digit));
			
			width	= 48;
			height	= 48;
		}
		
		override public function press():void 
		{
			super.press();
			
			inputDisplay.addDigit(digit);
			
			Debug.log("Pressed number: " + digit);
		}
	}

}
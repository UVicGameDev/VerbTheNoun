package games.dialThePhone.entities 
{
	import core.Debug;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class InputDisplay extends Entity 
	{
		private static const MAX_NUMBER_OF_DIGITS:uint = 13;
		
		private var	digits:Vector.<uint> = new Vector.<uint>,
					display:Text;
		
		public function InputDisplay(x:Number, y:Number)
		{
			display = new Text("", 0, 0, { size: 32 } );
			super(x, y, display);
		}
		
		public function addDigit(digit:uint):void {
			
			if (digits.length >= MAX_NUMBER_OF_DIGITS) return;
			
			digits.push(digit);
			updateDisplay();
		}
		
		private function updateDisplay():void {
			
			var	i:uint			= 0,
				areaCode:String	= "",
				prefix:String	= "",
				rest:String		= "";
				
			for (i = 0; i < Math.min(3, digits.length); ++i) areaCode += digits[i];
			if (digits.length > 3) areaCode = "(" + areaCode + ") ";
			
			for (i = 3; i < Math.min(6, digits.length); ++i) prefix += digits[i];
			if (digits.length > 6) prefix += " - ";
			
			for (i = 6; i < digits.length; ++i) rest += digits[i];
			
			display.text = areaCode + prefix + rest;
			
			Debug.log("Input display: " + display.text);
		}
	}

}
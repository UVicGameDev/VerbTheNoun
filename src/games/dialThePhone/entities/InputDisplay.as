package games.dialThePhone.entities 
{
	import core.Debug;
	import games.dialThePhone.numbers.Entry;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class InputDisplay extends Entity 
	{		
		private var	display:Text,
					entry:Entry,
					lastKnownLength:uint;
		
		public function InputDisplay(x:Number, y:Number, entry:Entry)
		{
			this.entry		= entry;
			lastKnownLength	= entry.digits.length;
			
			display = new Text("", 0, 0, { size: 32 } );
			super(x, y, display);
		}
		
		override public function update():void 
		{
			super.update();
			
			var digits:Vector.<uint> = entry.digits;
			
			// Save us recaclulating the string every step
			if (digits.length != lastKnownLength) {
				
				lastKnownLength = digits.length;
				updateDisplay(digits);
			}
		}
		
		private function updateDisplay(digits:Vector.<uint>):void {
			
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
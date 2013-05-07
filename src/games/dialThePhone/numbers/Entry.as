package games.dialThePhone.numbers 
{
	/**
	 * ...
	 * @author beyamor
	 */
	public class Entry 
	{
		private static const MAX_NUMBER_OF_DIGITS:uint = 13;
		
		private var _digits:Vector.<uint> = new Vector.<uint>
		
		public function Entry() 
		{
			
		}
		
		public function addDigit(digit:uint):void {
			
			if (_digits.length >= MAX_NUMBER_OF_DIGITS) return;
			
			_digits.push(digit);
		}
		
		public function get digits():Vector.<uint> {
			
			return _digits.concat();
		}
	}

}
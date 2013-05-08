package games.dialThePhone.numbers 
{
	/**
	 * ...
	 * @author beyamor
	 */
	public class Validator 
	{
		private var	expectedNumber:NumberGenerator,
					enteredNumber:Entry;
		
		public function Validator(expectedNumber:NumberGenerator, enteredNumber:Entry) 
		{
			this.expectedNumber	= expectedNumber;
			this.enteredNumber	= enteredNumber;
		}
		
		public function score():uint {
			
			
		}
	}

}
package games.dialThePhone.states 
{
	import core.context.ELUState;
	import games.dialThePhone.DialThePhone;
	import games.dialThePhone.entities.finger.Finger;
	import games.dialThePhone.numbers.Entry;
	import games.dialThePhone.numbers.NumberGenerator;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class CheckState implements ELUState 
	{
		private var	expectedNumber:NumberGenerator,
					enteredNumber:Entry,
					finger:Finger,
					game:DialThePhone;
		
		public function CheckState(game:DialThePhone, finger:Finger, expectedNumber:NumberGenerator, enteredNumber:Entry) 
		{
			this.game			= game;
			this.finger			= finger;
			this.expectedNumber	= expectedNumber;
			this.enteredNumber	= enteredNumber;
		}
		
		/* INTERFACE core.context.ELUState */
		
		public function enter():void 
		{
			finger.disableTapping();
		}
		
		public function leave():void 
		{
			finger.enableTapping();
		}
		
		public function update():void 
		{
			
		}
		
	}

}
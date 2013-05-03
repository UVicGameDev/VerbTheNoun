package games.dialThePhone.entities.finger.states 
{
	import core.context.ELUState;
	import core.Keys;
	import games.dialThePhone.entities.finger.Finger;
	import net.flashpunk.utils.Input;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class MoveState implements ELUState 
	{
		private var finger:Finger;
		
		public function MoveState(finger:Finger) 
		{
			this.finger = finger;
		}
		
		/* INTERFACE games.dialThePhone.entities.finger.FingerState */
		
		public function enter():void 
		{
			finger.overHeight = 1;
		}
		
		public function leave():void 
		{
			
		}
		
		public function update():void 
		{
			if (finger.moveIntention.tryingToMove)	finger.accelerate();
			else									finger.applyFriction();
			
			if (Input.pressed(Keys.ACTION1)) finger.state.switchTo("tapDown");
		}
		
	}

}
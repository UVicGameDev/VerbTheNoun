package games.dialThePhone.entities.finger.states 
{
	import core.Keys;
	import games.dialThePhone.entities.finger.Finger;
	import games.dialThePhone.entities.finger.FingerState;
	import net.flashpunk.utils.Input;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class MoveState implements FingerState 
	{
		private var finger:Finger;
		
		public function MoveState(finger:Finger) 
		{
			this.finger = finger;
		}
		
		/* INTERFACE games.dialThePhone.entities.finger.FingerState */
		
		public function enter():void 
		{
			finger.sprite.fingerHeightPercent = 1;
		}
		
		public function leave():void 
		{
			
		}
		
		public function update():void 
		{
			finger.move();
			
			if (Input.pressed(Keys.ACTION1)) finger.switchTo(finger.tapDownState);
		}
		
	}

}
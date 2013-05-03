package games.dialThePhone.entities.finger.states 
{
	import core.context.ELUState;
	import core.util.Timer;
	import games.dialThePhone.entities.finger.Finger;
	import games.dialThePhone.entities.keys.Key;
	/**
	 * ...
	 * @author beyamor
	 */
	public class TappingState implements ELUState
	{
		private static const DURATION:Number = 0.05;
		
		private var finger:Finger,
					timer:Timer,
					pressedAKey:Boolean;
		
		public function TappingState(finger:Finger) 
		{
			this.finger = finger;
		}
		
		/* INTERFACE games.dialThePhone.entities.finger.FingerState */
		
		public function enter():void 
		{
			pressedAKey = false;
			
			timer = new Timer(DURATION);
			timer.addCallback(function():void {
				
				finger.state.switchTo("tapUp");
			});
			
			finger.sprite.fingerHeightPercent = 0;
		}
		
		public function leave():void 
		{
			
		}
		
		public function update():void 
		{
			finger.applyFriction();
			
			timer.update();
			
			if (!pressedAKey) checkForKeyPress();
		}
		
		private function checkForKeyPress():void {
			
			var	pressedKey:Key = finger.collide("key", finger.x, finger.y) as Key;
			
			if (!pressedKey) return;
			
			pressedAKey = true;
			pressedKey.press();
		}
	}

}
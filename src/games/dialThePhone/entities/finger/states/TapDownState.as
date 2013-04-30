package games.dialThePhone.entities.finger.states 
{
	import core.util.Timer;
	import games.dialThePhone.entities.finger.Finger;
	import games.dialThePhone.entities.finger.FingerState;
	import games.dialThePhone.graphics.FingerSprite;
	import net.flashpunk.utils.Ease;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class TapDownState implements FingerState 
	{
		private static const DURATION:Number = 0.1;
		
		private var	finger:Finger,
					sprite:FingerSprite,
					timer:Timer;
		
		public function TapDownState(finger:Finger)
		{
			this.finger	= finger;
			this.sprite	= finger.sprite;
		}
		
		/* INTERFACE games.dialThePhone.entities.finger.FingerState */
		
		public function enter():void 
		{
			finger.velocity.x = finger.velocity.y = 0;
			
			timer = new Timer(DURATION);
			timer.addCallback(function():void {
				
				finger.tryKeyPress();
				finger.switchTo(finger.tapUpState);
			});
		}
		
		public function leave():void 
		{
			
		}
		
		public function update():void 
		{
			timer.update();
			
			sprite.fingerHeightPercent = (1 - Ease.cubeOut(timer.percentElapsed));
		}
	}

}
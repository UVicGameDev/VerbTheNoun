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
	public class TapUpState implements FingerState 
	{
		private static const DURATION:Number = 0.1;
		
		private var	sprite:FingerSprite,
					finger:Finger,
					timer:Timer;
		
		public function TapUpState(finger:Finger) 
		{
			this.finger	= finger;
			this.sprite	= finger.sprite;
		}
		
		/* INTERFACE games.dialThePhone.entities.finger.FingerState */
		
		public function enter():void 
		{
			timer = new Timer(DURATION);
			timer.addCallback(function():void {
				
				finger.switchTo(finger.moveState);
			});
		}
		
		public function leave():void 
		{
			
		}
		
		public function update():void 
		{
			timer.update();
			
			sprite.fingerHeightPercent = Ease.cubeOut(timer.percentElapsed);
		}
		
	}

}
package games.dialThePhone.entities.finger.states 
{
	import core.context.ELUState;
	import core.util.Timer;
	import games.dialThePhone.entities.finger.Finger;
	import net.flashpunk.utils.Ease;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class TapDownState implements ELUState 
	{
		private static const DURATION:Number = 0.1;
		
		private var	finger:Finger,
					timer:Timer;
		
		public function TapDownState(finger:Finger)
		{
			this.finger	= finger;
		}
		
		/* INTERFACE games.dialThePhone.entities.finger.FingerState */
		
		public function enter():void 
		{
			timer = new Timer(DURATION);
			timer.addCallback(function():void {
				
				finger.state.switchTo("tapping");
			});
		}
		
		public function leave():void 
		{
			
		}
		
		public function update():void 
		{
			finger.applyFriction();
			
			timer.update();
			
			finger.overHeight = (1 - Ease.cubeOut(timer.percentElapsed));
		}
	}

}
package games.dialThePhone 
{
	import core.context.ELUStateMachine;
	import core.Debug;
	import core.Game;
	import core.GameConsts;
	import core.ui.View;
	import core.util.Timer;
	import flash.geom.Point;
	import games.dialThePhone.entities.finger.Finger;
	import games.dialThePhone.entities.InputDisplay;
	import games.dialThePhone.entities.keys.Key;
	import games.dialThePhone.entities.keys.NumericKey;
	import games.dialThePhone.graphics.ClockSprite;
	import games.dialThePhone.states.DialState;
	import games.dialThePhone.util.ColorBounds;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class DialThePhone extends Game 
	{
		private var DURATION:Number = 30;
		
		[Embed(source = '/games/dialThePhone/assets/phone-background.png')]
		private static const PHONE_BACKDROP:Class;
		
		private var	_state:ELUStateMachine,
					phoneView:View,
					timeLimit:Timer;
		
		public function DialThePhone() 
		{
			FP.screen.color = 0xd6ae76;
			
			if (Debug.isEnabled) addGraphic(new Text("Dial the Phone"));
			
			_state = new ELUStateMachine(
				"dial", {
				dial:	new DialState(this)
			});
			updateables.add(_state);
			
			var phoneBackdrop:Image = new Image(PHONE_BACKDROP);
			
			phoneView = new View(phoneBackdrop.width, phoneBackdrop.height);
			updateables.add(phoneView.updater);
	
			phoneView.addGraphic(phoneBackdrop, 100);
			
			var inputDisplay:InputDisplay = new InputDisplay(65, 25);
			phoneView.add(inputDisplay);
			
			phoneView.add(new Finger(745, 95, new ColorBounds(0xB0B9C6, PHONE_BACKDROP)));
			
			//
			//	Number keys. Positioned pretty arbitrarily, so I'm not going to worry about making it clean.
			//
			phoneView.add(new NumericKey(0, GameConsts.HALF_WIDTH, 170 + 150, inputDisplay));
			for (var digit:int = 1; digit <= 9; ++digit) {
			
				var	dx:Number	= -1 + ((digit-1) % 3),
					dy:Number	= -1 + (Math.floor((digit-1) / 3) % 3);
					
				phoneView.add(
					new NumericKey(
						digit,
						GameConsts.HALF_WIDTH + dx * 150,
						170 + dy * 75,
						inputDisplay
				));
			}
			
			timeLimit = new Timer(DURATION);
			updateables.add(timeLimit);
			
			addGraphic(new ClockSprite(timeLimit), 0, GameConsts.WIDTH - 70, 10);
		}
		
		override public function render():void 
		{
			super.render();
			phoneView.renderTo(FP.buffer, new Point(0, GameConsts.HEIGHT - phoneView.height));
		}
	}

}
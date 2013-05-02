package games.dialThePhone 
{
	import core.context.ELUStateMachine;
	import core.Debug;
	import core.Game;
	import core.GameConsts;
	import core.ui.View;
	import flash.geom.Point;
	import games.dialThePhone.entities.finger.Finger;
	import games.dialThePhone.entities.InputDisplay;
	import games.dialThePhone.entities.keys.Key;
	import games.dialThePhone.entities.keys.NumericKey;
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
		[Embed(source = '/games/dialThePhone/assets/phone-background.png')]
		private static const PHONE_BACKDROP:Class;
		
		private var	_state:ELUStateMachine,
					phoneView:View;
		
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
			phoneView.add(new NumericKey(0, GameConsts.HALF_WIDTH, GameConsts.HALF_HEIGHT, inputDisplay));
		}
		
		override public function render():void 
		{
			super.render();
			phoneView.renderTo(FP.buffer, new Point(0, GameConsts.HEIGHT - phoneView.height));
		}
	}

}
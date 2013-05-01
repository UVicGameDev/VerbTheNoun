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
	import net.flashpunk.graphics.Backdrop;
	import net.flashpunk.graphics.Text;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class DialThePhone extends Game 
	{
		[Embed(source = '/games/dialThePhone/assets/background.png')]
		private static const BACKDROP:Class;
		
		private var	_state:ELUStateMachine;
		
		public function DialThePhone() 
		{
			if (Debug.isEnabled) addGraphic(new Text("Dial the Phone"));
			
			addGraphic(new Backdrop(BACKDROP), 100);
			
			_state = new ELUStateMachine(
				"dial", {
				dial:	new DialState(this)
			});
			updateables.add(_state);
			
			var inputDisplay:InputDisplay = new InputDisplay(65, 25);
			add(inputDisplay);
			
			add(new Finger(745, 95, new ColorBounds(0xB0B9C6, BACKDROP)));			
			add(new NumericKey(0, GameConsts.HALF_WIDTH, GameConsts.HALF_HEIGHT, inputDisplay));
		}
	}

}
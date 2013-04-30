package games.dialThePhone 
{
	import core.Debug;
	import core.Game;
	import core.GameConsts;
	import core.ui.View;
	import flash.geom.Point;
	import games.dialThePhone.states.DialState;
	import games.dialThePhone.states.GameState;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class DialThePhone extends Game 
	{
		private var	_phoneView:View,
					_guyView:View,
					_currentState:GameState;
					
		public function get phoneView():View { return _phoneView; }
		public function get guyView():View { return _guyView; }
		
		public function DialThePhone() 
		{
			if (Debug.isEnabled) addGraphic(new Text("Dial the Phone"));
			
			_phoneView				= new View(GameConsts.WIDTH, GameConsts.HALF_HEIGHT);
			phoneView.clearColor	= 0xFF23182E;
			
			_guyView				= new View(GameConsts.WIDTH, GameConsts.HALF_HEIGHT);
			guyView.clearColor		= 0xFF96DEF2;
			
			_currentState			= new DialState(this);
		}
		
		override public function update():void 
		{
			super.update();
			
			_currentState.update();
		}
		
		override public function render():void 
		{
			_phoneView.renderTo(FP.buffer);
			_guyView.renderTo(FP.buffer, new Point(0, GameConsts.HALF_HEIGHT));
			
			super.render();
		}
	}

}
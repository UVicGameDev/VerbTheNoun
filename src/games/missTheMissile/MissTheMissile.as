package games.missTheMissile 
{
	import core.Debug;
	import core.Game;
	import games.missTheMissile.states.GameState;
	import games.missTheMissile.states.PlayState;
	import games.missTheMissile.windows.GameOverScreen;
	import games.missTheMissile.windows.MissTheMissilePopup;
	import games.missTheMissile.windows.PauseMenu;
	import games.missTheMissile.windows.PlayWindow;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class MissTheMissile extends Game 
	{
		private var gameOverShown:Boolean	= false,
					_data:GameData			= new GameData,
					_state:GameState;
					
		public function get data():GameData { return _data; }
		
		public function get state():GameState { return _state; }
		public function set state(newState:GameState):void {
			
			if (_state) _state.end();
			_state = newState;
			_state.begin();
		}
		
		public function MissTheMissile() 
		{
			if (Debug.isEnabled) addGraphic(new Text("Miss the Missile"));
			
			windows.push(
				new PlayWindow(_data)
			);
			
			state = new PlayState(this);
		}
		
		override public function update():void 
		{
			super.update();
			
			state.update();
		}
	}

}
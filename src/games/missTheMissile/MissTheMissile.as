package games.missTheMissile 
{
	import core.Debug;
	import core.Game;
	import core.util.Timer;
	import games.missTheMissile.arena.Arena;
	import games.missTheMissile.entities.Player;
	import games.missTheMissile.views.ViewSystem
	import games.missTheMissile.spawners.MisisleLauncher;
	import games.missTheMissile.states.GameState;
	import games.missTheMissile.states.PlayState;
	import games.missTheMissile.ui.ScoreDisplay;
	import games.missTheMissile.windows.GameOverScreen;
	import games.missTheMissile.windows.MissTheMissilePopup;
	import games.missTheMissile.windows.PauseMenu;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class MissTheMissile extends Game 
	{
		private var _data:GameData,
					_state:GameState,
					pendingNextState:GameState	= null,
					_viewSystem:ViewSystem;
					
		public function get data():GameData { return _data; }
		
		public function get state():GameState { return _state; }
		public function set state(newState:GameState):void {
			
			pendingNextState = newState;
		}
		
		public function get viewSystem():ViewSystem { return _viewSystem; }
		
		public function MissTheMissile() 
		{
			if (Debug.isEnabled) addGraphic(new Text("Miss the Missile"));
			
			_data = new GameData;			
			state = new PlayState(this);
			setUp();
		}
		
		private function setUp():void {
			
			// Arena
			var arena:Arena = new Arena(Consts.GAME_WIDTH * 2, Consts.GAME_HEIGHT * 2);
			
			// Player
			var player:Player = new Player(arena.width / 2, arena.height / 2, data, arena);
			data.player = player;
			
			// Views
			_viewSystem = new ViewSystem(arena, player);
			
			// Additional game things
			viewSystem.gameView.updateables.add(
				new MisisleLauncher(
					viewSystem.gameView, viewSystem.gameCamera,
					viewSystem.hudView, viewSystem.hudCamera,
					data, arena));
					
			viewSystem.gameView.add(player);
			viewSystem.hudView.add(new ScoreDisplay(Consts.GAME_WIDTH - 310, 10, data));
		}
		
		override public function update():void 
		{
			super.update();
			
			if (state) state.update();
			
			if (pendingNextState) {
				
				if (state) state.end();
				_state = pendingNextState;
				pendingNextState = null;
				state.begin();
			}
		}
		
		override public function render():void 
		{
			viewSystem.render();
			super.render();
		}
	}

}
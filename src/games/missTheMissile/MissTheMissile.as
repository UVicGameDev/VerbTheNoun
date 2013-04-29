package games.missTheMissile 
{
	import core.Debug;
	import core.Game;
	import core.util.Timer;
	import games.missTheMissile.arena.Arena;
	import games.missTheMissile.entities.Player;
	import games.missTheMissile.states.GameOverState;
	import games.missTheMissile.states.PausedState;
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
					state:GameState,
					pendingNextState:GameState	= null,
					_viewSystem:ViewSystem;
					
		public var	playState:PlayState,
					pausedState:PausedState,
					gameOverState:GameOverState;
		
		public function MissTheMissile() 
		{
			if (Debug.isEnabled) addGraphic(new Text("Miss the Missile"));
			
			_data = new GameData;			
			setUp();
			
			playState		= new PlayState(this);
			pausedState		= new PausedState(this);
			gameOverState	= new GameOverState(this);
			switchTo(playState);
		}
		
		private function setUp():void {
			
			// Creating the core game objects
			var arena:Arena = new Arena(Consts.GAME_WIDTH * 2, Consts.GAME_HEIGHT * 2);
			
			var player:Player = new Player(arena.width / 2, arena.height / 2, data, arena);
			data.player = player;
			
			var missileLauncher:MisisleLauncher = new MisisleLauncher(
													viewSystem.playView, viewSystem.playCamera,
													viewSystem.hudView, viewSystem.hudCamera,
													data, arena);
			
			// Setting up the views
			_viewSystem = new ViewSystem(arena, player);					
			viewSystem.playView.add(player);
			viewSystem.hudView.add(new ScoreDisplay(Consts.GAME_WIDTH - 310, 10, data));
		}
		
		override public function update():void 
		{
			super.update();
			
			if (state) state.update();
			
			if (pendingNextState) {
				
				if (state) state.leave();
				state = pendingNextState;
				pendingNextState = null;
				state.enter();
			}
		}
		
		override public function render():void 
		{
			viewSystem.render();
			super.render();
		}
		
		public function switchTo(nextState:GameState):void {
			
			pendingNextState = nextState;
		}
		
		//
		//
		//		ACCESSORS
		//
		//
		public function get data():GameData { return _data; }
		
		public function get viewSystem():ViewSystem { return _viewSystem; }
	}

}
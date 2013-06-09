package games.missTheMissile 
{
	import core.context.ELUStateMachine;
	import core.Debug;
	import core.GameConsts;
	import core.games.Game;
	import core.games.GameWorld;
	import core.util.Timer;
	import games.missTheMissile.arena.Arena;
	import games.missTheMissile.entities.Player;
	import games.missTheMissile.states.GameOverState;
	import games.missTheMissile.states.PausedState;
	import games.missTheMissile.views.ViewSystem
	import games.missTheMissile.spawners.MisisleLauncher;
	import games.missTheMissile.states.PlayState;
	import games.missTheMissile.ui.ScoreDisplay;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class MissTheMissileWorld extends GameWorld
	{
		private var _data:GameData,
					_viewSystem:ViewSystem;
					
		public var	state:ELUStateMachine;
		
		public function MissTheMissileWorld(game:Game) 
		{
			super(game);
			
			if (Debug.isEnabled) addGraphic(new Text("Miss the Missile"));
			
			_data = new GameData;			
			setUp();
			
			state = new ELUStateMachine(
				"play", {
				play:		new PlayState(this),
				paused:		new PausedState(this),
				gameOver:	new GameOverState(this)
			});
			updateables.add(state);
		}
		
		private function setUp():void {
			
			// Creating the core game objects
			var arena:Arena = new Arena(GameConsts.WIDTH * 2, GameConsts.HEIGHT * 2);
			
			var player:Player = new Player(arena.width / 2, arena.height / 2, data, arena);
			data.player = player;
			
			_viewSystem = new ViewSystem(arena, player);
			
			var missileLauncher:MisisleLauncher = new MisisleLauncher(
													viewSystem.playView, viewSystem.playCamera,
													viewSystem.hudView, viewSystem.hudCamera,
													data, arena);
			
			// Setting up the views				
			viewSystem.playView.add(player);
			viewSystem.playView.updateables.add(missileLauncher);
			viewSystem.hudView.add(new ScoreDisplay(viewSystem.hudView.width - 310, 10, data));
		}
		
		override public function render():void 
		{
			viewSystem.render();
			super.render();
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
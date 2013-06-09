package core.games 
{
	import core.ui.windows.WindowStack;
	import core.util.UpdateList;
	import net.flashpunk.World;
	
	/**
	 * Make games, make games.
	 * 
	 * A game's world should contain all of the game's entities and logic.
	 * So, make a game world the same way you would a regular FlashPunk world, I dunno.
	 * 
	 * @author beyamor
	 */
	public class GameWorld extends World 
	{
		private var _windows:WindowStack	= new WindowStack,
					_updateables:UpdateList	= new UpdateList,
					_game:Game;
					
		/**
		 * The game world's window stack.
		 */
		public function get windows():WindowStack { return _windows; }
		
		/**
		 * The game world's game.
		 */
		public function get game():Game { return _game; }
		
		/**
		 * The game world's updateables. These are updated on every update call.
		 */
		public function get updateables():UpdateList { return _updateables; }
		
		public function GameWorld(game:Game) 
		{
			_game = game;
		}
		
		/**
		 * Updates windows, updateables, and then entities.
		 */
		override public function update():void 
		{
			windows.update();
			updateables.update();
			super.update();
		}
		
		/**
		 * Renders windows, then entities.
		 */
		override public function render():void 
		{
			windows.render();
			super.render();
		}
	}

}
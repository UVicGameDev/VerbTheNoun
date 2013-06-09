package core.games 
{
	import core.ui.windows.WindowStack;
	import core.util.UpdateList;
	import net.flashpunk.World;
	
	/**
	 * Make games, make games.
	 * 
	 * Each Game represents its own self-contained VtN minigame.
	 * Minigames should therefore subclass Game.
	 * 
	 * @author beyamor
	 */
	public class Game extends World 
	{
		private var _windows:WindowStack	= new WindowStack,
					_updateables:UpdateList	= new UpdateList;
					
		/**
		 * The game's window stack.
		 */
		public function get windows():WindowStack { return _windows; }
		
		/**
		 * The game's updateables. These are updated on every update call.
		 */
		public function get updateables():UpdateList { return _updateables; }
		
		public function Game() 
		{
			
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
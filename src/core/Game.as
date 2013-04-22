package core 
{
	import core.ui.windows.WindowStack;
	import core.util.UpdateList;
	import net.flashpunk.World;
	
	/**
	 * Make games, make games.
	 * @author beyamor
	 */
	public class Game extends World 
	{
		private var _windows:WindowStack	= new WindowStack,
					_updateables:UpdateList	= new UpdateList;
					
		public function get windows():WindowStack { return _windows; }
		
		public function get updateables():UpdateList { return _updateables; }
		
		public function Game() 
		{
			
		}
		
		override public function update():void 
		{
			windows.update();
			updateables.update();
			super.update();
		}
		
		override public function render():void 
		{
			windows.render();
			super.render();
		}
	}

}
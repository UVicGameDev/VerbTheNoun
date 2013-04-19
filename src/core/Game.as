package core 
{
	import core.ui.windows.WindowStack;
	import net.flashpunk.World;
	
	/**
	 * Make games, make games.
	 * @author beyamor
	 */
	public class Game extends World 
	{
		private var _windows:WindowStack = new WindowStack;
		public function get windows():WindowStack { return _windows; }
		
		public function Game() 
		{
			
		}
		
		override public function update():void 
		{
			windows.update();
			super.update();
		}
		
		override public function render():void 
		{
			windows.render();
			super.render();
		}
	}

}
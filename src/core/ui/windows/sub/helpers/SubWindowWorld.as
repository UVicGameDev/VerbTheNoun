package core.ui.windows.sub.helpers 
{
	import core.ui.windows.sub.SubWindow;
	import net.flashpunk.Entity;
	import net.flashpunk.World;
	
	/**
	 * This guy makes sure that the render targets are correctly set.
	 * @author beyamor
	 */
	public class SubWindowWorld extends World 
	{
		private var window:SubWindow;
		
		public function SubWindowWorld(window:SubWindow)
		{
			this.window = window;
		}
		
		override public function add(e:Entity):Entity 
		{
			super.add(e);
			e.renderTarget = window.buffer;
			return e;
		}
		
		override public function remove(e:Entity):Entity 
		{
			super.remove(e);
			if (e.renderTarget == window.buffer) e.renderTarget = null;
			return e;
		}
	}

}
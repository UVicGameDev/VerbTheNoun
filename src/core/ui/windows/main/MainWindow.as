package core.ui.windows.main 
{
	import core.ui.windows.Window;
	import flash.display.BitmapData;
	import net.flashpunk.FP;
	
	/**
	 * This guy is a wrapper for FP/world to make it fit in with the Window system.
	 * @author beyamor
	 */
	public class MainWindow implements Window 
	{
		
		public function MainWindow() 
		{
			
		}
		
		/* INTERFACE core.ui.windows.Window */
		
		public function get x():Number 
		{
			return 0;
		}
		
		public function get y():Number 
		{
			return 0;
		}
		
		public function get width():Number 
		{
			return FP.width;
		}
		
		public function get height():Number 
		{
			return FP.height;
		}
		
		public function update():void 
		{
			// Do nothing. Shouldn't be called.
		}
		
		public function render():void 
		{
			// Do nothing. Shouldn't be called.
		}
		
		public function get buffer():BitmapData 
		{
			return FP.buffer;
		}
		
		public function get parent():Window 
		{
			return null;
		}
		
		public function get blocksUpdates():Boolean 
		{
			return false;
		}
		
	}

}
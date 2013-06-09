package core.ui.windows 
{
	import core.ui.windows.Window;
	import core.util.camera.concrete.FPCamera;
	import flash.display.BitmapData;
	import core.util.camera.Camera
	import flash.geom.Point;
	import net.flashpunk.FP;
	
	/**
	 * This guy is a wrapper for FP/world to make it fit in with the Window system.
	 * 
	 * You should never have to deal with this window directly.
	 * Where necessary, subwindows will default to the main window as their parent.
	 * 
	 * @author beyamor
	 */
	public class MainWindow implements Window 
	{
		private var _camera:Camera;
		public function get camera():Camera { return _camera; }
		
		public function MainWindow() 
		{
			_camera = new FPCamera();
		}
		
		/* INTERFACE core.ui.windows.Window */
		public function get position():Point
		{
			return new Point;
		}
		
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
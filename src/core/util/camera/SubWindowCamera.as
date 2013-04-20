package core.util.camera 
{
	import core.ui.windows.sub.SubWindow;
	import core.ui.windows.Window;
	/**
	 * ...
	 * @author beyamor
	 */
	public class SubWindowCamera implements Camera 
	{
		private var	_x:Number	= 0,
					_y:Number	= 0,
					window:SubWindow;
		
		public function SubWindowCamera(window:SubWindow)
		{
			this.window = window;
		}
		
		/* INTERFACE core.util.camera.Camera */
		
		public function get x():Number 
		{
			return window.world.camera.x;
		}
		
		public function get y():Number 
		{
			return window.world.camera.y;
		}
		
		public function set x(value:Number):void 
		{
			window.world.camera.x = value;
		}
		
		public function set y(value:Number):void 
		{
			window.world.camera.y = value;
		}
		
		public function get width():Number 
		{
			return window.width;
		}
		
		public function get height():Number 
		{
			return window.height;
		}
		
		public function get top():Number 
		{
			return y;
		}
		
		public function get bottom():Number 
		{
			return y + height;
		}
		
		public function get left():Number 
		{
			return x;
		}
		
		public function get right():Number 
		{
			return x + width;
		}
		
		public function update():void 
		{
			// Do nothing
		}
		
	}

}
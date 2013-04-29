package core.util.camera.concrete 
{
	import core.ui.View
	import core.util.camera.Camera;
	/**
	 * ...
	 * @author beyamor
	 */
	public class ViewCamera implements Camera 
	{
		private var view:View;
		
		public function ViewCamera(view:View) 
		{
			this.view = view;
		}
		
		/* INTERFACE core.util.camera.Camera */
		
		public function get x():Number 
		{
			return view.camera.x;
		}
		
		public function get y():Number 
		{
			return view.camera.y;
		}
		
		public function set x(value:Number):void 
		{
			view.camera.x = value;
		}
		
		public function set y(value:Number):void 
		{
			view.camera.y = value;
		}
		
		public function get width():Number 
		{
			return view.buffer.width;
		}
		
		public function get height():Number 
		{
			return view.buffer.height;
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
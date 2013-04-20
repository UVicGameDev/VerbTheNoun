package core.util.camera 
{
	/**
	 * ...
	 * @author beyamor
	 */
	public class CameraDecorator implements Camera 
	{
		private var _cam:Camera;
		protected function get cam():Camera { return _cam; }
		
		public function CameraDecorator(cam:Camera)
		{
			this._cam = cam;
		}
		
		/* INTERFACE games.missTheMissile.util.camera.Camera */
		
		public function get x():Number 
		{
			return cam.x;
		}
		
		public function get y():Number 
		{
			return cam.y;
		}
		
		public function set x(value:Number):void 
		{
			cam.x = value;
		}
		
		public function set y(value:Number):void 
		{
			cam.y = value;
		}
		
		public function get width():Number 
		{
			return cam.width;
		}
		
		public function get height():Number 
		{
			return cam.height;
		}
		
		public function update():void 
		{
			cam.update();
		}
		
		public function get top():Number { return cam.top; }
		public function get bottom():Number { return cam.bottom; }
		public function get left():Number { return cam.left; }
		public function get right():Number { return cam.right; }
	}

}
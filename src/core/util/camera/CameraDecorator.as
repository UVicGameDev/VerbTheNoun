package core.util.camera 
{
	/**
	 * ...
	 * @author beyamor
	 */
	public class CameraDecorator implements Camera 
	{
		private var _cam:Camera;
		protected function get baseCamera():Camera { return _cam; }
		
		public function CameraDecorator(cam:Camera)
		{
			this._cam = cam;
		}
		
		/* INTERFACE games.missTheMissile.util.camera.Camera */
		
		public function get x():Number 
		{
			return baseCamera.x;
		}
		
		public function get y():Number 
		{
			return baseCamera.y;
		}
		
		public function set x(value:Number):void 
		{
			baseCamera.x = value;
		}
		
		public function set y(value:Number):void 
		{
			baseCamera.y = value;
		}
		
		public function get width():Number 
		{
			return baseCamera.width;
		}
		
		public function get height():Number 
		{
			return baseCamera.height;
		}
		
		public function update():void 
		{
			baseCamera.update();
		}
		
		public function get top():Number { return baseCamera.top; }
		public function get bottom():Number { return baseCamera.bottom; }
		public function get left():Number { return baseCamera.left; }
		public function get right():Number { return baseCamera.right; }
	}

}
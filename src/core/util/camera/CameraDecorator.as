package core.util.camera 
{
	/**
	 * A lot of the time, we just want to add behaviour to a camera.
	 * For example, we might want a view's camera to follow a particular entity or move relative to another camera.
	 * We can do this by decorating cameras, thereby extending their behaviour.
	 * 
	 * When writing a camera decorator, it should only be necessary to override the update method.
	 * 
	 * @author beyamor
	 */
	public class CameraDecorator implements Camera 
	{
		private var _cam:Camera;
		protected function get baseCamera():Camera { return _cam; }
		
		/**
		 * Creates a camera which decorates the supplied base camera.
		 */
		public function CameraDecorator(baseCamera:Camera)
		{
			this._cam = baseCamera;
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
package core.util.camera 
{
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author beyamor
	 */
	public class BoundedCamera extends CameraDecorator 
	{
		private var bounds:Rectangle;
		
		public function BoundedCamera(bounds:Rectangle, cam:Camera)
		{
			super(cam);
			
			this.bounds = bounds;
		}
		
		override public function update():void 
		{
			super.update();
			
			if (baseCamera.x < bounds.left)				baseCamera.x = bounds.left;
			if (baseCamera.y < bounds.top)					baseCamera.y = bounds.top;
			if (baseCamera.x + baseCamera.width > bounds.right)	baseCamera.x = bounds.right - baseCamera.width;
			if (baseCamera.y + baseCamera.height > bounds.bottom)	baseCamera.y = bounds.bottom - baseCamera.height;
		}
	}

}
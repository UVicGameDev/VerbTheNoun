package core.util.camera.decorators 
{
	import core.util.camera.Camera;
	import core.util.camera.CameraDecorator;
	import flash.geom.Rectangle;
	/**
	 * The bounded camera stays within some bounds.
	 * @author beyamor
	 */
	public class BoundedCamera extends CameraDecorator 
	{
		private var bounds:Rectangle;
		
		/**
		 * Creates a new camera which will be bounded such that:
		 * 		- the left is always greater than or equal to the left of the bounds.
		 * 		- the right is always less than or equal to the right of the bounds.
		 * 		- the top is always greater than or equal to the top of the bounds.
		 * 		- the bottom is always greater than or equal to the bottom of the bounds.
		 */
		public function BoundedCamera(bounds:Rectangle, cam:Camera)
		{
			super(cam);
			
			this.bounds = bounds;
		}
		
		override public function update():void 
		{
			super.update();
			
			if (baseCamera.left < bounds.left)		baseCamera.x = bounds.left;
			if (baseCamera.top < bounds.top)		baseCamera.y = bounds.top;
			if (baseCamera.right > bounds.right)	baseCamera.x = bounds.right - baseCamera.width;
			if (baseCamera.bottom > bounds.bottom)	baseCamera.y = bounds.bottom - baseCamera.height;
		}
	}

}
package games.missTheMissile.util.camera 
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
			
			if (cam.x < bounds.left)				cam.x = bounds.left;
			if (cam.y < bounds.top)					cam.y = bounds.top;
			if (cam.x + cam.width > bounds.right)	cam.x = bounds.right - cam.width;
			if (cam.y + cam.height > bounds.bottom)	cam.y = bounds.bottom - cam.height;
		}
	}

}
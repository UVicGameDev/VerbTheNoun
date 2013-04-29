package core.util.camera.decorators 
{
	import core.util.camera.Camera;
	import core.util.camera.CameraDecorator;
	/**
	 * The parallax camera moves relative to another camera.
	 * @author beyamor
	 */
	public class ParallaxCamera extends CameraDecorator 
	{
		private var followedCamera:Camera,
					followSpeed:Number;
		
		/**
		 * Creates a parallax camera which follows another camera.
		 * If the follow speed is 1, the parallax camera will stay aligned with the camera it follows.
		 * If the follow speed is less than 1, it will move slower (appearing to be futher away)
		 * If the follow speed is greater than 1, it will move faster (appearing to be closer)
		 * If the follow speed is 0, the parallax camera will not move at all.
		 */
		public function ParallaxCamera(cameraToFollow:Camera, followSpeed:Number, baseCamera:Camera) 
		{
			super(baseCamera);
			
			this.followedCamera	= cameraToFollow;
			this.followSpeed	= followSpeed;
		}
		
		override public function update():void 
		{
			super.update();
			
			// This assumes a couple of things:
			//	- first, the cameras have the same dimensions
			//	- second, the cameras line up at (0,0)
			baseCamera.x = followedCamera.x * followSpeed;
			baseCamera.y = followedCamera.y * followSpeed;
		}
	}

}
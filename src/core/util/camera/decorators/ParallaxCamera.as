package core.util.camera.decorators 
{
	import core.util.camera.Camera;
	import core.util.camera.CameraDecorator;
	/**
	 * ...
	 * @author beyamor
	 */
	public class ParallaxCamera extends CameraDecorator 
	{
		private var followedCamera:Camera,
					followSpeed:Number;
		
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
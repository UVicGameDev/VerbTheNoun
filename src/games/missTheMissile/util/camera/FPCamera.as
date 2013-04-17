package games.missTheMissile.util.camera 
{
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author beyamor
	 */
	public class FPCamera implements Camera 
	{
		
		public function FPCamera() 
		{
			
		}
		
		/* INTERFACE games.missTheMissile.util.camera.Camera */
		
		public function get x():Number 
		{
			return FP.camera.x;
		}
		
		public function get y():Number 
		{
			return FP.camera.y;
		}
		
		public function set x(value:Number):void 
		{
			FP.camera.x = value;
		}
		
		public function set y(value:Number):void 
		{
			FP.camera.y = value;
		}
		
		public function get width():Number 
		{
			return FP.width;
		}
		
		public function get height():Number 
		{
			return FP.height;
		}
		
		public function update():void 
		{
			// Do nothing
		}
		
	}

}
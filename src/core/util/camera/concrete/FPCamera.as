package core.util.camera.concrete 
{
	import core.util.camera.Camera;
	import net.flashpunk.FP;
	/**
	 * The FP camera wraps FP's camera.
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
		
		public function get left():Number
		{
			return x;
		}
		
		public function get right():Number
		{
			return x + width;
		}
		
		public function get top():Number
		{
			return y;
		}
		
		public function get bottom():Number
		{
			return y + height;
		}
	}

}
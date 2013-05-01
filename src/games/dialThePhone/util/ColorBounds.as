package games.dialThePhone.util 
{
	import flash.display.BitmapData;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author beyamor
	 */
	public class ColorBounds 
	{
		private var	colorInBounds:uint,
					mask:BitmapData;
		
		public function ColorBounds(colorInBounds:uint, maskSource:*) 
		{
			this.colorInBounds	= colorInBounds;
			this.mask			= FP.getBitmap(maskSource);
		}
		
		public function contains(x:int, y:int):Boolean {
			
			if (x < 0 || y < 0 || x >= mask.width || y >= mask.height) return false;
			
			return (mask.getPixel(x, y) == colorInBounds);
		}
	}

}
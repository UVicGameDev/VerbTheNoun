package games.dialThePhone.graphics 
{
	import flash.geom.Point;
	import flash.display.BitmapData;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class FingerSprite extends Graphic 
	{
		[Embed(source = '/games/dialThePhone/assets/finger.png')]
		private const FINGER_IMAGE:Class;
		
		private var image:Image;
		
		public function FingerSprite() 
		{
			image	= new Image(FINGER_IMAGE);
			image.x	= -85;
			image.y	= -475;
		}
		
		override public function render(target:BitmapData, point:Point, camera:Point):void 
		{
			super.render(target, point, camera);
			image.render(target, point, camera);
		}
	}

}
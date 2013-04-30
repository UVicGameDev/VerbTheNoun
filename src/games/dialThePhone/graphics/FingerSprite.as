package games.dialThePhone.graphics 
{
	import flash.geom.Point;
	import flash.display.BitmapData;
	import net.flashpunk.FP;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.utils.Ease;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class FingerSprite extends Graphic 
	{
		private static const	MAXIMUM_FINGER_HEIGHT:Number	= 40,
								TAP_DOWN_TIME:Number			= 0.1,
								TAP_UP_TIME:Number				= 0.25;
								
		private static const	NOT_TAPPING:uint	= 0,
								TAPPING_DOWN:uint	= 1,
								TAPPING_UP:uint		= 2;
		
		[Embed(source = '/games/dialThePhone/assets/finger.png')]
		private const FINGER_IMAGE:Class;
		
		[Embed(source = '/games/dialThePhone/assets/reticule.png')]
		private const RETICULE_IMAGE:Class;
		
		private var finger:Image,
					reticule:Image,
					fingerHeight:Number	= MAXIMUM_FINGER_HEIGHT,
					tapState:uint		= NOT_TAPPING,
					tapTime:Number		= 0,
					onTapDown:Function;
		
		public function FingerSprite() 
		{
			finger	= new Image(FINGER_IMAGE);
			finger.x	= -85;
			finger.y	= -475;
			
			reticule	= new Image(RETICULE_IMAGE);
			reticule.x	= -16;
			reticule.y	= -16;
		}
		
		override public function render(target:BitmapData, point:Point, camera:Point):void 
		{
			super.render(target, point, camera);
			reticule.render(target, point, camera);
			finger.render(target, point.subtract(new Point(0, fingerHeight)), camera);
		}
		
		public function set fingerHeightPercent(percentBetween0And1:Number):void {
			
			fingerHeight = percentBetween0And1 * MAXIMUM_FINGER_HEIGHT;
		}
	}

}
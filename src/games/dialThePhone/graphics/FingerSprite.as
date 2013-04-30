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
			
			active = true;
		}
		
		override public function update():void 
		{
			super.update();
			
			
			// A lot of state-y stuff for a graphic,
			// but I'm doing the animation programmatically, so suck it
			if (isTapping) tapTime += FP.elapsed;
			
			if (tapState == TAPPING_DOWN) {
				
				if (tapTime < TAP_DOWN_TIME) {
					
					fingerHeight = (1 - Ease.cubeOut(tapTime / TAP_DOWN_TIME)) * MAXIMUM_FINGER_HEIGHT;
				}
				
				else {
				
					fingerHeight	= 0;
					tapState		= TAPPING_UP;
					tapTime			= 0;
					
					if (onTapDown != null) onTapDown();
				}
			}
			
			else if (tapState == TAPPING_UP) {
				
				if (tapTime < TAP_UP_TIME) {
					
					fingerHeight = (Ease.cubeOut(tapTime / TAP_UP_TIME)) * MAXIMUM_FINGER_HEIGHT;
				}
				
				else {
				
					fingerHeight	= MAXIMUM_FINGER_HEIGHT;
					tapState		= NOT_TAPPING;
				}
			}
		}
		
		override public function render(target:BitmapData, point:Point, camera:Point):void 
		{
			super.render(target, point, camera);
			reticule.render(target, point, camera);
			finger.render(target, point.subtract(new Point(0, fingerHeight)), camera);
		}
		
		public function tap(onTapDown:Function = null):void {
			
			if (isTapping) return;
			
			tapState		= TAPPING_DOWN;
			tapTime			= 0;
			this.onTapDown	= onTapDown;
		}
		
		public function get isTapping():Boolean {
			
			return tapState != NOT_TAPPING;
		}
	}

}
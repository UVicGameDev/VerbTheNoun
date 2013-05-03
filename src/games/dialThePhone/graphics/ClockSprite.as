package games.dialThePhone.graphics 
{
	import core.util.Timer;
	import flash.geom.Point;
	import flash.display.BitmapData;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class ClockSprite extends Graphic 
	{
		[Embed(source = '/games/dialThePhone/assets/clock.png')]
		private const BACKGROUND_IMAGE:Class;
		
		[Embed(source = '/games/dialThePhone/assets/clock-hand.png')]
		private const HAND_IMAGE:Class;
		
		private var	background:Image,
					timer:Timer,
					hand:Image;
		
		public function ClockSprite(timer:Timer) 
		{
			this.timer = timer;
			
			background = new Image(BACKGROUND_IMAGE);
			
			hand = new Image(HAND_IMAGE);
			hand.originY = 16;
		}
		
		override public function render(target:BitmapData, point:Point, camera:Point):void 
		{
			super.render(target, point, camera);
			background.render(target, point, camera);			
			
			// Quantizing the angle so the rotation is less smooth
			hand.angle = Math.round((90 + timer.percentElapsed * 360) / 2) * 2;
			hand.render(target, point.add(new Point(32, 32)), camera);
		}
	}

}
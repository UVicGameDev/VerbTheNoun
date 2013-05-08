package games.dialThePhone.graphics 
{
	import flash.geom.Point;
	import flash.display.BitmapData;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class NumericKeySprite extends Graphic 
	{
		[Embed(source = '/games/dialThePhone/assets/numeric-key.png')]
		private static const NUMERIC_KEY_SPRITE:Class;
		
		private var	graphics:Graphiclist;
		
		public function NumericKeySprite(digit:uint) 
		{
			var label:Text			= new Text(digit.toString(), 0, 0, { size: 32 } ),
				digitImage:Image	= new Image(NUMERIC_KEY_SPRITE);
				
			label.x = (digitImage.width - label.width) / 2;
			label.y = (digitImage.height - label.height) / 2;
			
			graphics = new Graphiclist(digitImage, label);
		}
		
		override public function render(target:BitmapData, point:Point, camera:Point):void 
		{
			super.render(target, point, camera);
			graphics.render(target, point, camera);
		}
	}

}
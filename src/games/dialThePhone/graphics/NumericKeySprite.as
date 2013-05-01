package games.dialThePhone.graphics 
{
	import flash.geom.Point;
	import flash.display.BitmapData;
	import net.flashpunk.Graphic;
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
		
		private var label:Text;
		private var digit:Image;
		
		public function NumericKeySprite(digit:uint) 
		{
			this.label	= new Text(digit.toString(), 0, 0, {size: 32});
			this.digit	= new Image(NUMERIC_KEY_SPRITE);
			
			this.label.x = (this.digit.width - this.label.width) / 2;
			this.label.y = (this.digit.height - this.label.height) / 2;
		}
		
		override public function render(target:BitmapData, point:Point, camera:Point):void 
		{
			super.render(target, point, camera);
			digit.render(target, point, camera);
			label.render(target, point, camera);
		}
	}

}
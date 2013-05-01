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
		private var key:Image;
		
		public function NumericKeySprite(number:uint) 
		{
			this.label	= new Text(number.toString(), 0, 0, {size: 32});
			this.key	= new Image(NUMERIC_KEY_SPRITE);
			
			this.label.x = (this.key.width - this.label.width) / 2;
			this.label.y = (this.key.height - this.label.height) / 2;
		}
		
		override public function render(target:BitmapData, point:Point, camera:Point):void 
		{
			super.render(target, point, camera);
			key.render(target, point, camera);
			label.render(target, point, camera);
		}
	}

}
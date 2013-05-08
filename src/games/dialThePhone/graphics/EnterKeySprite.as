package games.dialThePhone.graphics 
{
	import flash.display.BitmapData;
	import flash.geom.Point;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Graphiclist;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.graphics.Text;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class EnterKeySprite extends Graphic 
	{
		[Embed(source = '/games/dialThePhone/assets/enter-key.png')]
		private static const ENTER_KEY_SPRITE:Class;
		
		private var	graphics:Graphiclist;
		
		public function EnterKeySprite() 
		{
			var label:Text			= new Text("<-'", 0, 0, { size: 32 } ),
				enterImage:Image	= new Image(ENTER_KEY_SPRITE);
			
			label.x = (enterImage.width - label.width) / 2;
			label.y = (enterImage.height - label.height) / 2 + 16;
			
			graphics = new Graphiclist(enterImage, label);
		}
		
		
		override public function render(target:BitmapData, point:Point, camera:Point):void 
		{
			super.render(target, point, camera);
			graphics.render(target, point, camera);
		}
	}

}
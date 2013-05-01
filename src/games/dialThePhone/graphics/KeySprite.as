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
	public class KeySprite extends Graphic 
	{
		private var label:Text;
		private var key:Image;
		
		public function KeySprite(label:String, keySource:*) 
		{
			this.label	= new Text(label, 0, 0, {size: 32});
			this.key	= new Image(keySource);
			
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
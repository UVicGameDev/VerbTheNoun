package games.dialThePhone.graphics 
{
	import flash.geom.Point;
	import flash.display.BitmapData;
	import net.flashpunk.Graphic;
	import net.flashpunk.graphics.Text;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class KeySprite extends Graphic 
	{
		private var label:Text;
		
		public function KeySprite(label:String) 
		{
			this.label	= new Text(label);
		}
		
		override public function render(target:BitmapData, point:Point, camera:Point):void 
		{
			super.render(target, point, camera);
			label.render(target, point, camera);
		}
	}

}
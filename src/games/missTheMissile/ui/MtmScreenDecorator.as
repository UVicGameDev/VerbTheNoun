package games.missTheMissile.ui 
{
	import core.ui.menus.HighlightableEntity;
	import core.ui.View;
	import core.ui.windows.Window;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	/**
	 * ...
	 * @author beyamor
	 */
	public class MtmScreenDecorator 
	{
		public function decorate(view:View, options:Vector.<HighlightableEntity>, screenName:String):void {
			
			view.clearColor = 0x33FFFFFF;
			
			for (var index:uint = 0; index < options.length; ++index) {
				
				var option:HighlightableEntity = options[index];
				
				option.x = view.width / 2 - option.width / 2;
				option.y = 100 + 40 * index;
			}
			
			var	titleGraphic:Text	= new Text(screenName, 0, 0, { size:48 } ),
				titleElement:Entity	= view.addGraphic(titleGraphic, 0, 0, 20);
			
			titleElement.x = view.width / 2 - titleGraphic.width / 2;
		}
	}

}
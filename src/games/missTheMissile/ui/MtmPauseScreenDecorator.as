package games.missTheMissile.ui 
{
	import core.ui.menus.HighlightableEntity;
	import core.ui.menus.Hightlightable;
	import core.ui.windows.decorators.PauseScreenDecorator;
	import core.ui.windows.PauseScreen;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class MtmPauseScreenDecorator extends PauseScreenDecorator
	{
		
		public function MtmPauseScreenDecorator() 
		{
			resumeOption	= new MenuOption("resume", null);
			restartOption	= new MenuOption("restart", null);
			quitOption		= new MenuOption("quit", null);
		}
		
		override public function decorate(pauseScreen:PauseScreen):void 
		{
			super.decorate(pauseScreen);
			
			pauseScreen.view.clearColor = 0x33FFFFFF;
			
			for (var index:uint = 0; index < options.length; ++index) {
				
				var option:HighlightableEntity = options[index];
				
				option.x = width / 2 - option.width / 2;
				option.y = 100 + 40 * index;
				
				pauseScreen.view.add(option);
			}
			
			var	titleGraphic:Text	= new Text("Paused", 0, 0, { size:48 } ),
				titleElement:Entity	= pauseScreen.view.addGraphic(titleGraphic, 0, 0, 20);
			
			titleElement.x = pauseScreen.width / 2 - titleGraphic.width / 2;
		}
	}

}
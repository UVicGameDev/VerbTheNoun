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
			resumeOption	= new MenuOption("resume");
			restartOption	= new MenuOption("restart");
			quitOption		= new MenuOption("quit");
		}
		
		override public function decorate(screen:PauseScreen):void 
		{
			super.decorate(screen);
			(new MtmScreenDecorator).decorate(screen, options, "Paused");
		}
	}

}
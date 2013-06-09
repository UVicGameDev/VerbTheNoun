package games.missTheMissile.ui 
{
	import core.ui.menus.HighlightableEntity;
	import core.ui.menus.Hightlightable;
	import core.ui.windows.decorators.GameOverScreenDecorator;
	import core.ui.windows.GameOverScreen;
	import core.ui.windows.PauseScreen;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class MtmGameOverScreenDecorator extends GameOverScreenDecorator
	{
		
		public function MtmGameOverScreenDecorator() 
		{
			restartOption	= new MenuOption("restart");
			quitOption		= new MenuOption("quit");
		}
		
		override public function decorate(screen:GameOverScreen):void 
		{
			super.decorate(screen);
			(new MtmScreenDecorator).decorate(screen, options, "Game Over");
		}
	}

}
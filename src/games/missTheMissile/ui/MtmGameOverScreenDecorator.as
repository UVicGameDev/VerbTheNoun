package games.missTheMissile.ui 
{
	import core.ui.menus.HighlightableEntity;
	import core.ui.menus.Hightlightable;
	import core.ui.windows.decorators.PauseScreenDecorator;
	import core.ui.windows.GameOverScreen;
	import core.ui.windows.PauseScreen;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Text;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class MtmGameOverScreenDecorator extends PauseScreenDecorator
	{
		
		public function MtmGameOverScreenDecorator() 
		{
			restartOption	= new MenuOption("restart", null);
			quitOption		= new MenuOption("quit", null);
		}
		
		override public function decorate(screen:GameOverScreen):void 
		{
			super.decorate(pauseScreen);
			(new MtmScreenDecorator).decorate(screen, options, "Game Over");
		}
	}

}
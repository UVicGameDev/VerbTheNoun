package games.missTheMissile.ui 
{
	import core.ui.menus.HighlightableEntity;
	import core.ui.menus.Hightlightable;
	import core.ui.View;
	import core.ui.windows.decorators.GameOverScreenDecorator;
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
		
		override public function decorate(view:View):void 
		{
			super.decorate(view);
			(new MtmScreenDecorator).decorate(view, options, "Game Over");
		}
	}

}
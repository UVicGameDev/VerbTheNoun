package core.ui.windows.decorators 
{
	import core.ui.menus.HighlightableEntity;
	import core.ui.View;
	
	/**
	 * Games provide their own aesthetic for game over screens by specializing this class.
	 * See PauseScreenDecorator for a more detailed explanation.
	 * @author beyamor
	 */
	public class GameOverScreenDecorator 
	{
		public var	restartOption:HighlightableEntity,
					quitOption:HighlightableEntity;
		
		public function decorate(view:View):void {
			
			if (restartOption)	view.add(restartOption);
			if (quitOption)		view.add(quitOption);
		}
		
		public function get width():uint {
			
			return 400;
		}
		public function get height():uint {
			
			return 300;
		}
		
		protected function get options():Vector.<HighlightableEntity> {
			
			return new <HighlightableEntity>[restartOption, quitOption];
		}
	}

}
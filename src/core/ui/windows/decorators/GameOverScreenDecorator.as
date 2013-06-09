package core.ui.windows.decorators 
{
	import core.ui.menus.HighlightableEntity;
	import core.ui.windows.GameOverScreen;
	import core.ui.windows.PauseScreen;
	
	/**
	 * Games provide their own aesthetic for game over screens by specializing this class.
	 * See PauseScreenDecorator for a more detailed explanation.
	 * @author beyamor
	 */
	public class GameOverScreenDecorator 
	{
		public var	restartOption:HighlightableEntity,
					quitOption:HighlightableEntity;
		
		public function decorate(screen:GameOverScreen):void {
			
			screen.view.add(restartOption);
			screen.view.add(quitOption);
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
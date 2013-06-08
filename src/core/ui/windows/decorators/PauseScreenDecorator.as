package core.ui.windows.decorators 
{
	import core.ui.menus.HighlightableEntity;
	import core.ui.menus.Hightlightable;
	import core.ui.windows.PauseScreen;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class PauseScreenDecorator 
	{
		public var	resumeOption:HighlightableEntity,
					restartOption:HighlightableEntity,
					quitOption:HighlightableEntity;
		
		public function decorate(pauseScreen:PauseScreen):void {
			
			pauseScreen.view.add(quitOption);
		}
		
		public function get width():uint {
			
			return 400;
		}
		public function get height():uint {
			
			return 300;
		}
		
		protected function get options():Vector.<HighlightableEntity> {
			
			return new <HighlightableEntity>[resumeOption, restartOption, quitOption];
		}
	}
	
}
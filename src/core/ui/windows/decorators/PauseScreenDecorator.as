package core.ui.windows.decorators 
{
	import core.ui.menus.HighlightableEntity;
	import core.ui.menus.Hightlightable;
	import core.ui.View;
	
	/**
	 * Games provide their own aesthetic for pause screens by specializing this class.
	 * This is accomplished by doing two things in a subclass:
	 * 		- creating a resumeOption, a restartOption, and a quitOption so they can be provided for the pause screen
	 * 		- overriding the decorate method to decorate the pause screen (e.g. by adding entities or setting the clear color)
	 * 			Note that this class's decorate implementation adds the option instances to the screen's view,
	 * 			so you probably want to call super's decorate in the subclass
	 * 
	 * The only restriction on the decoration is that the options are expected to be in a vertical list in the following order:
	 * 		- resumeOption
	 * 		- restartOption
	 * 		- quitOption
	 * That is, resumeOption.y < restartOption.y < quitOption.y
	 * 
	 * Note that all of the actual selection logic is handled by the pause screen.
	 * You just need to make the options look pretty when they are highlighted.
	 * 
	 * @author beyamor
	 */
	public class PauseScreenDecorator 
	{
		public var	resumeOption:HighlightableEntity,
					restartOption:HighlightableEntity,
					quitOption:HighlightableEntity;
		
		public function decorate(view:View):void {
			
			view.add(resumeOption);
			view.add(restartOption);
			view.add(quitOption);
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
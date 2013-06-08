package core.ui.windows 
{
	import core.Game;
	import core.ui.menus.pause.PauseScreenDecorator;
	import core.ui.menus.pause.QuitOption;
	import core.ui.menus.pause.RestartOption;
	import core.ui.menus.pause.ResumeOption;
	import core.ui.menus.VerticalSelectionList;
	/**
	 * ...
	 * @author beyamor
	 */
	public class PauseScreen extends Popup 
	{
		
		public function PauseScreen(game:Game, decorator:PauseScreenDecorator)
		{
			super(decorator.width, decorator.height, game.windows);
			centerOnParent();
			
			decorator.decorate(this);
			
			var	selectionList:VerticalSelectionList = new VerticalSelectionList(
				new ResumeOption(this, decorator.resumeOption),
				new RestartOption(Object(game).constructor, decorator.restartOption),
				new QuitOption(decorator.quitOption)
			);			
			updateables.add(selectionList);
		}
	}

}
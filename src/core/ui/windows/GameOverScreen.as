package core.ui.windows 
{
	import core.Game;
	import core.ui.menus.VerticalSelectionList;
	import core.ui.windows.decorators.GameOverDecorator;
	import core.ui.windows.options.QuitOption;
	import core.ui.windows.options.RestartOption;
	/**
	 * ...
	 * @author beyamor
	 */
	public class GameOverScreen extends SubWindow 
	{
		
		public function GameOverScreen(game:Game, decorator:GameOverDecorator)
		{
			super(decorator.width, decorator.height, game.windows);
			centerOnParent();
			
			decorator.decorate(this);
			
			var	selectionList:VerticalSelectionList = new VerticalSelectionList(
				new RestartOption(Object(game).constructor, decorator.restartOption),
				new QuitOption(decorator.quitOption)
			);			
			updateables.add(selectionList);
		}
		
	}

}
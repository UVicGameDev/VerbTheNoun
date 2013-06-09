package core.ui.windows 
{
	import core.games.Game;
	import core.ui.menus.VerticalSelectionList;
	import core.ui.windows.decorators.GameOverScreenDecorator;
	import core.ui.windows.options.QuitOption;
	import core.ui.windows.options.RestartOption;
	
	/**
	 * The game over screen pops up when a game is completed.
	 * It has two options - restart and quit.
	 * It is decorated by a game-specific GameOverScreenDecorator.
	 * 
	 * @author beyamor
	 */
	public class GameOverScreen extends SubWindow 
	{
		
		public function GameOverScreen(game:Game, decorator:GameOverScreenDecorator)
		{
			super(decorator.width, decorator.height);
			centerOnParent();
			
			decorator.decorate(view);
			
			var	selectionList:VerticalSelectionList = new VerticalSelectionList(
				new RestartOption(Object(game).constructor, decorator.restartOption),
				new QuitOption(decorator.quitOption)
			);			
			updateables.add(selectionList);
		}
		
	}

}
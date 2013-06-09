package core.ui.windows 
{
	import core.games.GameWorld;
	import core.Keys;
	import core.ui.menus.VerticalSelectionList;
	import core.ui.windows.decorators.PauseScreenDecorator;
	import core.ui.windows.options.QuitOption;
	import core.ui.windows.options.RestartOption;
	import core.ui.windows.options.ResumeOption;
	import net.flashpunk.utils.Input;
	
	/**
	 * The player should be able to open the pause screen by pressing the pause button.
	 * It has three options - resume, restart, and quit.
	 * It can also be closed by pressing cancel or pause.
	 * It is decorated by a game-specific PauseScreenDecorator.
	 * 
	 * @author beyamor
	 */
	public class PauseScreen extends Popup 
	{
		
		public function PauseScreen(game:GameWorld, decorator:PauseScreenDecorator)
		{
			super(decorator.width, decorator.height, game.windows);
			centerOnParent();
			
			decorator.decorate(view);
			
			var	selectionList:VerticalSelectionList = new VerticalSelectionList(
				new ResumeOption(this, decorator.resumeOption),
				new RestartOption(Object(game).constructor, decorator.restartOption),
				new QuitOption(decorator.quitOption)
			);			
			updateables.add(selectionList);
		}
		
		override public function update():void 
		{
			super.update();
			if (Input.pressed(Keys.PAUSE)) close();
		}
	}

}
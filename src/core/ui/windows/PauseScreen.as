package core.ui.windows 
{
	import core.Game;
	import core.Keys;
	import core.ui.menus.pause.PauseScreenDecorator;
	import core.ui.menus.pause.QuitOption;
	import core.ui.menus.pause.RestartOption;
	import core.ui.menus.pause.ResumeOption;
	import core.ui.menus.VerticalSelectionList;
	import net.flashpunk.utils.Input;
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
		
		override public function update():void 
		{
			super.update();
			if (Input.pressed(Keys.PAUSE)) close();
		}
	}

}
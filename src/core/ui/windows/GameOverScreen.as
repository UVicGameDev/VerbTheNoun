package core.ui.windows 
{
	import core.games.Game;
	import core.games.GameWorld;
	import core.ui.menus.HighlightableEntity;
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
		private var _options:Vector.<HighlightableEntity> = new Vector.<HighlightableEntity>;
		
		public function GameOverScreen(
			width:uint,
			height:uint,
			world:GameWorld,
			restartOption:HighlightableEntity,
			quitOption:HighlightableEntity)
		{
			super(width, height);
			centerOnParent();
			
			var	selectionList:VerticalSelectionList = new VerticalSelectionList;
			updateables.add(selectionList);
			
			if (restartOption) {
				
				_options.push(restartOption);
				selectionList.add(new RestartOption(world.game, restartOption));
				view.add(restartOption);
			} else throw new Error("Restart option is mandatory in quit screen");
			
			if (quitOption) {
				
				_options.push(quitOption);
				selectionList.add(new QuitOption(world.game, quitOption));
				view.add(quitOption);
			} else throw new Error("Quit option is mandatory in quit screen");
		}
		
		public function get options():Vector.<HighlightableEntity> {
			
			return _options;
		}
		
		public static function get description():GameOverScreenBuilder {
			
			return new GameOverScreenBuilder;
		}
	}
}
import core.games.GameWorld;
import core.ui.windows.GameOverScreen;
import core.ui.menus.HighlightableEntity;

class GameOverScreenBuilder {
	
	private var	_restartOption:HighlightableEntity,
				_quitOption:HighlightableEntity,
				_width:uint		= 400,
				_height:uint	= 300;
				
	public function dimensions(width:uint, height:uint):GameOverScreenBuilder {
		
		_width	= width;
		_height	= height;
		return this;
	}
	
	public function restart(restartOption:HighlightableEntity):GameOverScreenBuilder {
		
		_restartOption = restartOption;
		return this;
	}
	
	public function quit(quitOption:HighlightableEntity):GameOverScreenBuilder {
		
		_quitOption = quitOption;
		return this;
	}
	
	public function buildFor(world:GameWorld):GameOverScreen {
		
		if (_restartOption == null)	throw new Error("Restart option is mandatory in quit screen");
		if (_quitOption == null)	throw new Error("Quit option is mandatory in quit screen");
		
		return new GameOverScreen(_width, _height, world, _restartOption, _quitOption); 
	}
}
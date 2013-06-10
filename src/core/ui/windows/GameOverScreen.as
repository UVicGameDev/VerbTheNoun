package core.ui.windows 
{
	import core.games.Game;
	import core.games.GameWorld;
	import core.ui.menus.HighlightableEntity;
	import core.ui.menus.VerticalSelectionList;
	import core.ui.windows.options.QuitOption;
	import core.ui.windows.options.RestartOption;
	
	/**
	 * The game over screen pops up when a game is completed.
	 * It has two options - restart and quit.
	 * 
	 * See PauseScreen for more information about constructing a screen.
	 * 
	 * @author beyamor
	 */
	public class GameOverScreen extends SubWindow 
	{
		private var _options:Vector.<HighlightableEntity> = new Vector.<HighlightableEntity>;
		
		/**
		 * Creates a new GameOverScreen.
		 * It is recommended that GameOverScreens be constructed using the GameOverScreen.description method.
		 */
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
		
		/**
		 * Supplies the option buttons which were provided in this game over screen.
		 */
		public function get options():Vector.<HighlightableEntity> {
			
			return _options;
		}
		
		/**
		 * Starts the construction of a new game over screen.
		 */
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
	
	/**
	 * Sets the dimensions of the screen.
	 * Note that this is optional. Default values will be used if not overriden.
	 */
	public function dimensions(width:uint, height:uint):GameOverScreenBuilder {
		
		_width	= width;
		_height	= height;
		return this;
	}
	
	/**
	 * Sets the restart option entity. Mandatory.
	 */
	public function restart(restartOption:HighlightableEntity):GameOverScreenBuilder {
		
		_restartOption = restartOption;
		return this;
	}
	
	/**
	 * Sets the quit option entity. Mandatory.
	 */
	public function quit(quitOption:HighlightableEntity):GameOverScreenBuilder {
		
		_quitOption = quitOption;
		return this;
	}
	
	/**
	 * Constructs the game over screen for some game world.
	 */
	public function buildFor(world:GameWorld):GameOverScreen {
		
		if (_restartOption == null)	throw new Error("Restart option is mandatory in quit screen");
		if (_quitOption == null)	throw new Error("Quit option is mandatory in quit screen");
		
		return new GameOverScreen(_width, _height, world, _restartOption, _quitOption); 
	}
}
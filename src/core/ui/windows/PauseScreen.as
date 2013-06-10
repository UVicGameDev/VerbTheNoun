package core.ui.windows 
{
	import core.games.Game;
	import core.games.GameWorld;
	import core.Keys;
	import core.ui.menus.HighlightableEntity;
	import core.ui.menus.VerticalSelectionList;
	import core.ui.windows.options.QuitOption;
	import core.ui.windows.options.RestartOption;
	import core.ui.windows.options.ResumeOption;
	import net.flashpunk.utils.Input;
	
	/**
	 * The player should be able to open the pause screen by pressing the pause button.
	 * It has up to three options - resume, restart, and quit. Restart is optional.
	 * It can also be closed by pressing cancel or pause.
	 * 
	 * A PauseScreen instance should be built using the builder supplied by the static description method.
	 * When building, HighlightableEntitys should be supplied for the resume, restart, and quit options.
	 * These HighlightableEntitys are the buttons for the options on the screen.
	 * It is expected that games will supply their own thematically approporiate buttons.
	 * 
	 * Additional decoration can be supplied by adding additional entities to the screen's view.
	 * 
	 * An example PauseScreen construction is supplied below:
	 * 
	 * 			var pauseScreen:PauseScreen	=	PauseScreen.description
	 *												.resume(MenuOption.lablled("resume"))
	 *												.restart(MenuOption.lablled("restart"))
	 *												.quit(MenuOption.lablled("quit"))
	 *												.buildFor(world);
	 *			(new MtmScreenDecorator).decorate(pauseScreen.view, pauseScreen.options, "pause");
	 * 
	 * @author beyamor
	 */
	public class PauseScreen extends Popup 
	{
		private var _options:Vector.<HighlightableEntity> = new Vector.<HighlightableEntity>;
		
		/**
		 * Creates a new PauseScreen.
		 * It is recommended that PauseScreens be constructed using the PauseScreen.description method.
		 */
		public function PauseScreen(
			width:uint,
			height:uint,
			world:GameWorld,
			resumeOption:HighlightableEntity,
			restartOption:HighlightableEntity,
			quitOption:HighlightableEntity)
		{
			super(width, height, world.windows);
			centerOnParent();
			
			var	selectionList:VerticalSelectionList = new VerticalSelectionList;
			updateables.add(selectionList);
			
			if (resumeOption) {
				
				_options.push(resumeOption);
				selectionList.add(new ResumeOption(this, resumeOption));
				view.add(resumeOption);
			} else throw new Error("Resume option is mandatory in pause screen");
			
			if (restartOption) {
				
				_options.push(restartOption);
				selectionList.add(new RestartOption(world.game, restartOption));
				view.add(restartOption);
			}
			
			if (quitOption) {
				
				_options.push(quitOption);
				selectionList.add(new QuitOption(world.game, quitOption));
				view.add(quitOption);
			} else throw new Error("Quit option is mandatory in pause screen");
		}
		
		override public function update():void 
		{
			super.update();
			if (Input.pressed(Keys.PAUSE)) close();
		}
		
		/**
		 * Supplies the option buttons which were provided in this pause screen.
		 */
		public function get options():Vector.<HighlightableEntity> {
			
			return _options;
		}
		
		/**
		 * Starts the construction of a new pause screen.
		 */
		public static function get description():PauseScreenBuilder {
			
			return new PauseScreenBuilder;
		}
	}
}
import core.games.GameWorld;
import core.ui.windows.PauseScreen;
import core.ui.menus.HighlightableEntity;

class PauseScreenBuilder {
	
	private var	_resumeOption:HighlightableEntity,
				_restartOption:HighlightableEntity,
				_quitOption:HighlightableEntity,
				_width:uint		= 400,
				_height:uint	= 300;
	
	/**
	 * Sets the dimensions of the screen.
	 * Note that this is optional. Default values will be used if not overriden.
	 */
	public function dimensions(width:uint, height:uint):PauseScreenBuilder {
		
		_width	= width;
		_height	= height;
		return this;
	}
	
	/**
	 * Sets the resume option entity. Mandatory.
	 */
	public function resume(resumeOption:HighlightableEntity):PauseScreenBuilder {
		
		_resumeOption = resumeOption;
		return this;
	}
	
	/**
	 * Sets the restart option entity. Optional.
	 */
	public function restart(restartOption:HighlightableEntity):PauseScreenBuilder {
		
		_restartOption = restartOption;
		return this;
	}
	
	/**
	 * Sets the quit option entity. Mandatory.
	 */
	public function quit(quitOption:HighlightableEntity):PauseScreenBuilder {
		
		_quitOption = quitOption;
		return this;
	}
	
	/**
	 * Constructs the pause screen for some game world.
	 */
	public function buildFor(world:GameWorld):PauseScreen {
		
		if (_resumeOption == null)	throw new Error("Resume option is mandatory in pause screen");
		if (_quitOption == null)	throw new Error("Quit option is mandatory in pause screen");
		
		return new PauseScreen(_width, _height, world, _resumeOption, _restartOption, _quitOption); 
	}
}
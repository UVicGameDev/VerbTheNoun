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
	 * It has three options - resume, restart, and quit.
	 * It can also be closed by pressing cancel or pause.
	 * It is decorated by a game-specific PauseScreenDecorator.
	 * 
	 * @author beyamor
	 */
	public class PauseScreen extends Popup 
	{
		private var _options:Vector.<HighlightableEntity> = new Vector.<HighlightableEntity>;
		
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
		
		public function get options():Vector.<HighlightableEntity> {
			
			return _options;
		}
		
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
				
	public function dimensions(width:uint, height:uint):PauseScreenBuilder {
		
		_width	= width;
		_height	= height;
		return this;
	}
	
	public function resume(resumeOption:HighlightableEntity):PauseScreenBuilder {
		
		_resumeOption = resumeOption;
		return this;
	}
	
	public function restart(restartOption:HighlightableEntity):PauseScreenBuilder {
		
		_restartOption = restartOption;
		return this;
	}
	
	public function quit(quitOption:HighlightableEntity):PauseScreenBuilder {
		
		_quitOption = quitOption;
		return this;
	}
	
	public function buildFor(world:GameWorld):PauseScreen {
		
		if (_resumeOption == null)	throw new Error("Resume option is mandatory in pause screen");
		if (_quitOption == null)	throw new Error("Quit option is mandatory in pause screen");
		
		return new PauseScreen(_width, _height, world, _resumeOption, _restartOption, _quitOption); 
	}
}
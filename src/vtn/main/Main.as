package vtn.main
{
	import core.GameConsts;
	import core.Keys;
	import flash.display.Sprite;
	import flash.events.Event;
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	
	/**
	 * ...
	 * @author Nick Pettyjohn
	 */
	public class Main extends Engine
	{
		public function Main()
		{

			super(GameConsts.WIDTH, GameConsts.HEIGHT, 60, false);
			FP.world = new MainMenuWorld;
			
			// TODO: Make these configurable
			Input.define(Keys.UP,			Key.UP, Key.W, Key.I);
			Input.define(Keys.DOWN,			Key.DOWN, Key.S, Key.K);
			Input.define(Keys.LEFT,			Key.LEFT, Key.A, Key.J);
			Input.define(Keys.RIGHT,		Key.RIGHT, Key.D, Key.L);
			Input.define(Keys.PRIMARY,		Key.X, Key.M, Key.SPACE, Key.ENTER);
			Input.define(Keys.SECONDARY,	Key.Z, Key.N, Key.BACKSPACE);
			Input.define(Keys.CONFIRM,		Key.X, Key.M, Key.SPACE, Key.ENTER);
			Input.define(Keys.CANCEL,		Key.Z, Key.N, Key.BACKSPACE);
			Input.define(Keys.PAUSE,		Key.ENTER, Key.ESCAPE);
		}
		override public function init():void
		{
			trace("FlashPunk has started successfully!");
		}
	}
	
}
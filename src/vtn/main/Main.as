package vtn.main
{
	import flash.display.Sprite;
	import flash.events.Event;
	import net.flashpunk.Engine;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Nick Pettyjohn
	 */
	public class Main extends Engine
	{
		public function Main()
		{

			super(Consts.GAME_WIDTH, Consts.GAME_HEIGHT, 60, false);
			FP.world = new MainMenuWorld;
		}
		override public function init():void
		{
			trace("FlashPunk has started successfully!");
		}
	}
	
}
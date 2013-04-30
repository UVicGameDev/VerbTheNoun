package games.dialThePhone.states 
{
	import core.util.UpdateList;
	import games.dialThePhone.DialThePhone;
	/**
	 * ...
	 * @author beyamor
	 */
	public class DialState implements GameState 
	{
		private var	game:DialThePhone,
					updateables:UpdateList;
		
		public function DialState(game:DialThePhone) 
		{
			this.game = game;
			
			updateables = new UpdateList(
				game.phoneView.updater,
				game.guyView.updater
			);
		}
		
		/* INTERFACE games.dialThePhone.states.GameState */
		
		public function enter():void 
		{
			
		}
		
		public function update():void 
		{
			updateables.update();
		}
		
		public function leave():void 
		{
			
		}
		
	}

}
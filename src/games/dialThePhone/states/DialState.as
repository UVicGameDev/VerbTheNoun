package games.dialThePhone.states 
{
	import core.context.ELUState;
	import core.util.UpdateList;
	import games.dialThePhone.DialThePhone;
	/**
	 * ...
	 * @author beyamor
	 */
	public class DialState implements ELUState 
	{
		private var	game:DialThePhone,
					updateables:UpdateList;
		
		public function DialState(game:DialThePhone) 
		{
			this.game = game;
			updateables = new UpdateList;
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
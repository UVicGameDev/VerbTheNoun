package games.dialThePhone.states 
{
	import core.context.ELUState;
	import core.util.UpdateList;
	import games.dialThePhone.DialThePhone;
	import games.dialThePhone.DialThePhoneWorld;
	/**
	 * ...
	 * @author beyamor
	 */
	public class DialState implements ELUState 
	{
		private var	world:DialThePhoneWorld,
					updateables:UpdateList;
		
		public function DialState(world:DialThePhoneWorld) 
		{
			this.world = world;
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
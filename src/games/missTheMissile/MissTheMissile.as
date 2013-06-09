package games.missTheMissile 
{
	import core.games.Game;
	import net.flashpunk.World;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class MissTheMissile extends Game 
	{
		
		public function MissTheMissile() 
		{
			
		}
		
		override protected function createGameWorld():World 
		{
			return new MissTheMissileWorld(this);
		}
	}

}
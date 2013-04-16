package games.missTheMissile 
{
	import core.Debug;
	import core.Game;
	import games.missTheMissile.entities.Player;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Text;
	
	/**
	 * ...
	 * @author beyamor
	 */
	public class MissTheMissile extends Game 
	{
		
		public function MissTheMissile() 
		{
			if (Debug.isEnabled) addGraphic(new Text("Miss the Missile"));
			
			add(new Player(FP.halfWidth, FP.halfHeight));
		}
		
	}

}